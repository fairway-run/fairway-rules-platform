---
id: security.authz-negative-tests
title: Authorization-sensitive routes need negative boundary tests
version: 0.1.0
status: draft
applies_when:
  source_paths:
    - cmd/api/**
    - packages/**
    - doc/api/**
  tags:
    - surface:api
    - surface:authz
    - surface:tenant-isolation
risk_floor: high
required_evidence:
  - negative-authz-test
  - ownership-boundary-stated
  - error-code-reviewed
review_domains:
  - security
  - backend
  - architecture
stop_conditions:
  - ownership boundary is unclear
  - only happy-path authorization is tested
---

## Intent

Any route or service path that reads or mutates scoped data must prove that the
wrong actor, tenant, project, or resource owner is rejected.

## Required Evidence

- Stated ownership/scope boundary.
- Negative authorization tests.
- Error response reviewed for safe code/message/correlation behavior.

## Anti-Patterns

- Testing only the authorized actor.
- Enforcing ownership in frontend only.
- Querying cross-domain data without explicit owner/scope guard.
