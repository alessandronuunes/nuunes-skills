# Antipadrões de IA em Português Brasileiro

Catálogo dos sinais que denunciam texto de máquina em PT-BR. Rode esta lista na
passagem anti-IA, relendo o rascunho inteiro à caça de cada item. A maioria destes
padrões é *tell* de estrutura e vocabulário; o *tell* de ritmo está em
`pontuacao-e-ritmo.md`.

## Índice

1. [Aberturas clichê](#1-aberturas-clichê)
2. [Conectivos-muleta](#2-conectivos-muleta)
3. [Estruturas contrastivas batidas](#3-estruturas-contrastivas-batidas)
4. [Fechamentos genéricos](#4-fechamentos-genéricos)
5. [Inflação de importância](#5-inflação-de-importância)
6. [Vocabulário e vícios de LLM](#6-vocabulário-e-vícios-de-llm)
7. [Excesso de estrutura (SEO slop)](#7-excesso-de-estrutura-seo-slop)
8. [Neutralidade estéril](#8-neutralidade-estéril)

---

## 1. Aberturas clichê

Modelos abrem quase todo texto situando o assunto num "cenário" grandioso. Evite:

- "No mundo atual / No mundo de hoje..."
- "Na era digital / Na era da informação..."
- "Em um cenário cada vez mais [competitivo / dinâmico / conectado]..."
- "Com o avanço da tecnologia..."
- "Nos dias de hoje, é cada vez mais comum..."

**No lugar:** entre numa cena concreta, num número, ou numa pergunta direta. `Semana
passada, um `git blame` me entregou: o código duplicado era meu.` já vale mais que
qualquer "no cenário atual do desenvolvimento".

## 2. Conectivos-muleta

A IA cola parágrafos com um punhado pequeno de conectivos, repetidos à exaustão. O
excesso é o sinal — não o uso pontual. Vigie a repetição de:

- "Além disso" / "Ademais" / "Outrossim"
- "Vale ressaltar que" / "Vale destacar que" / "É importante notar que" /
  "É importante ressaltar que"
- "Dessa forma" / "Desse modo" / "Sendo assim"
- "Portanto" / "Por conseguinte" / "Logo" (em excesso)
- "Em suma" / "Em resumo" / "Em síntese"
- "Ou seja" (repetido para reexplicar tudo)

**Regra:** se o mesmo conectivo aparece mais de uma vez no texto, corte todas menos uma.
Prefira transição pelo conteúdo (retomar uma palavra, fazer uma pergunta, entrar direto
na ideia). Ver seção 8 de `pontuacao-e-ritmo.md`.

## 3. Estruturas contrastivas batidas

Fórmulas de contraste que a IA adora e que criam ritmo artificial:

- "Não se trata apenas de X, mas de Y."
- "Mais do que X, é Y."
- "Isso não é só sobre X; é sobre Y."
- "X não é [luxo / opção]; é [necessidade / obrigação]."

Usadas uma vez, passam. Repetidas, são assinatura de LLM. Reescreva a ideia sem a
fôrma: diga direto o que você quer dizer.

## 4. Fechamentos genéricos

O modelo fecha resumindo o que já disse, sem acrescentar nada:

- "Em conclusão, [repete o título]..."
- "Portanto, fica claro que..."
- "Em resumo, vimos que..."
- "Agora que você já sabe X, está pronto para Y!"
- "Espero que este artigo tenha sido útil."
- Pergunta retórica autorespondida: "E você, está preparado para essa mudança? Se
  seguir esses passos, com certeza sim." A pergunta que o próprio texto responde na
  frase seguinte não é conversa com o leitor; é encenação.

**No lugar:** arremate com opinião assumida, um próximo passo real, uma provocação ou uma
pergunta genuína ao leitor — daquelas que ficam abertas de verdade. O fecho é onde a voz
do autor deve estar mais forte, não mais fraca.

## 5. Inflação de importância

A IA infla a relevância de qualquer coisa banal ligando-a a "transformações" e "marcos":

- "revolucionou completamente..."
- "transformou a maneira como..."
- "peça fundamental / elemento essencial no atual cenário..."
- "veio para mudar o jogo..."
- "não é apenas uma tendência, é uma realidade..."

Diga o fato liso. Se algo importa, os fatos mostram sozinhos — não precisa de uma frase
avisando que aquilo é importante.

## 6. Vocabulário e vícios de LLM

- **Adjetivos empilhados em três:** "uma solução robusta, escalável e eficiente".
  Escolha um adjetivo que signifique algo, ou mostre em vez de adjetivar.
- **Gerundismo:** "vou estar enviando", "estaremos disponibilizando". Troque por
  "vou enviar", "vamos disponibilizar".
- **Palavras infladas:** "aprimorar", "potencializar", "alavancar", "mergulhar" (como em
  "vamos mergulhar neste tema"), "desvendar", "explorar" como abertura vazia.
- **"Imagine que...":** abertura de exemplo genérico. Prefira um exemplo real e específico.
- **Voz passiva desnecessária:** "foi observado que", "pode-se notar que". Assuma o
  sujeito: "eu percebi", "a gente viu".
- **Muletas de peso:** "panorama", "robusto", "fundamental", "crucial", "essencial"
  usados como enchimento, para dar gravidade a uma frase que não provou nada. Se a
  coisa é crucial, mostre a consequência de ela faltar; a palavra sozinha não segura.
- **Rotação de sinônimos:** chamar a mesma coisa de "agente", depois "assistente",
  depois "ferramenta" na mesma seção. Humano escolhe um nome e fica com ele; repetir
  o nome certo não é pobreza vocabular, é clareza.
- **Abertura de garganta:** "aqui está a questão", "a verdade é que", "e é aí que
  entra o X", "o que ninguém te conta". Frases que anunciam o insight em vez de
  entregá-lo. Corte o anúncio e comece direto pelo insight.

Cuidado com o oposto: nem todo conectivo é proibido, e "bora"/"vamos ver" na voz certa
soam humanos. O que denuncia é o **excesso mecânico e a repetição**, não a existência da
palavra.

## 7. Excesso de estrutura (SEO slop)

Texto de IA otimizado para SEO tende a: subtítulos a cada dois parágrafos, listas com
marcadores para tudo, palavras-chave em negrito espalhadas, e a mesma frase-chave
repetida em cada seção. Isso deixa o texto com cara de gabarito.

- Use lista **só quando os itens são de fato paralelos** (passos, opções, requisitos).
  Ideia que tem fluxo e causa vira parágrafo, não bullet.
- Negrito com moderação, para um destaque de verdade — não para "otimizar".
- Deixe alguns parágrafos correrem sem subtítulo. Nem toda seção precisa de cabeçalho.
- **Title Case Em Títulos:** "Como Configurar O Seu Primeiro Deploy" não existe em
  português; é importação direta do inglês e entrega o texto na hora. Em PT-BR, só a
  primeira palavra e nomes próprios levam maiúscula: "Como configurar o seu primeiro
  deploy".
- **Emoji decorativo:** 🚀 no título, ✅ em cada bullet. Em artigo, nenhum — a menos
  que o autor use e peça.

## 8. Neutralidade estéril

O *tell* mais profundo, e o mais difícil de corrigir com find-and-replace:

- **Ausência de opinião:** em tema debatível, a IA fica em cima do muro. Humano toma
  lado. Diga o que você acha e por quê.
- **Ausência de anedota:** sem nenhuma história vivida, nenhum erro próprio, nenhum
  número real, o texto flutua. Ancore em algo concreto que aconteceu.
- **Ausência de regionalismo:** falta o Brasil real. Uma referência ao contexto local
  (mercado, gambiarra, a fila do banco, o cliente que sumiu) traz o texto para o chão.
- **Perfeição gramatical sem respiro:** começar frase com "E" ou "Mas", um fragmento de
  ênfase, uma pergunta jogada no meio — humanos fazem. Não estou dizendo para errar
  concordância; estou dizendo para ter voz.

Se o texto está impecável e mesmo assim soa de máquina, quase sempre o problema mora
aqui: falta gente por trás.
