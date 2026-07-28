# nuunes-skills

Coleção de skills reutilizáveis para escrita em português brasileiro.

## Skills

### escrita-artigos-ptbr (Linguagem humana)

Escreve, revisa e audita artigos, posts, tutoriais e guias em PT-BR com voz humana — foco em ritmo de frase, pontuação e tom autoral, sem cara de texto gerado por máquina. Três modos de operação: escrever do zero, edição cirúrgica de texto existente e detecção de padrões de IA sem alterar nada.

Arquivos:

- `skills/escrita-artigos-ptbr/SKILL.md` — instruções principais, modos de operação e checklist
- `skills/escrita-artigos-ptbr/eval.md` — checagens objetivas de passa ou não passa que a skill roda sobre a própria saída
- `skills/escrita-artigos-ptbr/references/` — antipadrões, pontuação/ritmo, voz e calibração

## Instalação

### Como plugin do Claude Code (recomendado)

Dentro do Claude Code:

```
/plugin marketplace add alessandronuunes/nuunes-skills
/plugin install nuunes-skills@nuunes-skills
```

### Com a CLI de skills

```bash
npx skills add alessandronuunes/nuunes-skills
```

### Manual

Copie a pasta `skills/escrita-artigos-ptbr/` para o diretório de skills do seu agente (por exemplo, `~/.claude/skills/`).
