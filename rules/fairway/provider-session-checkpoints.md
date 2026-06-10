---
id: fairway.provider-session-checkpoints
title: Provider sessions must checkpoint start wait stale failure and completion
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

## When To Apply

Apply this rule when a task uses:

- a long-running Codex, Claude, Gemini, shell, or tmux session;
- a delegated provider session;
- CI/deploy/UAT monitoring;
- work that may wait for approval or external state.

## Required Evidence

- Provider session registered.
- Task associated with the session.
- Started or active checkpoint recorded.
- Waiting/stale/failure checkpoints recorded when applicable.
- Completed, blocked, or handoff checkpoint recorded before ending.

## Recommended Checks

- Confirm session status before editing.
- Record `waiting_on_input`, `waiting_on_approval`, `stale`, or `failed` when
  the session stops making progress.
- Reconcile active sessions before ending a work block.

## Review Questions

- Can the dashboard show who is working?
- Are waits and approvals visible outside the provider transcript?
- Did completion create evidence and a status decision?

## If Blocked

If the provider cannot report state, create a local monitor or handoff note and
mark the task stale or awaiting input rather than leaving it silently active.

## Anti-Patterns

- Marking work in progress without an active session or explanation.
- External provider waits that are visible only on a screen.
- Ending a session without task status reconciliation.
