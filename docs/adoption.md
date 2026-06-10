# Adoption Guide

This guide explains how to introduce `fairway-rules-platform` into an existing
project without turning it into a blocking bureaucracy on day one.

## Adoption Stages

### Stage 1: Advisory

Use the rules as planning and review prompts.

Recommended configuration:

```toml
[[rule_sources]]
name = "fairway-platform"
source = "path:../fairway-rules-platform"
mode = "advisory"
```

Expected behavior:

- tasks can list applicable rules;
- review packets can cite relevant rules;
- missing evidence is visible but does not block merge-readiness;
- teams learn which rules fire too often, too late, or not at all.

Exit criteria:

- project maintainers agree which rules matter for the project;
- high-friction or irrelevant rules are disabled or scoped;
- project-specific rules are moved to the project rule pack.

### Stage 2: Evidence Required

Require rule-selection evidence for selected high-risk tasks.

Good first candidates:

- `platform.contract-first`;
- `delivery.frontend-e2e-required`;
- `security.no-query-string-tokens`;
- `security.authz-negative-tests`;
- `delivery.deploy-run-required`;
- `fairway.no-self-review`.

Expected behavior:

- tasks include selected rules in evidence packets;
- reviewers check whether selected rules were handled;
- missing evidence creates follow-up tasks or blocks task closeout by policy.

### Stage 3: Blocking

Selected rules become merge-ready or workflow-closeout blockers.

Recommended only after:

- the project has deterministic validation commands;
- evidence packet generation is stable;
- reviewer domains are clear;
- false positives have been reduced.

## Selecting Rules For A Task

Use the following order:

1. Match changed source paths and target paths.
2. Match Fairway tags.
3. Match task kind and risk level.
4. Add domain/project-specific rules from the project rule pack.
5. Add converted external guidance, such as a Fairway-native CodeGuard pack,
   where relevant.
6. Record non-applicable rationale for high-risk rules that looked relevant but
   were intentionally excluded.

## What Belongs In This Pack

Rules that apply across projects:

- evidence-before-done;
- no self-review;
- deploy-run required;
- worktree merge model;
- provider-session checkpoints;
- frontend e2e for visible UX;
- contract-first;
- deterministic utility-first.

## What Does Not Belong Here

Project/domain rules:

- product-specific API hierarchy;
- runtime-specific provisioning behavior;
- domain billing rules;
- environment-specific runbooks;
- provider-specific launch semantics.

Put those in:

```text
<project-org>/fairway-rules-<project>
```

## Using External Security Packs

External packs, such as Project CodeGuard, should be treated as guidance sources.
They are useful for security coverage, but they should not replace project
contracts, privacy rules, tenant-isolation requirements, or production
readiness gates.

Recommended model:

```text
platform rules -> baseline operating discipline
project rules -> domain-specific behavior
external security rules -> security coverage and review prompts
```

## Review Packet Minimum

A review packet should include:

- task id;
- commit or source SHA;
- selected rules;
- evidence paths;
- commands run;
- missing or non-applicable rules;
- required review domains;
- residual risk;
- follow-up tasks.

## Common Rollout Mistakes

- Making every rule blocking immediately.
- Encoding project-specific behavior in the platform pack.
- Treating rule selection as approval.
- Letting local LLM summaries determine pass/fail.
- Creating rules that do not name evidence or stop conditions.
