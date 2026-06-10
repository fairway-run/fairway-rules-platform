---
id: fairway.no-self-review
title: Review domains require independent review identity
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

## When To Apply

Apply this rule to medium, high, critical, launch-sensitive, security-sensitive,
release, deploy, auth, infrastructure, and shared-service changes.

## Required Evidence

- Required domains listed.
- Reviewer identity and domain recorded.
- Waiver recorded when exact independent review is impossible.

## Recommended Checks

- Check task owner and reviewer identity.
- Check required review domains from task metadata and profile rules.
- Use explicit waiver behavior when domain ownership makes exact review
  impossible.

## Review Questions

- Is the reviewer independent from the implementation owner?
- Are required domains appropriate for the risk?
- Is any waiver explicit, reasoned, and scoped?

## If Blocked

Route to a different reviewer or record a governance-approved waiver. Do not
remove the review domain just to make merge-ready pass.

## Anti-Patterns

- Self-approving a high-risk implementation.
- Treating chat agreement as review evidence without Fairway record.
- Removing review domains to force merge-readiness without rationale.
