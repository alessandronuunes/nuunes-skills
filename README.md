# nuunes-skills

Coleção pessoal de skills reutilizáveis para Claude Code, empacotadas no plugin `nuunes`. Instalou uma vez, toda skill nova que entrar aqui chega sozinha na atualização, com alias namespaced (`nuunes:nome-da-skill`) que nunca colide com skill local. Não é um repositório de nicho único — reúne o que for útil no dia a dia: escrita, debug, review, entrega, e o que mais for entrando.

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

### deliver (Entrega de ponta a ponta)

Leva um bug, feature, ticket ou spec até o fim: dimensiona o trabalho (pequeno, só documentos, médio ou grande), escolhe o modelo mais barato que ainda é seguro para a sessão e para cada agente, e segue o ritual do tamanho com TDD visível no git, revisão e verificação feitas por agentes que nunca viram a conversa, fix rounds em lote (no máximo três) e merge na branch base quando tudo passou. As tarefas são agrupadas em lotes de até quatro: o lote é construído inteiro rodando só os testes afetados, e as checagens completas, a revisão, a verificação e o CI rodam uma vez, no fim. A sessão lidera e delega; quem escreve código e teste são os agentes. Nada depende de o dono testar à mão, e o relatório final começa com `STATUS: MERGED`, `READY` ou `BLOCKED`.

A skill guarda o processo; os fatos de cada repo (qual agente faz cada papel, comandos, gates antes do push, branch base, bot de review, método de merge) ficam no perfil do repo, `.claude/deliver.md`. O formato do perfil está em `skills/deliver/references/profile.md`; sem perfil, a skill monta um a partir do repo e propõe ao dono.

Arquivos:

- `skills/deliver/SKILL.md` — dimensionamento, modelo da sessão, leitura do perfil, fluxo e relatório final
- `skills/deliver/references/` — regras com o porquê de cada uma, formato do perfil, modelos por papel, exemplos por tamanho e checklist de review
- `skills/deliver/evals/` — casos de teste com fixtures de repos fictícios
- `agents/blind-reviewer.md` — revisor cego principal (Opus), em dois eixos: padrões do repo e spec
- `agents/blind-verifier.md` — verificador cego (Sonnet): refaz as checagens completas em ambiente próprio, mapeia cada AC para evidência e tenta quebrar pelo menos cinco
- `agents/ci-watcher.md` — espera o CI (Haiku) e devolve um veredito curto
- `agents/design-critic.md` — crítica visual cega (Sonnet) a partir de screenshots

Cada repo que usar a `deliver` precisa do seu `.claude/deliver.md`. Os quatro agentes são genéricos e chegam com o plugin como `nuunes:blind-reviewer`, `nuunes:blind-verifier`, `nuunes:ci-watcher` e `nuunes:design-critic`.

## Instalação

### Como plugin do Claude Code (recomendado)

Dentro do Claude Code:

```
/plugin marketplace add alessandronuunes/nuunes-skills
/plugin install nuunes
```

Cada skill fica disponível com o alias `nuunes:nome-da-skill` (ex: `nuunes:escrita-ptbr`, `nuunes:browser-debug`, `nuunes:revisar-pr`, `nuunes:deliver`). Se você tiver outro plugin chamado `nuunes` em outro marketplace, desambigue com `/plugin install nuunes@nuunes`.

### Com a CLI de skills

```bash
npx skills add alessandronuunes/nuunes-skills
```

### Manual

Copie a pasta da skill desejada (ex: `skills/escrita-ptbr/`, `skills/browser-debug/`) para o diretório de skills do seu agente (por exemplo, `~/.claude/skills/`). A `revisar-pr` precisa também do subagente: copie `agents/revisor-pr.md` para `~/.claude/agents/`. A `deliver` precisa dos quatro: copie `agents/blind-reviewer.md`, `agents/blind-verifier.md`, `agents/ci-watcher.md` e `agents/design-critic.md` para `~/.claude/agents/` (e crie o `.claude/deliver.md` do repo).
