# Avaliação do revisar-pr

Critérios de sucesso para um review bem-feito:

- [ ] Um `revisor-pr` por repo, disparados em paralelo; nunca dois no mesmo worktree
- [ ] Gates rodados de verdade (lint, análise estática, testes) e comparados com a base; o que não rodou está dito
- [ ] Todo bloqueante tem `arquivo:linha`, gatilho e impacto, conferidos na sessão principal antes de entregar
- [ ] Todo molde citado em `reuse:`/`laravel:`/`ui:` foi aberto e faz o que o achado diz
- [ ] Nenhum achado de preferência pessoal, de lint ou de defeito que já existia na base
- [ ] Dependência e ordem de merge entre PRs (e entre repos) apontadas quando existem
- [ ] Nada postado, aprovado ou mergeado no GitHub sem o "sim" do usuário
