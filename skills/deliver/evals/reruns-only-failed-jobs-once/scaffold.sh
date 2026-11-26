#!/usr/bin/env bash
set -euo pipefail
fixture="$(cd "$(dirname "${BASH_SOURCE[0]}")/../fixtures/portal-app" && pwd)"
cp "$fixture/CLAUDE.md" .
mkdir -p .claude
cp -R "$fixture/dot-claude/." .claude/
