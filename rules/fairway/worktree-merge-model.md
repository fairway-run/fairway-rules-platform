---
id: fairway.worktree-merge-model
title: Work happens in lanes and is merged through a reviewer or orchestrator path
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:worktree
    - surface:branch
    - work-type:implementation
  source_paths:
    - .fairway/**
    - doc/operations/**
risk_floor: medium
required_evidence:
  - local-branch-or-worktree
  - merge-or-closeout-check
  - push-intent-when-remote
review_domains:
  - governance
  - ops
stop_conditions:
  - remote task branch exists without push intent
  - implementation lane bypasses review or orchestrator merge path
---

## Intent

Scratch implementation can happen in lane worktrees. Remote branch sprawl should
not be the default. A reviewer or orchestrator path should merge verified lane
work into the configured main branch and push coherent batches.

## When To Apply

Apply this rule when multiple implementation lanes, worktrees, or branches are
active, or when a task may push to a remote branch.

## Required Evidence

- Worktree/branch closeout result.
- Merge, cherry-pick, or preservation decision.
- Push intent for any remote branch.
- CI/deploy/UAT evidence for the integrated SHA when applicable.

## Recommended Checks

- Keep implementation branches local unless remote push intent is recorded.
- Merge or cherry-pick reviewed lane work into the configured main branch.
- Run CI on integrated mainline batches when possible.
- Use closeout utilities before deleting branches or worktrees.

## Review Questions

- Is the remote branch necessary?
- Is there push intent?
- Has the implementation lane been reviewed or merged through the orchestrator?
- Are old branches/worktrees safe to clean?

## If Blocked

Preserve the branch or worktree and record why. Do not delete or overwrite
unmerged or dirty work.

## Anti-Patterns

- Starting a new remote branch for every small task.
- Pushing implementation branches without review, CI plan, or push intent.
- Leaving merged local worktrees and branches unclosed.
