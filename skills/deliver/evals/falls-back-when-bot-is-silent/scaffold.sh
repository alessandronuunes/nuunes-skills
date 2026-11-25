#!/usr/bin/env bash
set -euo pipefail
fixture="$(cd "$(dirname "${BASH_SOURCE[0]}")/../fixtures/billing-gateway" && pwd)"
cp "$fixture/CLAUDE.md" .
mkdir -p .claude
cp -R "$fixture/dot-claude/." .claude/
sed -i.bak 's/^- Review bot: no$/- Review bot: yes, on draft PRs, heading "Revisão automática (bot)"/' .claude/deliver.md
rm .claude/deliver.md.bak
