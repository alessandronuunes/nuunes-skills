---
name: browser-debug
description: Investiga bugs de front-end direto no Chrome — console, network e código até a causa raiz. Use quando o usuário disser que algo "não funciona na tela", relatar um erro de JS/request no navegador, ou pedir para validar visualmente uma mudança de front-end. NÃO use para navegação simples roteirizada, isso não precisa desse processo.
---

Você vai investigar um bug de front-end usando o Chrome real do usuário, com as ferramentas `claude-in-chrome`. O objetivo é terminar com **causa raiz identificada e apontada no código**, não só "reproduzi o erro".

## Ordem de trabalho

1. **Contexto primeiro.** Chame `tabs_context_mcp` antes de qualquer outra coisa. Nunca reutilize tab ID de uma sessão anterior. Só trabalhe numa aba existente se o usuário pedir explicitamente; caso contrário crie uma nova com `tabs_create_mcp`.
2. **Reproduza antes de teorizar.** Navegue até o fluxo e execute os passos. Se não conseguir reproduzir em 2 ou 3 tentativas, pare e relate isso ao usuário — um bug não reproduzido é um achado válido.
3. **Colete evidência bruta.** `read_console_messages` e `read_network_requests` no momento da falha. Sempre filtre o console com o parâmetro `pattern` (regex) em vez de despejar tudo; log de app web enche o contexto rápido e piora seu próprio raciocínio.
4. **Correlacione com o código.** Pegue o arquivo, a função ou o endpoint que apareceu no stack trace / na request e vá ler no repositório com Grep e Read. Um diagnóstico que não chega no arquivo fonte está incompleto.
5. **Levante hipóteses concorrentes.** Nunca trabalhe com uma explicação só. Escreva pelo menos duas ou três causas possíveis antes de investigar qualquer uma — por exemplo: (a) o token não está sendo enviado, (b) o token vai mas expirou, (c) o backend mudou o nome do header. Uma hipótese sozinha vira viés de confirmação: você passa a caçar evidência que a confirma e ignora o resto.
6. **Elimine, não confirme.** Para cada hipótese, procure a evidência que a **derrubaria**, não a que a sustenta. Se a hipótese é "o token não está sendo enviado", abra os headers da request de verdade — não deduza pelo sintoma. Descarte por evidência e diga qual evidência descartou cada uma.

## Regras rígidas

- **Nunca dispare `alert`, `confirm`, `prompt` ou modal nativo do browser.** Isso trava a extensão e mata a sessão inteira. Evite clicar em botões que sabidamente abrem confirmação (Delete, Remover). Se for inevitável, avise antes e não clique sem confirmar com o usuário.
- Use `console.log` + `read_console_messages` para depurar, nunca `alert`.
- Não faça ações destrutivas ou que mudem estado de verdade: não envie formulário de produção, não delete registro, não confirme pagamento. Se o diagnóstico exigir isso, pare e explique o que falta.
- Não saia explorando páginas fora do escopo do bug.
- Se as ferramentas falharem 2 ou 3 vezes seguidas, ou a página não responder, pare e relate ao usuário. Não fique repetindo a mesma ação.

## Como apresentar a conclusão

Ao fechar a investigação, estruture a resposta ao usuário assim:

- **Sintoma** — o que acontece na tela, reproduzido ou não
- **Evidência** — erro de console literal, request que falhou com status e endpoint
- **Hipóteses descartadas** — cada uma com a evidência específica que a derrubou. Se você descartou por intuição e não por evidência, diga isso.
- **Causa raiz** — `caminho/do/arquivo.ts:123`, com a explicação do mecanismo, seguida de **confiança: alta / média / baixa**. Alta significa que você viu a evidência direta; média, que a inferência é forte mas indireta; baixa, que é a melhor explicação disponível e ainda não foi testada.
- **Correção sugerida** — o que mudar, sem aplicar a mudança sem antes confirmar com o usuário
- **Incerteza** — o que você não conseguiu confirmar e por quê. Nunca apresente palpite como conclusão, e nunca reporte confiança alta sem evidência direta.
