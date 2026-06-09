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

## When To Apply

Apply this rule when a task changes:

- public HTTP routes;
- event payloads or subjects;
- generated SDK/client types;
- frontend API consumption;
- request or response shape;
- route error codes or pagination behavior.

If the implementation changes behavior without changing the contract, record
evidence that the contract already covered the behavior.

## Required Evidence

- Contract file or fragment changed first, or explicit evidence that no contract
  change was needed.
- Generated artifacts are updated and clean.
- Focused tests prove the new behavior.
- Review notes identify affected clients or consumers.

## Recommended Checks

- Run the project contract validation gate.
- Regenerate clients and enforce a clean generated tree.
- Run focused backend and frontend tests for the touched contract.

## Review Questions

- Did the contract change precede implementation?
- Are generated artifacts committed with the contract change?
- Does the frontend or SDK consume the new shape safely?
- Are backward compatibility or migration concerns documented?

## If Blocked

Stop implementation when contract ownership is unclear. Create or route an
architecture task to decide the contract first.

## Anti-Patterns

- Updating handlers and letting the contract catch up later.
- Committing stale generated clients.
- Treating frontend API consumption changes as frontend-only work.
