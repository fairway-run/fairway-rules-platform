---
id: security.no-query-string-tokens
title: Auth material must not be transported in query strings
status: draft
applies_when:
  source_paths:
    - cmd/api/**
    - packages/**
    - packages/web/**
    - web/**
  tags:
    - surface:auth
    - surface:websocket
    - surface:frontend
    - surface:api
risk_floor: high
required_evidence:
  - transport-reviewed
  - negative-test-or-e2e
  - logs-redacted
review_domains:
  - security
  - backend
  - frontend
stop_conditions:
  - token or credential appears in URL query parameters
  - logs can capture auth material
---

## Intent

Tokens, credentials, one-time secrets, and auth material must not appear in URL
query parameters. Browser-compatible exceptions, such as WebSocket subprotocol
auth, must be explicit and tested.

## When To Apply

Apply this rule when a task changes:

- login, logout, callback, or refresh flows;
- WebSocket or browser-connect auth;
- generated links or redirect URLs;
- API clients, SDKs, or frontend route guards;
- proxy or gateway auth behavior.

## Required Evidence

- Auth material transport reviewed.
- Test or e2e proves token is not placed in the URL.
- Logs and traces do not include auth material.

## Recommended Checks

- Inspect generated URLs.
- Inspect browser history or Playwright trace when relevant.
- Inspect logs/proxy traces for token leakage.
- Add a regression for the approved transport.

## Review Questions

- Where is the auth material carried?
- Could browser history, referrer headers, proxy logs, or screenshots expose it?
- Is any browser exception explicit and documented?

## If Blocked

Stop the feature path until an approved transport is selected. Do not ship a
temporary `?token=` path.

## Anti-Patterns

- `?token=...`
- Redirect URLs containing bearer tokens.
- WebSocket auth shortcuts that leak tokens into browser history or proxy logs.
