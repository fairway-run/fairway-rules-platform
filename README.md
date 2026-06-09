# Fairway Rules Platform

Reusable operating rules and templates for Fairway-tracked engineering work.

This repository captures project-independent lessons from agent-driven platform
engineering: planning, implementation, evidence, review, CI/CD, UAT, operations,
release, and closeout.

## Scope

This pack contains rules that can apply across many projects:

- contract-first development;
- generated-code and codegen validation;
- frontend e2e validation for user-visible changes;
- structured error and correlation-id handling;
- authorization and tenant/resource boundary checks;
- audit and event/outbox discipline;
- deploy-run and UAT finding taxonomy;
- deterministic utility-first CI/CD/UAT workflows;
- Fairway provider-session checkpoints;
- worktree merge and push-intent discipline;
- evidence-before-done and no-self-review.

This pack does not contain product-specific rules. Project/domain rules should
live in that project's own repository, for example:

```text
<project-org>/fairway-rules-<project>
```

External security guidance, such as Project CodeGuard, can be imported as a
separate rule source and mapped into a project profile.

## Relationship To Fairway

```text
Fairway = coordination control plane
fairway-rules-platform = reusable cross-project operating rules
project rule packs = product/domain-specific rules
external rule packs = imported guidance
```

Fairway should load rule packs, match rules to tasks, recommend evidence, show
applicable rules, and enforce configured blocking rules. Rule packs do not
record task state, approve reviews, or mutate repositories.

## Layout

```text
docs/       Adoption, authoring, and rule index
rules/
  core/       General engineering invariants
  security/   Cross-project security operating rules
  delivery/   CI/CD/UAT/release rules
  fairway/    Provider/session/worktree/review rules
templates/   Evidence and review packet templates
profiles/    Example profile bindings
examples/    Example Fairway configuration fragments
schemas/     Draft rule metadata schema
```

Start here:

- [Rule index](docs/rule-index.md)
- [Adoption guide](docs/adoption.md)
- [Rule authoring guide](docs/rule-authoring.md)

## Rule Metadata

Each rule is Markdown with a YAML front matter block:

```yaml
---
id: platform.contract-first
title: Contract changes precede implementation
version: 0.1.0
status: draft
applies_when:
  source_paths:
    - doc/api/**
  tags:
    - surface:api
risk_floor: medium
required_evidence:
  - contract-updated
review_domains:
  - architecture
  - backend
---
```

The body explains intent, examples, anti-patterns, required evidence, and review
notes.

## Initial Adoption

Use this pack as advisory guidance first:

```toml
[[rule_sources]]
name = "fairway-platform"
source = "github:fairway-run/fairway-rules-platform"
version = "v0.1.0"
mode = "advisory"
```

After a project has stable evidence and review packets, selected rules can move
to blocking mode in that project's Fairway config.

Recommended rollout:

1. Use advisory mode for all rules.
2. Record rule-selection evidence on high-risk tasks.
3. Promote a small subset to blocking mode.
4. Move project-specific behavior into the project rule pack.
5. Keep this repository focused on reusable cross-project practice.

## Ownership

Reusable rules belong here. Project-specific rules do not.

When a rule mentions a specific product, infrastructure topology, provider, or
runtime, move it to the relevant project rule pack.
