---
id: security.authz-negative-tests
title: Authorization-sensitive routes need negative boundary tests
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

## When To Apply

Apply this rule when a task changes:

- user/admin routes;
- tenant, organization, project, resource, or account scoping;
- read models or exports;
- service-account/API-key behavior;
- privileged operations.

## Required Evidence

- Stated ownership/scope boundary.
- Negative authorization tests.
- Error response reviewed for safe code/message/correlation behavior.

## Recommended Checks

- Test same user wrong project/resource.
- Test different role with insufficient permission.
- Test missing/expired/invalid token where relevant.
- Verify the error does not leak existence of unauthorized resources when that
  matters for the project.

## Review Questions

- What object owns the data?
- What principal is allowed?
- What negative cases prove denial?
- Is enforcement in backend/service code, not only UI?

## If Blocked

If ownership is ambiguous, stop and create an architecture decision. Do not
encode guessed ownership into route code.

## Anti-Patterns

- Testing only the authorized actor.
- Enforcing ownership in frontend only.
- Querying cross-domain data without explicit owner/scope guard.
