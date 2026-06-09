---
id: security.supply-chain-evidence
title: Release artifacts need supply-chain evidence
version: 0.1.0
status: draft
applies_when:
  tags:
    - surface:supply-chain
    - surface:registry
    - work-type:release
  source_paths:
    - .github/**
    - .gitlab-ci.yml
    - scripts/ci/**
    - Dockerfile
    - infra/**
risk_floor: high
required_evidence:
  - sbom
  - artifact-digest
  - provenance
  - signature-or-attestation-policy
review_domains:
  - security
  - ops
  - governance
stop_conditions:
  - artifact identity cannot be tied to source SHA
  - production release relies on development-local signatures
---

## Intent

Release and deploy artifacts should have traceable identity: source SHA, digest,
SBOM, provenance, and signature or attestation policy.

## Required Evidence

- Artifact digest.
- SBOM or package inventory.
- Provenance or build evidence.
- Signature/attestation evidence or approved exception.

## Anti-Patterns

- Deploying by mutable tag without digest evidence.
- Treating local checksum as production signing.
- Releasing without preserved evidence packet.
