---
id: platform.error-envelope-correlation-id
title: User-facing errors carry safe messages and correlation IDs
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

## When To Apply

Apply this rule when a task changes:

- API handlers;
- frontend error rendering;
- auth, bootstrap, or dependency failure paths;
- 4xx/5xx classification;
- proxy, gateway, or upstream error handling.

## Required Evidence

- Error response contains a correlation ID.
- User message is safe and product-owned.
- Internal logs retain underlying cause without exposing secrets or PII.
- Regression covers the changed 4xx or 5xx path.

## Recommended Checks

- Trigger the error path locally or in a smoke harness.
- Inspect the response body for safe code/message/correlation fields.
- Inspect logs/traces for root cause and redaction.

## Review Questions

- Can support find the root cause from the correlation ID?
- Is the user response free of secrets, SQL, stack traces, and dependency noise?
- Is the error classified as local defect, upstream error, or unavailable service?

## If Blocked

If the dependency or platform cannot expose the cause safely, add an ops/read
model or logging follow-up rather than weakening the user envelope.

## Anti-Patterns

- Browser-visible framework exception pages.
- Generic `internal_error` without operator-visible root cause.
- Logging secrets while trying to make errors diagnosable.
