# Eval: checagens de passa ou não passa

Rode este arquivo sobre o texto **final**, depois do checklist do SKILL.md. A
diferença para o checklist é que aqui nada é opinião: cada item tem critério
objetivo e, sempre que possível, um comando que dá o veredito. Reler o próprio
texto e se aprovar não conta como verificação; conte, meça, grepe.

Com acesso a shell, salve o texto num arquivo (ex.: `artigo.md`) e rode os
comandos. Sem shell, faça a contagem manualmente com o mesmo rigor: procure cada
padrão, um por um, e anote o número encontrado.

Entregue o resultado do eval junto do texto, item a item, PASSA ou FALHA. Qualquer
FALHA: corrija e rode o eval de novo. Não existe "falhou mas passa dessa vez".

## 1. Travessão: no máximo 1

```bash
grep -o '—' artigo.md | wc -l
```

Confira também `–` e ` - ` usados como travessão. PASSA se o total for 0 ou 1.
Exceção: se o usuário forneceu amostra da própria escrita e ela usa travessão,
o teto vira a taxa da amostra (conte lá e compare). A voz do autor passa por
cima do teto; a ausência de amostra, não.

## 2. Aberturas clichê: zero

```bash
grep -inE 'no mundo (atual|de hoje)|na era (digital|da informação)|nos dias de hoje|com o avanço da tecnologia|em um cenário cada vez mais|no cenário atual' artigo.md
```

PASSA se não houver nenhuma ocorrência.

## 3. Fechamentos genéricos: zero

```bash
grep -inE 'em conclusão|fica claro que|em (resumo|suma|síntese), vimos|espero que (este|esse) (artigo|post)|agora que você já sabe' artigo.md
```

PASSA se não houver nenhuma ocorrência. Confira ainda, no olho, se o último
parágrafo termina com pergunta retórica que o texto já respondeu — isso também FALHA.

## 4. Conectivo-muleta repetido: no máximo 1 de cada

```bash
for c in 'além disso' 'vale ressaltar' 'vale destacar' 'é importante notar' 'é importante ressaltar' 'cabe destacar' 'cabe ressaltar' 'dessa forma' 'desse modo' 'sendo assim' 'em suma' 'ou seja' 'nesse sentido' 'a fim de' 'devido ao fato' 'tem a capacidade de' 'no tocante a' 'no que tange' 'neste momento' 'em termos de' 'quando se trata de'; do
  n=$(grep -io "$c" artigo.md | wc -l | tr -d ' ')
  [ "$n" -gt 1 ] && echo "FALHA: '$c' aparece $n vezes"
done
```

PASSA se o loop não imprimir nada.

## 5. Gerundismo: zero

```bash
grep -inE '(vou|vamos|irei|iremos) estar [[:alpha:]]+ndo|(estarei|estaremos) [[:alpha:]]+ndo' artigo.md
```

PASSA se não houver nenhuma ocorrência.

## 6. Contraste binário: no máximo 1

```bash
grep -ioE 'não (se trata|é) (apenas|só) (de|sobre)|mais do que [^,.]+, é' artigo.md | wc -l
```

PASSA se o total for 0 ou 1.

## 7. Title Case em títulos: zero

Olhe cada linha de título (`#`, `##`, `###`). Em português, só a primeira palavra e
nomes próprios levam maiúscula. "Como Configurar O Seu Primeiro Deploy" FALHA;
"Como configurar o seu primeiro deploy" PASSA.

## 8. Ritmo: sem trem de frases curtas (só prosa corrida)

Este item vale para prosa corrida (artigo, newsletter, e-mail longo). Em texto
funcional (PR, commit, issue), pule: lá a frase direta é o certo.

Palavras por frase, em ordem, ignorando títulos, listas e blocos de código:

```bash
grep -vE '^(#|-|\*|[0-9]+\.|```|>)' artigo.md | tr '\n' ' ' | perl -pe 's/([.!?])\s+/$1\n/g' | awk 'NF {print NF}'
```

PASSA se não existir nenhuma sequência de 3 ou mais frases seguidas com menos de 12
palavras, e se os períodos de 20+ palavras forem maioria no parágrafo corrido. A
frase curta existe, mas como soco isolado.

## 9. Fidelidade factual (manual, obrigatório)

Duas listas, nas duas direções:

- **Nada inventado.** Liste cada fato, nome, número, data, citação e anedota do
  texto final e aponte de onde veio: do pedido do usuário, do texto original ou
  de um `[PREENCHER]` que ele respondeu.
- **Nada perdido.** No modo revisar, liste cada afirmação do texto original e
  confirme que sobreviveu à reescrita. Encurtar, fundir e
  reordenar pode; sumir com uma afirmação, não.

PASSA se nada foi inventado por você e nada do original se perdeu. Um único
detalhe fabricado ou uma afirmação perdida FALHA o eval inteiro, por mais bonito
que o texto tenha ficado. Este é o único item que o modo humanizar rápido também
roda, de cabeça, antes de devolver o trecho.

## 10. Emoji decorativo: zero

PASSA se não houver emoji no texto, a menos que o usuário tenha pedido.

## 11. Resíduo de chatbot: zero

```bash
grep -inE '^(claro|com certeza|certamente)[!,] |ótima pergunta|espero (ter ajudado|que (ajude|esta mensagem))|fico à disposição|não hesite em|quer que eu|posso continuar|aqui está (um|uma)|segue abaixo|até a data do meu|último treinamento|informações (específicas )?não estão (amplamente )?disponíveis' artigo.md
```

PASSA se não houver nenhuma ocorrência. Ver seção 15 de
`references/antipadroes-ia.md`.

## 12. Fonte vaga: zero sem nome

```bash
grep -inE 'especialistas (apontam|afirmam|dizem|concordam)|estudos (mostram|apontam|indicam|comprovam)|pesquisas (mostram|indicam|apontam)|muitos (acreditam|consideram|afirmam)|é amplamente (reconhecido|aceito)|segundo dados do setor' artigo.md
```

Cada ocorrência precisa de fonte nomeada na mesma frase ou na seguinte (autor,
link, número do próprio autor). PASSA se todas tiverem ou se não houver nenhuma.

## 13. Gerúndio de análise rasa: no máximo 1

```bash
grep -ioE ', (destacando|reforçando|evidenciando|demonstrando|contribuindo para|promovendo|refletindo|consolidando|garantindo) ' artigo.md | wc -l
```

PASSA se o total for 0 ou 1. Ver seção 13 de `references/antipadroes-ia.md`.

## 14. Anglicismo de tradução: zero

```bash
grep -inE 'tapeçaria|testamento (de|da|do|ao)|sem costura|alavanc|pavimentar o caminho|ressoa(r|m)? com|no final do dia|ao longo da jornada|(vamos|iremos|podemos) (mergulhar|aprofundar|explorar) (n|em)' artigo.md
grep -nE ', e [[:alpha:]]+[.;]' artigo.md
```

O primeiro grep tem de voltar vazio. O segundo caça vírgula de Oxford ("A, B, e
C"): olhe cada linha e confirme que a vírgula antes do "e" só aparece com sujeitos
diferentes. PASSA se nada indevido sobrar. Ver seção 20 de
`references/antipadroes-ia.md`.
