---
id: delivery.deploy-run-required
title: Meaningful CI deploy UAT or release attempts need deploy-run evidence
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

## When To Apply

Apply this rule when a task:

- pushes a SHA that triggers meaningful CI;
- deploys to any shared environment;
- runs smoke, UAT, release verification, or rollback proof;
- records production-readiness evidence.

## Required Evidence

- Source SHA or artifact digest.
- Target environment.
- CI/deploy/UAT result and evidence path.
- Actionable findings classified into scoped follow-up tasks.

## Recommended Checks

- Record the pipeline or deploy URL.
- Record expected completion window before waiting.
- Use a deterministic monitor utility where available.
- Classify findings as CI, CD, UAT, ops, harness, docs, or security work.

## Review Questions

- Is the tested SHA clear?
- Is the target environment clear?
- Are failures linked to scoped follow-up tasks?
- Is the deploy-run closed, blocked, or intentionally left active?

## If Blocked

Keep the deploy-run open or blocked. Do not bury unresolved deploy or UAT
findings inside a successful implementation task.

## Anti-Patterns

- Treating a failed deploy as chat context only.
- Running UAT without recording which SHA and environment were tested.
- Combining unrelated findings into one broad cleanup task.
