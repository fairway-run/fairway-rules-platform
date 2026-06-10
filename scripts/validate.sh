#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$root"

ruby - <<'RUBY'
require "yaml"

errors = []
Dir.glob("rules/**/*.md").sort.each do |path|
  text = File.read(path)
  unless text.start_with?("---\n")
    errors << "#{path}: missing YAML front matter"
    next
  end
  parts = text.split(/^---\s*$/, 3)
  if parts.length < 3
    errors << "#{path}: malformed YAML front matter"
    next
  end
  data = YAML.safe_load(parts[1], permitted_classes: [], aliases: false) || {}
  %w[id title status].each do |field|
    errors << "#{path}: missing #{field}" if data[field].nil? || data[field].to_s.strip.empty?
  end
  errors << "#{path}: per-rule version is not supported; version the pack source instead" if data.key?("version")
  if data["applies_when"].is_a?(Hash) && data["applies_when"].key?("risk_floor")
    errors << "#{path}: risk_floor must be top-level, not under applies_when"
  end
end

Dir.glob("{profiles,schemas}/**/*.yaml").sort.each do |path|
  YAML.safe_load(File.read(path), permitted_classes: [], aliases: false)
rescue Psych::SyntaxError => e
  errors << "#{path}: #{e.message}"
end

if errors.any?
  warn errors.join("\n")
  exit 1
end

puts "rule pack validation ok"
RUBY

git diff --check
