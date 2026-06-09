---
id: delivery.deploy-run-required
title: Meaningful CI deploy UAT or release attempts need deploy-run evidence
version: 0.1.0
status: draft
applies_when:
  tags:
    - gate:ci
    - gate:deploy
    - gate:uat
    - work-type:release
  task_kinds:
    - release-evidence
    - task
risk_floor: medium
required_evidence:
  - source-sha
  - environment
  - ci-deploy-or-uat-result
  - findings-classified
review_domains:
  - ops
  - governance
stop_conditions:
  - result is unknown
  - actionable finding has no follow-up task
---

## Intent

CI, deploy, smoke, UAT, and release attempts are operating events. They need a
durable record linking source SHA, environment, result, evidence, and findings.

## Required Evidence

- Source SHA or artifact digest.
- Target environment.
- CI/deploy/UAT result and evidence path.
- Actionable findings classified into scoped follow-up tasks.

## Anti-Patterns

- Treating a failed deploy as chat context only.
- Running UAT without recording which SHA and environment were tested.
- Combining unrelated findings into one broad cleanup task.
