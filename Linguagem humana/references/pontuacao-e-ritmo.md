# Pontuação e Ritmo em Português Brasileiro

Este é o coração da skill. O que mais denuncia texto de IA em português é o **ritmo**.
A máquina, treinada sobretudo em inglês técnico, importa o ritmo anglófono: frases
curtas, uma ideia por frase, ponto final atrás de ponto final. Em português isso soa
mecânico na hora. A boa prosa brasileira faz o oposto: o período **longo**, costurado
por vírgula e subordinação, é o padrão; a frase curta é a exceção, usada como golpe de
ênfase. Consulte este arquivo enquanto escreve, não só na revisão.

## Índice

1. [O padrão é o período longo (e por que isso importa)](#1-o-padrão-é-o-período-longo)
2. [As três técnicas anti-staccato](#2-as-três-técnicas-anti-staccato)
3. [A frase curta como soco, não como muleta](#3-a-frase-curta-como-soco)
4. [Vírgula: quando usar e quando não](#4-vírgula-quando-usar-e-quando-não)
5. [Ponto e vírgula: costurar sem cortar](#5-ponto-e-vírgula-costurar-sem-cortar)
6. [Travessão: no máximo um por artigo](#6-travessão-no-máximo-um-por-artigo)
7. [Dois-pontos: anúncio e expectativa](#7-dois-pontos-anúncio-e-expectativa)
8. [Parágrafo: tamanho e transição](#8-parágrafo-tamanho-e-transição)

---

## 1. O padrão é o período longo

Abra qualquer texto bem escrito da imprensa brasileira e meça o comprimento das frases.
Você vai encontrar períodos longos, de 20 a 35 palavras, encadeados por vírgulas,
apostos e orações subordinadas, e só de vez em quando uma frase curta para dar o golpe.

Veja o ritmo de abertura de uma coluna editorial típica (número = palavras por frase):

```
~20  →  ~32  →  ~30  →  ~27  →  4  →  4
```

Quatro períodos longos, um atrás do outro, e então um par curtíssimo fechando o
parágrafo: algo como "Não é pouca coisa. Mas não é tudo." Esse é o ritmo que o leitor
brasileiro reconhece como escrito por gente.

Agora o ritmo que grita "IA", e que é o vício mais comum de quem escreve com LLM:

```
10  →  9  →  11  →  8  →  10  →  9
```

Tudo em torno de dez palavras, cada ideia picotada num ponto final. Parece uma lista de
bullets que alguém colou dentro de um parágrafo. **Se os seus parágrafos se parecem com
o segundo padrão, o problema é ritmo, não vocabulário — e a correção é ligar o que você
picotou.**

A regra mental, para cada ponto final que você escrever: *"dá para juntar esta ideia à
anterior com vírgula, conjunção ou subordinação?"*. Na maioria das vezes, dá — e deve.
O português não só aceita o período composto: ele o pede.

## 2. As três técnicas anti-staccato

Três movimentos transformam um texto picotado num texto que flui. São eles que fazem o
trabalho pesado.

**1. Comece a frase pela circunstância, vírgula, depois o miolo.** Este é o tique mais
marcante da boa prosa brasileira. Em vez de "O deploy quebrou. Eu não sabia o motivo",
escreva jogando o tempo, o lugar ou a condição para a frente:

> Naquela sexta à noite, quando o deploy quebrou sem avisar, eu não fazia ideia de por
> onde começar.

"Naquela sexta à noite," e "quando o deploy quebrou sem avisar," são circunstâncias
fronteadas por vírgula antes do sujeito. Só isso já elimina dois pontos finais e cria
fôlego. Use muito: "Depois de três meses,...", "Com o CLAUDE.md no lugar,...", "Em pouco
mais de um sprint,...".

**2. Encaixe a informação secundária em aposto, entre vírgulas.** Em vez de abrir uma
frase nova para cada dado, embuta-o no meio da frase que já está correndo:

> O Horizon, que cuida das filas em produção, parou sem estourar um único erro.

O aposto "que cuida das filas em produção" carrega a explicação sem exigir um período à
parte. É assim que a boa prosa empacota muita informação num fôlego só.

**3. Ligue orações irmãs com conjunção, não com ponto.** Duas ideias que se completam
pedem "e", "mas", "porque", "de modo que" — não um ponto seco entre elas:

> A migração rodou e o banco não reclamou, mas foi justamente esse silêncio que me
> deixou desconfiado.

Três orações, um período, zero staccato.

## 3. A frase curta como soco

A frase curta não some — ela muda de papel. Deixa de ser o padrão e vira o instrumento
de ênfase. O efeito nasce do contraste: depois de três ou quatro períodos longos, uma
frase de três ou quatro palavras cai como um soco.

> [...período longo...] [...período longo...] [...período longo...] Não era um bug.

Repare no padrão da imprensa: os períodos longos preparam o terreno e a frase curta
fecha. Um par de frases curtas em sequência, ao fim de um parágrafo, é uma virada
clássica: "Não é pouca coisa. Mas não é tudo." Fora desses momentos de ênfase, prefira
o período longo. **Uma frase curta isolada tem peso; dez frases curtas seguidas não têm
peso nenhum, só cara de bot.**

## 4. Vírgula: quando usar e quando não

A vírgula não marca respiração; marca fronteira sintática. É a principal ferramenta para
costurar o período longo.

**Use vírgula:**

- **Circunstância deslocada no início:** `No meio da migração, o banco corrompeu.` (a
  técnica nº 1 da seção 2).
- **Aposto e oração explicativa, entre vírgulas:** `O Horizon, que gerencia as filas,
  parou sem avisar.`
- **Enumeração:** `Uso Laravel, Filament, Vue e Inertia.` (sem vírgula antes do "e"
  final, salvo sujeitos diferentes: `Eu subi o deploy, e a fila travou.`)
- **Antes de "mas", "porém", "contudo":** `Testei local, mas em produção quebrou.`
- **Isolando conectivos intercalados:** `A solução, no entanto, tinha um custo escondido.`

**Nunca use vírgula:**

- **Entre sujeito e predicado:** ~~`As grandes empresas, lucram com isso.`~~ Erro grave.
- **Entre verbo e complemento:** ~~`O time entregou, a feature no prazo.`~~
- **Antes de "que" em oração restritiva:** `O dev que entende de fila resolve isso rápido.`
  (Compare com a explicativa, entre vírgulas: `Esse dev, que entende de fila, resolveu.`)

## 5. Ponto e vírgula: costurar sem cortar

O ponto e vírgula liga duas orações independentes fortemente ligadas sem o corte seco do
ponto. É um remédio direto contra o staccato, e quase ninguém usa:

```
staccato:   A migração rodou. O banco não reclamou. Fiquei desconfiado.
com ";":    A migração rodou e o banco não reclamou; fiquei desconfiado por isso mesmo.
```

Serve também para separar itens longos de uma enumeração que já tem vírgulas dentro.
Dois ou três por artigo já dão o efeito.

## 6. Travessão: no máximo um por artigo

Este ponto é categórico, porque é um dos maiores clichês de IA e um vício que denuncia o
texto antes mesmo de ser lido com atenção. Uma medição de referência: numa coluna
editorial brasileira de umas 500 palavras, aparece **um** travessão no texto inteiro; numa
matéria factual, **nenhum**. Esse é o teto.

Regras:

- **No máximo um travessão no artigo todo**, reservado para uma única virada de ênfase de
  verdade, de preferência um aposto final: `o governo legalizou a pedalada fiscal — a mesma
  prática que derrubou Dilma.`
- Em todo outro lugar onde você pensou em travessão, use **vírgula** (aparte leve) ou
  **parênteses** (informação lateral).
- Se bater o olho e vir travessão em dois ou três parágrafos, apague todos menos um.

## 7. Dois-pontos: anúncio e expectativa

Os dois-pontos anunciam o que vem — uma explicação, uma lista, uma consequência — e criam
uma micro-expectativa que segura o leitor:

```
O bug era o de sempre: fuso horário.
```

Ótimo para fechar um parágrafo puxando o leitor para a revelação. Sem exagero, para não
virar tique.

## 8. Parágrafo: tamanho e transição

- **Varie o tamanho do parágrafo.** Um parágrafo de uma linha, sozinho, funciona como
  respiro e ênfase, do mesmo jeito que a frase curta. Uma sequência de parágrafos todos
  com quatro ou cinco linhas iguais cansa.
- **Transição pelo conteúdo, não por muleta.** Não abra parágrafos em série com "Além
  disso", "Dessa forma", "Portanto". Retome uma palavra do parágrafo anterior, faça uma
  pergunta ou entre direto na próxima ideia.
- **Um parágrafo, uma ideia.** Se o parágrafo virou uma lista de ideias coladas com
  ponto, ou você as costura com subordinação (seção 2), ou você assume que é uma lista e
  usa marcadores. O que não pode é fingir de parágrafo sendo lista picotada.
