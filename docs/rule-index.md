# Rule Index

## Core

| Rule | Purpose |
|---|---|
| `platform.contract-first` | API/event/SDK contract changes precede implementation. |
| `platform.evidence-before-done` | Work cannot be marked done without durable evidence and a matching status decision. |
| `platform.error-envelope-correlation-id` | User-safe errors include correlation IDs and preserve operator diagnosis. |
| `platform.api-first-ops-verification` | Repeated ops verification uses APIs, read models, or deterministic utilities. |

## Delivery

| Rule | Purpose |
|---|---|
| `delivery.deploy-run-required` | Meaningful CI/deploy/UAT/release attempts produce deploy-run evidence. |
| `delivery.frontend-e2e-required` | User-visible frontend changes run matching e2e validation. |
| `delivery.deterministic-utility-first` | Repetitive CI/CD/QA/UAT work becomes deterministic utility output. |

## Fairway

| Rule | Purpose |
|---|---|
| `fairway.provider-session-checkpoints` | Provider sessions checkpoint start, wait, stale/failure, and completion. |
| `fairway.worktree-merge-model` | Lane work merges through orchestrator/reviewer paths; remote push needs intent. |
| `fairway.no-self-review` | Required review domains need independent review identity or explicit waiver. |

## Security

| Rule | Purpose |
|---|---|
| `security.no-query-string-tokens` | Auth material must not be transported in URL query strings. |
| `security.authz-negative-tests` | Authorization-sensitive routes require negative boundary tests. |
| `security.supply-chain-evidence` | Release artifacts need digest, SBOM, provenance, and signing/attestation evidence. |

## Suggested First Blocking Rules

Most projects should start with these in advisory mode, then make them blocking
after two or three clean task cycles:

- `platform.evidence-before-done`
- `fairway.no-self-review`
- `delivery.deploy-run-required`
- `platform.contract-first`
- `delivery.frontend-e2e-required`
- `security.no-query-string-tokens`

## Templates

| Template | Purpose |
|---|---|
| `templates/task-classification.md` | Classify task scope, risk, applicable rules, evidence, and reviews. |
| `templates/review-packet.md` | Capture review scope, evidence, rules, and decision. |
| `templates/deploy-run.md` | Capture CI/deploy/UAT/release attempt evidence and findings. |
| `templates/finding.md` | Capture CI/CD/UAT/ops/harness/docs/security findings with root cause and follow-up. |
| `templates/security-rule-selection.md` | Capture selected security rules and non-applicable rationale. |
