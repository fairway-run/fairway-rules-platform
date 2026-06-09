---
id: delivery.frontend-e2e-required
title: User-visible frontend changes require matching e2e validation
version: 0.1.0
status: draft
applies_when:
  source_paths:
    - packages/web/**
    - web/**
    - app/**
  tags:
    - surface:frontend
    - surface:ux
    - surface:navigation
    - surface:auth
risk_floor: medium
required_evidence:
  - frontend-unit-or-typecheck
  - frontend-e2e
  - focused-scope-rationale
recommended_commands:
  - make verify-web
  - bash scripts/ci/frontend_e2e.sh
review_domains:
  - frontend
  - architecture
stop_conditions:
  - touched user journey is not covered by the selected e2e run
  - route guard or auth redirect changed without browser-flow validation
---

## Intent

User-visible UX, navigation, role/persona flows, route guards, auth redirects,
browser-connect flows, and frontend API consumption changes must be validated
with the matching frontend e2e gate before completion.

## When To Apply

Apply this rule when a task changes:

- navigation, shell, route guards, or redirects;
- account/security, login, or session surfaces;
- browser-connect or app-open flows;
- frontend API calls or generated clients;
- visible error, loading, empty, or blocked states.

## Required Evidence

- Type/unit validation.
- Full or focused e2e command and result.
- Rationale when the e2e matrix is narrowed.
- Artifact or log path.

## Recommended Checks

- Run the project frontend verification command.
- Run the full frontend e2e gate unless a focused spec fully covers the changed
  journey.
- Record why a focused run was sufficient.

## Review Questions

- Which user journey changed?
- Which e2e spec covers it?
- Did route guard/auth/session behavior change?
- Are generated API clients current?

## If Blocked

If e2e cannot run because the harness is wrong or flaky, create a harness-fix
task. Do not mark the product change done without explicit blocked evidence.

## Anti-Patterns

- Relying on component tests after changing navigation or auth flow.
- Running Playwright manually against an uncontrolled localhost server.
- Discovering stale generated API clients only after CI.
