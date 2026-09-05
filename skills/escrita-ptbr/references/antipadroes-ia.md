# Antipadrões de IA em Português Brasileiro

Catálogo dos sinais que denunciam texto de máquina em PT-BR. Rode esta lista na
passagem anti-IA, relendo o rascunho inteiro à caça de cada item. A maioria destes
padrões é *tell* de estrutura e vocabulário; o *tell* de ritmo está em
`pontuacao-e-ritmo.md`.

As seções 1 a 9 nasceram da observação de texto brasileiro. As seções 10 a 19
adaptam para o português os padrões da página "Signs of AI writing" da Wikipédia
em inglês (mantida pelo WikiProject AI Cleanup), que não tem versão lusófona;
cada item foi traduzido pelo que a IA faz *em português*, não pela lista de
palavras inglesas. A seção 20 reúne o que fontes brasileiras apontam como marca
de tradução. As seções 21 e 22 são a trava contra o excesso: o que não é prova
de IA e o que não pode ser aplainado na revisão.

## Índice

1. [Aberturas clichê](#1-aberturas-clichê)
2. [Conectivos-muleta](#2-conectivos-muleta)
3. [Estruturas contrastivas batidas](#3-estruturas-contrastivas-batidas)
4. [Fechamentos genéricos](#4-fechamentos-genéricos)
5. [Inflação de importância](#5-inflação-de-importância)
6. [Vocabulário e vícios de LLM](#6-vocabulário-e-vícios-de-llm)
7. [Excesso de estrutura (SEO slop)](#7-excesso-de-estrutura-seo-slop)
8. [Neutralidade estéril](#8-neutralidade-estéril)
9. [Cerimônia de PR e commit](#9-cerimônia-de-pr-e-commit)
10. [Enchimento sintático](#10-enchimento-sintático)
11. [Fuga do "é" e do "tem"](#11-fuga-do-é-e-do-tem)
12. [Fonte vaga](#12-fonte-vaga)
13. [Gerúndio de análise rasa](#13-gerúndio-de-análise-rasa)
14. [Trio forçado e faixa falsa "do X ao Y"](#14-trio-forçado-e-faixa-falsa-do-x-ao-y)
15. [Resíduo de chatbot](#15-resíduo-de-chatbot)
16. [Objeção fantasma e alternativa de palha](#16-objeção-fantasma-e-alternativa-de-palha)
17. [Frase de efeito vazia](#17-frase-de-efeito-vazia)
18. [Título repetido e seção de fôrma](#18-título-repetido-e-seção-de-fôrma)
19. [Qualificador empilhado](#19-qualificador-empilhado)
20. [Anglicismo de tradução](#20-anglicismo-de-tradução)
21. [O que não marcar (falsos positivos)](#21-o-que-não-marcar-falsos-positivos)
22. [O que preservar](#22-o-que-preservar)

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

As locuções de enchimento que não são conectivo ("a fim de", "no tocante a",
"tem a capacidade de") estão na seção 10.

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
- Otimismo genérico: "O futuro é promissor", "vem muita coisa boa por aí", "este
  é um passo na direção certa". Termine no último fato concreto ou na opinião.
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
  Escolha um adjetivo que signifique algo, ou mostre em vez de adjetivar. O trio
  forçado em geral (substantivos, verbos, tópicos) está na seção 14.
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
  entra o X", "o que ninguém te conta", "a verdadeira questão é", "no fundo", "o
  que realmente importa", "o cerne da questão", e a candura encenada
  ("Sinceramente?", "Olha,", "Vou ser honesto:") como pausa teatral antes de uma
  opinião banal. Frases que anunciam o insight em vez de entregá-lo. Corte o
  anúncio e comece direto pelo insight. O aforismo de fôrma ("X é a moeda de Y")
  está na seção 17.

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

## 9. Cerimônia de PR e commit

Em texto funcional a IA não erra por staccato; erra por cerimônia. Sinais:

- **Abertura burocrática:** "Este PR tem como objetivo...", "O presente commit
  visa...". Comece pelo que mudou: "Troca X por Y para corrigir Z".
- **Bullet-spam:** cinco bullets de meia linha dizendo o que uma frase diria.
  Bullet é para itens de fato paralelos; o resto vira frase corrida.
- **Resumo que repete o diff:** listar arquivo por arquivo o que o diff já
  mostra. O texto do PR existe para dizer o que o diff não diz: o porquê, o
  risco, o que testar.
- **Voz passiva de changelog:** "Foram implementadas as seguintes melhorias",
  "Realizados ajustes em...". Assuma o sujeito ("adicionei", "corrigi") ou siga
  o padrão de verbo do repositório ("Adiciona", "Corrige").
- **Emoji e enfeite:** 🚀 no título, ✅ em cada linha de checklist. Nenhum.
- **Doc que narra a versão anterior:** "Esta função foi adicionada para substituir
  a abordagem antiga, que iterava todos os itens". README, docstring e comentário
  de código descrevem o comportamento *atual*; a história fica no changelog, na
  nota de release e no guia de migração. "Usa um hash map para busca O(1)" basta.

## 10. Enchimento sintático

Perífrase que gasta cinco palavras onde uma dá conta. Em português a IA adora a
locução pomposa:

| Enchimento | Direto |
|---|---|
| a fim de alcançar esse objetivo | para isso |
| devido ao fato de que estava chovendo | porque chovia |
| neste momento / no presente momento | agora |
| na eventualidade de precisar de ajuda | se precisar de ajuda |
| o sistema tem a capacidade de processar | o sistema processa |
| é importante notar que os dados mostram | os dados mostram |
| no tocante a / no que tange a / no que diz respeito a | sobre, quanto a |
| cabe destacar que / cabe ressaltar que | (corte e diga o fato) |
| de forma a garantir | para garantir |
| por meio da utilização de | com, usando |

**Antes:**
> A fim de garantir a consistência dos dados, é importante notar que o sistema
> tem a capacidade de validar cada registro no momento da inserção.

**Depois:**
> O sistema valida cada registro na inserção, e é isso que mantém os dados
> consistentes.

## 11. Fuga do "é" e do "tem"

A IA evita os verbos mais simples da língua e troca por verbo de vitrine:
"serve como", "atua como", "se destaca como", "representa", "conta com",
"dispõe de", "oferece", "apresenta". O texto ganha pompa e perde clareza.

**Antes:**
> O Horizon atua como painel de monitoramento das filas e conta com quatro
> abas, dispondo de métricas em tempo real.

**Depois:**
> O Horizon é o painel das filas. Tem quatro abas e mostra as métricas em
> tempo real.

Se a frase diz que uma coisa é ou tem outra, escreva "é" e "tem".

## 12. Fonte vaga

Afirmação pendurada em autoridade sem nome: "especialistas apontam",
"estudos mostram", "pesquisas indicam", "muitos consideram", "é amplamente
reconhecido que", "segundo dados do setor". Ninguém pode conferir, e o modelo
usa isso justamente para dar peso ao que ele mesmo inventou.

**Antes:**
> Especialistas apontam que o Redis desempenha um papel crucial em aplicações
> de alta performance, e estudos mostram ganhos expressivos de latência.

**Depois:**
> No NuSuggest, mover a sessão para o Redis derrubou o p95 de 800 ms para 120 ms.

Regra: fonte nomeada (link, autor, número do próprio autor) ou nada. Se o
material original não tem a fonte, a afirmação sai; não invente uma.

## 13. Gerúndio de análise rasa

Oração de gerúndio pendurada no fim da frase para fingir interpretação:
"destacando", "reforçando", "evidenciando", "garantindo", "demonstrando",
"contribuindo para", "promovendo", "refletindo", "consolidando". A frase diz
um fato e o gerúndio finge tirar uma conclusão dele.

**Antes:**
> O projeto adotou testes automatizados em 2023, evidenciando o compromisso da
> equipe com a qualidade e contribuindo para a maturidade do produto.

**Depois:**
> O projeto adotou testes automatizados em 2023. Desde então, nenhum deploy de
> sexta voltou atrás.

Se o gerúndio carrega informação de verdade, vire oração própria. Se não carrega
nada, corte.

## 14. Trio forçado e faixa falsa "do X ao Y"

**Trio forçado.** A IA fecha tudo em três, porque três soa completo: "inovação,
inspiração e insights", "planejar, executar e medir", "rápido, seguro e
escalável". Use o número de itens que a ideia tem. Dois é número. Quatro
também.

**Faixa falsa.** "Do backend ao deploy, da arquitetura à cultura de time" finge
um espectro que não existe entre os extremos. Se X e Y não são pontas de uma
mesma régua, liste os assuntos ou escolha um.

**Antes:**
> O evento cobre tudo, do frontend ao banco de dados, da teoria à prática, com
> palestras, workshops e networking.

**Depois:**
> O evento tem palestras sobre Vue e Postgres e uma tarde de workshop prático.

## 15. Resíduo de chatbot

Texto colado direto da conversa e não limpo. Sinais: "Claro!", "Com certeza!",
"Ótima pergunta", "Você está certo", "Espero ter ajudado", "Espero que esta
mensagem o encontre bem", "Fico à disposição", "Não hesite em", "Quer que eu
detalhe?", "Posso continuar?", "Aqui está um resumo de", "Segue abaixo".
Também conta o aviso de limite ("até a data do meu último treinamento",
"informações específicas não estão amplamente disponíveis, mas é provável
que...") e o chute preenchendo lacuna ("provavelmente cresceu em", "acredita-se
que").

**Antes:**
> Claro! Aqui está uma visão geral do Laravel Horizon. Espero que ajude, e não
> hesite em pedir mais detalhes.

**Depois:**
> O Horizon é o painel de filas do Laravel.

O que a fonte não diz, o texto não diz. Se faltar um dado, marque
`[PREENCHER]` em vez de chutar.

## 16. Objeção fantasma e alternativa de palha

Dois restos de rascunho que o modelo deixa no texto final:

- **Objeção fantasma.** "Não estou dizendo que documentação não importa",
  "Para ser claro,", "Não me entenda mal", "Isso não é sobre X", "Alguns podem
  argumentar que... mas". O texto responde a uma crítica que ninguém fez e que
  não aparece em lugar nenhum. Corte a defesa; se dentro dela houver uma
  afirmação real, diga a afirmação direta.
- **Alternativa de palha.** "Uma abordagem tentadora seria...", "Seria fácil
  simplesmente...", "Você pode pensar que... mas", "Alguns sugeririam". Apresenta
  uma opção que nenhum leitor cogitaria, descarta numa oração e nunca mais
  toca nela. Corte a opção e diga a restrição real.

**Antes:**
> Não estou dizendo que cache seja ruim. Uma abordagem tentadora seria limpar o
> cache reiniciando o serviço num cron, mas isso derrubaria as sessões ativas. A
> rotação acontece no lugar.

**Depois:**
> A rotação do token acontece no lugar, e o cliente renova sem perceber.

Uma alternativa de verdade, que o leitor consideraria num doc de design ou num
tutorial, fica. O sinal é a opção descartada em meia linha que não volta.

## 17. Frase de efeito vazia

Aforismo de fôrma: "X é a linguagem de Y", "X é a moeda de Z", "X não é uma
ferramenta, é um espelho", "X vira armadilha quando...", "X é o novo Y". Soa
sábio e não diz nada, porque a fôrma cabe em qualquer assunto. Troque pela
afirmação específica que o autor tinha em mente. (O anúncio de insight e a
candura encenada estão na seção 6, em *abertura de garganta*.)

**Antes:**
> Testes são a moeda da confiança, e cobertura é o novo code review.

**Depois:**
> O framework importa menos que o hábito de rodar os testes antes do merge, e
> nesse time ninguém rodava.

## 18. Título repetido e seção de fôrma

- **Título repetido na primeira frase.** `## Performance` seguido de "Performance
  importa." antes do conteúdo de verdade. O título já disse; entre direto na
  primeira frase útil.
- **Seção de fôrma.** "Desafios e perspectivas", "Conclusão", "Considerações
  finais", "O futuro de X", "Legado" com parágrafo que repete vagamente o que já
  foi dito ou promete "continuar crescendo". Se a seção não traz fato novo, ela
  não existe.

## 19. Qualificador empilhado

Edição em cima de edição vai acumulando ressalva: "poderia potencialmente
talvez", "em alguns casos pode ser que", "é possível argumentar que", "de certa
forma", "até certo ponto", "vale a ressalva de que". No fim toda frase soa
incerta.

**Antes:**
> Poderia potencialmente ser argumentado que a mudança talvez tenha algum
> efeito sobre os resultados em alguns casos.

**Depois:**
> A mudança pode afetar os resultados.

Ressalva fica quando a fonte a sustenta e o sentido precisa dela. Ressalva que só
conserta um exagero anterior sai junto com o exagero.

## 20. Anglicismo de tradução

Texto gerado em inglês e vertido, ou gerado em português por modelo que pensa
em inglês. Sinais que o leitor brasileiro sente antes de saber explicar:

- **Decalque de vocabulário:** "tapeçaria" (tapestry), "testamento" no sentido
  de prova (testament), "paisagem" para cenário abstrato (landscape), "jornada"
  para qualquer processo, "sem costura" (seamless), "alavancar" (leverage),
  "pavimentar o caminho", "elevar" no sentido de melhorar, "ressoar com",
  "navegar" desafios, "robusto" para tudo, "insights" onde cabe "o que aprendi".
- **"Aprofundar" e "mergulhar"** como abertura de seção: são o "delve" do
  português, e a comunidade acadêmica já trata como marca de máquina.
- **"Assertivo/assertiva"** no sentido de "certeiro": é sentido importado; em
  português, assertivo é quem afirma com firmeza.
- **Vírgula de Oxford:** "Laravel, Filament, e Vue". Em português não existe
  vírgula antes do "e" final da enumeração, salvo sujeitos diferentes.
- **Ponto dentro das aspas** ("assim." em vez de "assim".) e maiúscula em
  substantivo comum no meio da frase ("o Framework", "a Equipe").
- **Locuções de tradutor:** "no tocante a", "em termos de", "quando se trata
  de", "ao longo do caminho", "no final do dia".

**Antes:**
> Ao longo da jornada, o time alavancou insights robustos que pavimentaram o
> caminho para uma entrega sem costura, e isso ressoou com o cliente.

**Depois:**
> Depois de três sprints o time entendeu o que o cliente queria, e a entrega saiu
> sem retrabalho.

## 21. O que não marcar (falsos positivos)

Nenhum item deste catálogo é prova sozinho. Gente escreve com esses padrões
também. Não marque como IA, e no modo revisar não mexa, quando o único sinal
for:

- **Gramática perfeita e estilo uniforme.** Muita gente escreve bem ou passou
  por editor. Polimento não é IA.
- **Prosa seca ou "sem graça".** IA tem *tells* específicos; texto burocrático
  sem nenhum deles é só texto burocrático.
- **Um conectivo isolado.** Um "além disso" ou um "portanto" no texto inteiro é
  português normal. O sinal é a pilha, não a existência.
- **Uma frase curta de ênfase.** O soco isolado é técnica (ver
  `pontuacao-e-ritmo.md`). Marque só a sequência de fragmentos.
- **Um travessão.** Editor e jornalista usam. Travessão pesa junto com ritmo
  de vitrine e clichê, não sozinho.
- **Repetição de abertura proposital.** "Cheguei. Vi. Venci." constrói ritmo.
  Mexa só quando a repetição não acrescenta nada.
- **"Sinceramente" ou "olha" no meio da frase.** Fala comum. O *tell* é o gancho
  teatral isolado no início, não a palavra.
- **Aviso e limite de verdade.** Escopo declarado, nota legal ou de segurança,
  correção real, objeção com fonte nomeada, resposta a pergunta feita: ficam.
- **Alternativa real.** Opção que o leitor consideraria num doc de design, num
  tutorial ou num argumento fica. Sai só a opção improvável descartada e
  esquecida.
- **Falta de fonte.** A maior parte da web não cita nada. Ausência de link não
  prova IA.
- **Formatação correta e complexa.** Editor visual e template produzem markdown
  limpo sem IA nenhuma.
- **Texto de segunda mão.** Citação, título, nome próprio e exemplo em que a
  expressão está sendo *discutida* em vez de *usada* não se reescrevem.
- **Palavra formal isolada.** "Fundamental" numa frase que provou por que aquilo
  é fundamental não é enchimento. Não simplifique todo vocabulário culto; o
  registro composto (ver `voz-e-referencias.md`) é culto de propósito.

Na dúvida, procure vários padrões juntos na mesma passagem. Um travessão não
prova nada; travessão com trio forçado, "além disso" e fecho otimista no mesmo
parágrafo é evidência.

## 22. O que preservar

Na revisão, estes detalhes carregam a voz do autor. Fique com eles, mesmo que
"limpar" desse um texto mais uniforme:

- **Detalhe específico e estranho.** Um endereço real, uma citação torta, "o
  advogado que trabalhava em cima do meu dentista". Máquina não inventa isso, e
  quando inventa, inventa liso.
- **Sentimento misto e tensão sem resolver.** "Acho que é bom, mas me incomoda e
  não sei explicar bem por quê." IA resolve tudo; gente fica em dúvida.
- **Referência datada.** Gíria, meme, piada interna que só faz sentido num ano
  e num grupo. Modelo atrasa um ano ou mais.
- **Escolha consciente em primeira pessoa.** Um corte, uma palavra, uma
  repetição que o autor sabe explicar por que está ali.
- **Variação de tamanho de frase e de parágrafo.** Texto humano alterna; IA
  tende à cadência média constante.
- **Aparte, parêntese e autocorreção.** "(Fiquei tentado a escrever 'quase',
  mas foi certo mesmo.)" Modelo raramente se interrompe.
- **Contração e regionalismo.** "pra", "tá", "né", "dar um jeito", "gambiarra",
  "a fila do banco". É o Brasil real entrando no texto; não formalize.
- **Texto anterior a 30 de novembro de 2022.** Data do lançamento público do
  ChatGPT. Quase nada antes disso é de máquina.
