---
id: platform.evidence-before-done
title: Evidence is required before marking work done
status: draft
applies_when:
  task_kinds:
    - task
    - architecture-map
    - release-evidence
    - bug
  tags:
    - work-type:implementation
    - work-type:utility
    - work-type:architecture-map
risk_floor: low
required_evidence:
  - command-or-artifact-evidence
  - status-decision
review_domains:
  - governance
stop_conditions:
  - no durable proof exists
  - evidence indicates partial, failed, or blocked work
related_rules:
  - fairway.no-self-review
---

## Intent

Task status should reflect verified state, not agent confidence. Work is not
done until evidence exists and the task status decision matches that evidence.

## When To Apply

Apply this rule to every non-trivial task. Low-risk documentation edits may use
a simple validation note, but implementation, review, CI/CD, UAT, and release
work need durable evidence.

## Required Evidence

- Test, validation, review, deploy, UAT, or doc evidence attached to the task.
- Explicit status decision: done, blocked, needs follow-up, or reset.
- Follow-up tasks for partial or failed results.

## Recommended Checks

- Confirm evidence exists before setting terminal status.
- Reconcile active sessions after status changes.
- Check that failing evidence did not leave the task marked done.

## Review Questions

- Does evidence prove the acceptance checks?
- Is the task status consistent with the evidence?
- Were partial results split into follow-up tasks?

## If Blocked

Do not mark done. Record a blocked or needs-follow-up checkpoint with the
specific missing evidence and next owner.

## Anti-Patterns

- Marking done from a summary without evidence.
- Leaving `in_progress` after pass/fail evidence has been recorded.
- Using `todo` as a hidden partial-completion state without a checkpoint.
