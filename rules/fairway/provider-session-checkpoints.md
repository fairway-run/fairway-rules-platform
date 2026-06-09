---
id: fairway.provider-session-checkpoints
title: Provider sessions must checkpoint start wait stale failure and completion
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:fairway
    - surface:provider-session
    - work-type:implementation
  task_kinds:
    - task
    - release-evidence
risk_floor: medium
required_evidence:
  - provider-session-started
  - active-checkpoint
  - completion-or-handoff
review_domains:
  - governance
  - ops
stop_conditions:
  - task is in_progress without session or fresh checkpoint
  - provider is waiting but Fairway has no waiting checkpoint
---

## Intent

The durable unit is the Fairway task, not a provider chat. Every long-running or
delegated provider session must be visible through Fairway checkpoints.

## Required Evidence

- Provider session registered.
- Task associated with the session.
- Started or active checkpoint recorded.
- Waiting/stale/failure checkpoints recorded when applicable.
- Completed, blocked, or handoff checkpoint recorded before ending.

## Anti-Patterns

- Marking work in progress without an active session or explanation.
- External provider waits that are visible only on a screen.
- Ending a session without task status reconciliation.
