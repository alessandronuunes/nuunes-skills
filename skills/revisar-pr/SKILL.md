---
name: revisar-pr
description: >-
  Code review das PRs de outro dev, pensado para código gerado com IA ("vibe coding"): verifica
  se quebra o sistema, se segue o padrão já existente no repo, se reutiliza em vez de criar, se
  usa helper do framework e componente da lib de UI em vez de inventar, e se um humano consegue
  manter o código sem IA. Use quando o usuário pedir "revisa a PR", "analisa as PRs do fulano",
  "posso mergear?", "ele está seguindo o padrão?", ou colar um link de PR.
---

# Revisar PR

Esta skill **coordena**. Quem lê diff, roda testes e aplica o checklist é o subagente
`revisor-pr` (Sonnet; no plugin aparece como `nuunes:revisor-pr`). Assim o diff, os logs de teste
e os arquivos lidos ficam no contexto dele, e a sessão principal só recebe o relatório.

Nunca poste nada no GitHub (comentário, review, approve, merge) sem o usuário mandar.

## 0. Configuração local (opcional)

Se existir `~/.claude/revisar-pr.local.md`, leia antes de tudo. É onde o usuário guarda o que
não vai para um repo público:

- **Autor padrão**: login do GitHub de quem costuma abrir as PRs ("as PRs do fulano").
- **Tabela de repos**: repo do GitHub → pasta local → worktree de review.
- **Repos irmãos**: quais repos conversam entre si (contrato de API, eventos, payload).
- **Contexto fixo**: autorizações e regras que valem para todo review.

Sem esse arquivo, descubra pelo pedido e pela máquina: o repo vem do link da PR, a pasta local
sai de `git remote -v`, e o que faltar você pergunta em uma linha.

## 1. Descobrir o que revisar

- Link ou número → aquela PR.
- "as PRs do <login>" → `gh pr list -R <repo> --author <login> --state open --json number,title`
  em cada repo da tabela.

Cada repo tem um worktree de review separado do checkout principal, irmão dele:
`<pasta>-wt-review`. Se não existir: `git -C <pasta> worktree add ../<pasta>-wt-review --detach`.

Diga ao usuário, em uma linha, quantas PRs vão ser revisadas e em quais repos.

## 2. Disparar os agentes

**Um `revisor-pr` por repo**, todos na mesma mensagem para rodarem em paralelo. Nunca dois agentes
no mesmo repo, porque eles disputariam o mesmo worktree. As PRs de um repo vão juntas para o mesmo
agente, que também simula a ordem de merge entre elas.

Prompt de cada agente: repo GitHub, pasta local, caminho do worktree, lista de PRs (número +
título), os repos irmãos com as pastas locais, e qualquer contexto que o usuário deu na conversa
ou no arquivo local (ex.: "essa integração tem que seguir o modelo da integração X", "eu autorizei
a escrita no sistema do cliente em tal data").

PR solitária e pequena (menos de ~100 linhas de diff) pode ser revisada direto na sessão, sem
agente, aplicando o checklist do `revisor-pr` (`agents/revisor-pr.md` do plugin, ou
`~/.claude/agents/revisor-pr.md` na instalação manual).

PR gigante (mais de ~1500 linhas com vários concerns independentes) pode ganhar um segundo
`revisor-pr` só para ela, com o foco escrito no prompt (ex.: "só a migration e o job de sync").
Os dois não podem usar o mesmo worktree: crie um `<pasta>-wt-review2`. Ambos recebem o diff
inteiro; o foco só diz o que é responsabilidade de cada um.

## 3. Conferir antes de entregar

O agente roda em Sonnet e pode errar. O que ele concluiu é candidato, não prova. Antes de repassar:

- **Todo bloqueante:** abra o `arquivo:linha` citado e confirme gatilho e impacto. Se não se
  sustentar, descarte ou mova para pergunta, e diga isso ao usuário. Não rebaixe para "sugestão"
  só porque não deu para provar.
- **Molde citado em "deve ajustar":** abra o arquivo que o agente mandou reutilizar e confira que
  ele faz mesmo o que o achado diz. Molde inventado ou errado é o erro mais comum do Sonnet aqui.
- **Mesma causa raiz em PRs diferentes:** junte num achado só e decida o nível pelo impacto, não
  pelo mais alto que o agente deu.
- **Dependência entre repos:** PRs em repos diferentes que dependem uma da outra (ex.: backend +
  front, serviço + bridge). Nenhum agente enxerga isso sozinho. Cruze os relatórios e aponte a
  ordem de merge entre repos.

## 4. Entregar

Junte os relatórios em PT-BR (skill `escrita-ptbr` para o tom): um resumo curto no topo (quantas
aprovar, quantas travar, e por quê), depois as seções por PR como vieram, a ordem de merge geral
e as perguntas que só o usuário responde.

No fim, ofereça: (a) postar os achados na PR com `gh pr review --comment`, ou (b) corrigir você
mesmo na branch. Só faça com o "sim" do usuário.

Ao postar, cada comentário segue o mesmo formato, pronto para o autor colar na IA dele:

- Começa com o nível: **Bloqueante**, **Deve ajustar** ou **Sugestão (opcional)**.
- Um parágrafo: o que o código faz → quando dá problema → impacto → o que se espera. Deixe
  espaço para outra solução válida; não reescreva a implementação no comentário.
- Fala do código, nunca da pessoa. Sem "obviamente", sem ordem seca sem motivo.
- Sugestão diz que é opcional de verdade. Bloqueante não fica tão suave que pareça opcional.
- Dúvida de contexto (requisito, autorização) vai como pergunta, não disfarçada de achado.
