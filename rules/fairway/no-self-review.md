---
id: fairway.no-self-review
title: Review domains require independent review identity
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:review
    - gate:review
  task_kinds:
    - task
    - architecture-map
    - release-evidence
risk_floor: medium
required_evidence:
  - required-review-domains
  - independent-reviewer
review_domains:
  - governance
stop_conditions:
  - task owner approves its own required review domain without waiver
  - missing required review is treated as done
---

## Intent

Review domains are gates, not labels. Required review should come from an
independent reviewer identity or an explicit waiver with rationale.

## Required Evidence

- Required domains listed.
- Reviewer identity and domain recorded.
- Waiver recorded when exact independent review is impossible.

## Anti-Patterns

- Self-approving a high-risk implementation.
- Treating chat agreement as review evidence without Fairway record.
- Removing review domains to force merge-readiness without rationale.
