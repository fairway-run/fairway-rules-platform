# Rule Authoring Guide

Rules should be short, concrete, and enforceable. A good rule answers:

- When does this apply?
- What evidence is required?
- Which reviewers need to look?
- What commands or checks are recommended?
- What conditions should stop the task?
- What common mistakes does this prevent?

## Required Sections

Every rule file must include YAML front matter with:

- `id`
- `title`
- `status`

Rules do not carry per-rule versions. Version or pin the rule-pack source as a
unit.

The body should include:

- Intent
- When To Apply
- Required Evidence
- Recommended Checks
- Review Questions
- If Blocked
- Anti-Patterns

## Rule IDs

Use a stable namespace:

```text
platform.*
delivery.*
fairway.*
security.*
```

Project packs should use project namespaces:

```text
gpuaas.*
payments.*
docs.*
```

## Status

Use:

- `draft`: usable, but not yet stable enough for blocking mode;
- `active`: stable enough for advisory or blocking use;
- `deprecated`: retained for compatibility or history.

## Applicability

Use `applies_when` to make the rule matchable:

```yaml
applies_when:
  source_paths:
    - cmd/api/**
  tags:
    - surface:api
  task_kinds:
    - task
```

Avoid overbroad matching. A noisy rule will be ignored.

## Evidence Names

Evidence names should describe durable proof, not activity:

Good:

```text
frontend-e2e
generated-artifacts-clean
negative-authz-test
provider-session-started
```

Weak:

```text
looked-at-code
agent-says-ok
manual-check
```

## Blocking Rules

A rule is ready for blocking mode only when:

- false positives are understood;
- required evidence is deterministic;
- owners know how to satisfy it;
- there is a documented exception or waiver path;
- the rule is not project-specific unless it lives in the project rule pack.

## Relationship To Templates

Templates should collect evidence for rules. Rules should not become long
templates, and templates should not hide rule requirements.

Use:

```text
Rule -> says what is required
Template -> captures proof
Fairway -> records and checks evidence
```
