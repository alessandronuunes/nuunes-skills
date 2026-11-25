---
tags: [deliver]
max_turns: 15
timeout_seconds: 600
allowed_tools: [Read, Glob, Grep, Skill, Bash]
---

a arquitetura dos lançamentos de cobrança já está aprovada por mim em `.scratch/lancamentos/arquitetura.md` (fluxo, tabela, classes e a divisão em PRs). são três PRs: uma no pacote `acme/billing`, que sai como 2.3.1, e duas neste repositório, que depende do pacote pelo Composer; a primeira daqui tem migration. não edite nada. descreva o plano: tamanho, modelo da sessão, por onde começa, a ordem entre os dois repositórios e quem faz cada coisa.
