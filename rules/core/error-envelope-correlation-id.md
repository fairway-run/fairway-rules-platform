---
id: platform.error-envelope-correlation-id
title: User-facing errors carry safe messages and correlation IDs
version: 0.1.0
status: draft
applies_when:
  source_paths:
    - cmd/api/**
    - packages/**
    - web/**
  tags:
    - surface:api
    - surface:frontend
    - surface:error-handling
risk_floor: medium
required_evidence:
  - error-path-test
  - correlation-id-present
  - underlying-cause-logged-safely
review_domains:
  - backend
  - frontend
  - ops
stop_conditions:
  - user-visible raw framework or product dependency error
  - missing correlation id
  - sensitive detail exposed in response
---

## Intent

Users should receive safe, actionable error envelopes. Operators should be able
to find the underlying cause through logs or traces using the correlation ID.

## Required Evidence

- Error response contains a correlation ID.
- User message is safe and product-owned.
- Internal logs retain underlying cause without exposing secrets or PII.
- Regression covers the changed 4xx or 5xx path.

## Anti-Patterns

- Browser-visible framework exception pages.
- Generic `internal_error` without operator-visible root cause.
- Logging secrets while trying to make errors diagnosable.
