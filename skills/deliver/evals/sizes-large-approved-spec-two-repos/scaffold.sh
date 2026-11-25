#!/usr/bin/env bash
set -euo pipefail
fixture="$(cd "$(dirname "${BASH_SOURCE[0]}")/../fixtures/billing-gateway" && pwd)"
cp "$fixture/CLAUDE.md" .
mkdir -p .claude
cp -R "$fixture/dot-claude/." .claude/
mkdir -p .scratch/lancamentos
cp "$fixture/scratch/lancamentos/arquitetura.md" .scratch/lancamentos/
