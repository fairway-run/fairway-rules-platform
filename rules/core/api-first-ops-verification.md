---
id: platform.api-first-ops-verification
title: Repeated ops verification should use APIs or explicit read models
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:ops
    - surface:read-model
    - work-type:ops-change
  source_paths:
    - scripts/ops/**
    - doc/operations/**
    - cmd/api/**
risk_floor: medium
required_evidence:
  - api-or-read-model-used
  - direct-db-exception-or-gap-task
review_domains:
  - ops
  - backend
stop_conditions:
  - repeated direct database query has no owning API/read-model follow-up
  - ad hoc command becomes operational dependency
---

## Intent

Operational checks should be repeatable through APIs, read models, or
deterministic utilities. Direct database inspection is acceptable for discovery,
but repeated use is evidence of a missing operator surface.

## Required Evidence

- API, read model, or utility used for the verification.
- If direct DB inspection was needed, record why and create a follow-up task for
  the missing surface.
- Output is captured as structured evidence when possible.

## Anti-Patterns

- Repeating `psql` inspection as the operational runbook.
- Debug commands that cannot be safely replayed by another operator.
- Using an LLM transcript as the only source of operational truth.
