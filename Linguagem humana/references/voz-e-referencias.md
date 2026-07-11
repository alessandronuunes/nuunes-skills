# Voz, Registro e Referências

Ritmo e pontuação certos deixam o texto *soar* humano. A voz é o que faz o texto ser de
**uma** pessoa. Este arquivo calibra registro, público e referências de estilo.

## Público-alvo padrão

Dev solo brasileiro. Quase sempre: aprendeu na marra, com barreira de inglês, cansado de
tutorial genérico traduzido de LLM que não resolve o problema real; constrói software de
verdade, sozinho ou em time pequeno; e reconhece na hora quando o texto é encheção de IA.
Escreva para essa pessoa, sem paternalismo e sem subestimar a inteligência de quem lê.

## Registro: composto, não picotado

Há dois registros possíveis para um blog técnico em PT-BR, e vale saber em qual você está
escrevendo. O registro-padrão desta skill é o **composto**, não o casual.

- **Registro composto (o padrão).** Prosa culta e fluida, de período longo, no espírito
  da boa imprensa brasileira e de blogs como o Akita on Rails e o de Carlos Schults. É
  erudito sem ser empolado, opinativo sem ser raso. As frases correm longas, costuradas
  por vírgula e subordinação, e o autor assume claramente o que pensa. Este é o registro
  que soa como "artigo bem escrito" para o leitor brasileiro. **Escreva neste por padrão.**

- **Registro conversado (só quando pedido).** Mais próximo da fala, primeira pessoa
  entusiasmada, "bora", perguntas soltas ao leitor, no espírito do blog do Lucas Santos
  (lsantos.dev). Funciona para tutorial leve e público iniciante. Use apenas quando o
  autor pedir esse tom — ele é gostoso, mas escorrega fácil para o casual demais, com
  gíria e "kkk", que envelhece rápido.

Na dúvida, componha. O erro mais comum de quem escreve com IA não é ser formal demais; é
picotar o texto em frases curtas achando que "fica dinâmico". Fica robótico. Veja
`pontuacao-e-ritmo.md`.

## Marcadores de voz autoral

Vale em qualquer registro:

- **Primeira pessoa e experiência vivida.** "Quando implementei o `OrgContextService` no
  NuSuggest, caí exatamente nesse erro." Especificidade do próprio autor é o antídoto mais
  forte contra o tom de IA.
- **Opinião assumida.** Diga o que você acha e banque. "Repository pattern em CRUD simples
  é over-engineering, e eu defendo isso."
- **Vocabulário com cor.** A boa prosa brasileira não é neutra: ela escolhe palavras com
  peso e opinião embutida. Não precisa de gíria; precisa de precisão e de um ponto de
  vista. "O silêncio nos logs me preocupou mais do que um stack trace de mil linhas" diz
  mais que "não havia erros aparentes".
- **Imperfeição de estilo proposital.** Começar frase com "E" ou "Mas". Um fragmento curto
  para ênfase, no lugar certo. Isso é escolha de estilo, não erro de gramática.

## Referências de estilo

- **Imprensa brasileira de opinião (colunas, cartas ao leitor).** Melhor modelo de
  *ritmo*: período longo como padrão, circunstância fronteada por vírgula, frase curta
  rara e certeira, travessão quase inexistente. Copie a mecânica, não o assunto.
- **Akita on Rails** — densidade e argumento; tese defendida com vivência. Bom para post
  de opinião e carreira.
- **Carlos Schults** — didático, português assumido como escolha, estrutura clara. Bom
  para o post técnico composto.
- **Lucas Santos (lsantos.dev)** — o registro conversado bem feito, para quando o autor
  quiser esse tom.

O fio comum dos bons: **português assumido como vantagem, não como limitação.** O autor
não pede desculpa por escrever em PT-BR; fala com quem vive a realidade de programar no
Brasil.

## Nota sobre código nos artigos

O autor trabalha com Laravel, Filament e Vue, seguindo o padrão: identificadores em inglês,
comentários em português. Mantenha isso nos trechos de código do artigo — fica coerente com
código real de produção. Não traduza termos consagrados (deploy, commit, merge, queue, job,
request).
