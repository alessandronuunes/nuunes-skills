---
name: escrita-artigos-ptbr
description: >
  Escreve e revisa artigos de blog em português brasileiro que soam escritos por
  uma pessoa de verdade, não por IA. Use SEMPRE que o usuário pedir para escrever,
  rascunhar, revisar, reescrever ou "humanizar" um artigo, post de blog, tutorial,
  guia ou texto longo em português — mesmo que ele não diga explicitamente
  "humanizar" ou "sem cara de IA". Também acione quando o usuário reclamar que um
  texto "parece feito por IA", "tem muito ponto", "está robótico" ou pedir para
  melhorar o ritmo e a pontuação de um texto em PT-BR. O foco é ritmo de frase,
  pontuação correta e voz autoral — os três sinais que mais denunciam texto de
  máquina em português.
---
# Escrita de Artigos em PT-BR (voz humana)

O objetivo desta skill é produzir artigos técnicos em português brasileiro que um
leitor experiente **não consiga distinguir de um texto escrito à mão**. O público
padrão é o dev solo brasileiro — muitas vezes com barreira de inglês, cansado de
tutorial genérico traduzido de LLM.

O maior denunciador de texto de IA em português **não é uma palavra específica**;
é o *ritmo*. A máquina escreve frases todas do mesmo tamanho, quebradas em pontos
secos, sem subordinação. O olho brasileiro treinado percebe na hora: parece uma
lista de tópicos disfarçada de parágrafo. Corrigir isso é 70% do trabalho.

## Fluxo de trabalho

Siga estas fases. Não pule a fase 1 mesmo quando o usuário já entregou o tema
pronto — o que faz o texto soar humano é a especificidade, e ela vem do contexto.

1. **Contexto e ângulo.** Antes de escrever, colete: qual o tema, qual a *dor real*
   que motivou o post, e — o mais importante — que experiência concreta o autor
   viveu (um bug real, um número, um projeto, um erro que ele cometeu). Se o usuário
   não deu isso, pergunte por 1 ou 2 detalhes vividos. Um artigo sem nenhuma anedota
   ou dado específico vai soar de IA por mais que a gramática esteja perfeita.

2. **Esqueleto.** Monte a estrutura em tópicos rápidos e valide com o usuário antes
   de escrever por extenso. Aberturas devem entrar direto na dor ou numa cena
   concreta — nunca em "No mundo atual..." ou "Na era digital...".

3. **Rascunho.** Escreva seguindo as *Regras centrais* abaixo. Leia
   `references/pontuacao-e-ritmo.md` durante a escrita — é o coração da skill.

4. **Passagem anti-IA.** Releia o rascunho inteiro caçando os padrões de
   `references/antipadroes-ia.md`. Essa passagem é obrigatória.

5. **Passagem de voz.** Confira contra `references/voz-e-referencias.md`: tem
   primeira pessoa? Tem opinião assumida? Tem pelo menos um exemplo específico do
   Brasil real / do stack real do autor?

6. **Checklist final** (fim deste arquivo) antes de entregar.

## Regras centrais

Estas são as regras que valem em todo rascunho. O detalhamento está nos arquivos de
referência; aqui fica o essencial.

### 1. O período longo é o padrão; a frase curta é o soco (a regra mais importante)

Em português, a boa prosa corre em períodos longos, costurados por vírgula e
subordinação. A frase curta é rara e proposital: fecha um raciocínio com ênfase, depois
de três ou quatro períodos longos. O vício de IA é o oposto, com uma ideia por frase e
ponto atrás de ponto, tudo do mesmo tamanho.

**Antes (staccato, cara de IA):**
> O deploy quebrou. Eu não sabia o motivo. Fui olhar os logs. Não tinha nada claro.
> Isso me deixou preocupado.

**Depois (período composto, ritmo brasileiro):**
> Naquela sexta à noite, quando o deploy quebrou sem estourar um único erro, eu não
> fazia ideia de por onde começar, e foi justamente o silêncio nos logs que me
> preocupou mais do que um stack trace de mil linhas. Não era um bug. Era pior.

Repare no "Depois": a frase abre pela circunstância ("Naquela sexta à noite,
quando..."), corre longa e subordinada, e só então dois socos curtos fecham o
parágrafo. Esse é o ritmo. As três técnicas para chegar nele (frontear a circunstância,
encaixar aposto, ligar com conjunção) estão em `references/pontuacao-e-ritmo.md`; leia
antes de escrever.

### 2. Pontue com intenção, e quase nunca com travessão

Vírgula não é onde você respiraria; é onde a sintaxe pede. Não separe sujeito de
predicado nem verbo de complemento com vírgula, que é o erro que mais denuncia descuido.
Use o ponto e vírgula de propósito, porque ele liga duas orações irmãs sem o corte seco
do ponto. E segure o travessão com força: use no máximo **um** no artigo inteiro. A IA
abusa dele, e o leitor brasileiro treinado percebe na hora. Casos em
`references/pontuacao-e-ritmo.md`.

### 3. Seja específico até doer

Troque "uma ferramenta", "uma solução robusta", "diversos benefícios" por o nome
real, o número real, o arquivo real. Especificidade é o antídoto natural contra o
tom genérico de IA. Um `OrgContextService` que quebrou às 2h da manhã vale mais que
"um serviço de contexto que apresentou instabilidade".

### 4. Assuma uma pessoa por trás

Primeira pessoa, opinião declarada, e a liberdade de começar frase com "E" ou "Mas".
Humano tem preferência e erra de propósito para dar ênfase. Texto neutro, sem
nenhuma opinião nem anedota, cheira a máquina — mesmo impecável.

### 5. Código dentro do artigo

Identificadores, nomes de variáveis, funções e classes ficam em **inglês**;
comentários e a explicação em volta ficam em **português**. É o padrão que o autor
usa no dia a dia (Laravel/Filament/Vue) e mantém o texto coerente com código real.
Não traduza nomes de método nem termos consagrados (deploy, commit, merge, queue).

## Ajustes por gênero

As regras acima miram o post de blog técnico médio (~1000–2000 palavras). Ajuste:

- **Tutorial passo a passo:** frases podem ser mais diretas, mas mantenha a voz nas
  transições entre passos. Não deixe virar um manual sem alma.
- **Post de opinião / carreira:** puxe mais a primeira pessoa e a anedota; menos
  listas, mais parágrafo corrido.
- **Post curto / nota:** ritmo ainda importa; corte conectivos-muleta primeiro.

## Checklist final (rode antes de entregar)

Leia o texto uma última vez e confirme:

- [ ] O texto corre em períodos longos; frases curtas aparecem só como ênfase
      pontual, nunca como padrão. Nenhuma sequência de 3+ frases curtas uniformes.
- [ ] Várias frases começam pela circunstância (tempo, lugar, condição) seguida de
      vírgula, e não direto no sujeito.
- [ ] A abertura entra numa dor, cena ou pergunta concreta, e não em "No mundo..."
      / "Na era..." / "No cenário atual...".
- [ ] Nenhum conectivo-muleta de IA repetido ("além disso", "vale ressaltar",
      "é importante notar que", "em suma", "dessa forma"). Ver lista completa em
      `references/antipadroes-ia.md`.
- [ ] Nenhuma estrutura contrastiva batida ("não se trata apenas de X, mas de Y").
- [ ] O fecho não é um resumo genérico ("portanto, fica claro que..."); ele
      arremata com opinião, próximo passo ou uma pergunta ao leitor.
- [ ] Pelo menos um exemplo específico e verificável (número, nome de arquivo,
      erro real, projeto real).
- [ ] Vírgula não separa sujeito de predicado nem verbo de complemento.
- [ ] No máximo um travessão no artigo inteiro (idealmente zero).
- [ ] Dá para ouvir uma pessoa por trás: tem primeira pessoa e opinião assumida.

Se algum item falhar, volte e corrija antes de entregar. A gramática perfeita não
salva um texto sem ritmo e sem voz.

## Arquivos de referência

- `references/pontuacao-e-ritmo.md` — regras de vírgula, ponto, ponto e vírgula,
  travessão, dois-pontos e, principalmente, como construir ritmo (leia ao escrever).
- `references/antipadroes-ia.md` — catálogo dos clichês, conectivos e estruturas que
  denunciam IA em português (leia na passagem anti-IA).
- `references/voz-e-referencias.md` — voz autoral, público-alvo e blogs brasileiros
  de referência para calibrar tom.
