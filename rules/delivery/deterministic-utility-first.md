---
id: delivery.deterministic-utility-first
title: Repetitive CI CD QA and UAT work should become deterministic utilities
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:local-automation
    - gate:ci
    - gate:deploy
    - gate:uat
  source_paths:
    - scripts/ci/**
    - scripts/ops/**
    - doc/operations/**
risk_floor: medium
required_evidence:
  - utility-output
  - deterministic-pass-fail-or-classification
review_domains:
  - ops
  - governance
stop_conditions:
  - agent is polling a machine-readable process without utility support
  - pass/fail depends on LLM interpretation
---

## Intent

Agents should not burn long sessions on deterministic monitoring, parsing, or
classification that a utility can perform. Utilities should own pass/fail,
structured output, and evidence packet generation. LLMs may summarize but not
decide.

## Required Evidence

- Utility command and output.
- Structured JSON or stable markdown evidence.
- Clear classification and follow-up recommendation when blocked.

## Anti-Patterns

- Agent polling CI for hours with no utility handback.
- LLM deciding whether a deployment passed from free-form logs.
- Repeated manual runbook commands that could be scripted safely.
