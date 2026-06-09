---
id: security.no-query-string-tokens
title: Auth material must not be transported in query strings
version: 0.1.0
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

## Required Evidence

- Auth material transport reviewed.
- Test or e2e proves token is not placed in the URL.
- Logs and traces do not include auth material.

## Anti-Patterns

- `?token=...`
- Redirect URLs containing bearer tokens.
- WebSocket auth shortcuts that leak tokens into browser history or proxy logs.
