# nuunes-skills

Coleção pessoal de skills reutilizáveis para Claude Code, empacotadas no plugin `nuunes`. Instalou uma vez, toda skill nova que entrar aqui chega sozinha na atualização, com alias namespaced (`nuunes:nome-da-skill`) que nunca colide com skill local. Não é um repositório de nicho único — reúne o que for útil no dia a dia: escrita, debug, e o que mais for entrando.

## Skills

### escrita-ptbr (Linguagem humana)

Escreve, revisa e audita artigos, posts, tutoriais e guias em PT-BR com voz humana — foco em ritmo de frase, pontuação e tom autoral, sem cara de texto gerado por máquina. Três modos de operação: escrever do zero, edição cirúrgica de texto existente e detecção de padrões de IA sem alterar nada.

Arquivos:

- `skills/escrita-ptbr/SKILL.md` — instruções principais, modos de operação e checklist
- `skills/escrita-ptbr/eval.md` — checagens objetivas de passa ou não passa que a skill roda sobre a própria saída
- `skills/escrita-ptbr/references/` — antipadrões, pontuação/ritmo, voz e calibração

### browser-debug (Debug de front-end no Chrome)

Investiga bugs de front-end direto no navegador — console, network e código até a causa raiz. Reproduz o problema, coleta evidência bruta, levanta hipóteses concorrentes e descarta por evidência, não por intuição. Nunca faz ação destrutiva nem dispara dialogs nativos do browser.

Arquivos:

- `skills/browser-debug/SKILL.md` — ordem de investigação, regras rígidas e formato do relatório final
- `skills/browser-debug/eval.md` — checklist de sucesso do dispatch

### revisar-pr (Code review de PR feita com IA)

Revisa PRs de outro dev, com foco em código gerado por IA: se quebra produção, se segue o padrão que o repo já tem, se reutiliza em vez de inventar (helper do framework, componente da lib de UI) e se um humano consegue manter sem IA. A skill coordena e dispara um subagente `revisor-pr` (Sonnet) por repo, em paralelo; o subagente roda os gates num worktree de review, valida cada achado antes de reportar e devolve um relatório por PR com nível (bloqueante, deve ajustar, sugestão). Nada é postado no GitHub sem confirmação.

Autor padrão, repos, pastas locais e repos que conversam entre si ficam fora do repositório, em `~/.claude/revisar-pr.local.md` (opcional).

Arquivos:

- `skills/revisar-pr/SKILL.md` — coordenação: o que revisar, disparo dos agentes, conferência e entrega
- `skills/revisar-pr/eval.md` — checklist de sucesso do review
- `agents/revisor-pr.md` — o subagente: checklist completo, validação dos achados e formato do relatório

## Instalação

### Como plugin do Claude Code (recomendado)

Dentro do Claude Code:

```
/plugin marketplace add alessandronuunes/nuunes-skills
/plugin install nuunes
```

Cada skill fica disponível com o alias `nuunes:nome-da-skill` (ex: `nuunes:escrita-ptbr`, `nuunes:browser-debug`, `nuunes:revisar-pr`). Se você tiver outro plugin chamado `nuunes` em outro marketplace, desambigue com `/plugin install nuunes@nuunes`.

### Com a CLI de skills

```bash
npx skills add alessandronuunes/nuunes-skills
```

### Manual

Copie a pasta da skill desejada (ex: `skills/escrita-ptbr/`, `skills/browser-debug/`) para o diretório de skills do seu agente (por exemplo, `~/.claude/skills/`). A `revisar-pr` precisa também do subagente: copie `agents/revisor-pr.md` para `~/.claude/agents/`.
