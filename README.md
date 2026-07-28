# nuunes-skills

Coleção de skills reutilizáveis para escrita em português brasileiro.

## Skills

### escrita-artigos-ptbr (Linguagem humana)

Escreve, revisa e audita artigos, posts, tutoriais e guias em PT-BR com voz humana — foco em ritmo de frase, pontuação e tom autoral, sem cara de texto gerado por máquina. Três modos de operação: escrever do zero, edição cirúrgica de texto existente e detecção de padrões de IA sem alterar nada.

Arquivos:

- `escrita-artigos-ptbr/SKILL.md` — instruções principais, modos de operação e checklist
- `escrita-artigos-ptbr/eval.md` — checagens objetivas de passa ou não passa que a skill roda sobre a própria saída
- `escrita-artigos-ptbr/references/` — antipadrões, pontuação/ritmo, voz e calibração

## Instalação

Com a CLI de skills:

```bash
npx skills add alessandronuunes/nuunes-skills
```

Ou manualmente: copie a pasta `escrita-artigos-ptbr/` para o diretório de skills do seu agente (por exemplo, `~/.claude/skills/`).
