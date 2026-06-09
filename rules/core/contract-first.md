---
id: platform.contract-first
title: Contract changes precede implementation
version: 0.1.0
status: draft
applies_when:
  source_paths:
    - doc/api/**
    - openapi/**
    - asyncapi/**
    - cmd/api/**
    - packages/**/gen/**
  tags:
    - surface:api
    - surface:contract
    - surface:frontend
  task_kinds:
    - task
    - architecture-map
risk_floor: medium
required_evidence:
  - contract-updated
  - generated-artifacts-clean
  - focused-tests
recommended_commands:
  - make codegen
  - CODEGEN_ENFORCE_CLEAN=1 bash scripts/ci/sdk_codegen_smoke.sh
review_domains:
  - architecture
  - backend
  - frontend
stop_conditions:
  - contract behavior is ambiguous
  - generated artifacts drift unexpectedly
  - implementation changes response shape without contract update
related_rules:
  - platform.evidence-before-done
---

## Intent

Public API, event, SDK, or generated-client behavior must be defined in the
contract before implementation changes. Code follows the contract.

## Required Evidence

- Contract file or fragment changed first, or explicit evidence that no contract
  change was needed.
- Generated artifacts are updated and clean.
- Focused tests prove the new behavior.
- Review notes identify affected clients or consumers.

## Anti-Patterns

- Updating handlers and letting the contract catch up later.
- Committing stale generated clients.
- Treating frontend API consumption changes as frontend-only work.
