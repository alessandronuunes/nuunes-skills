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
for c in 'além disso' 'vale ressaltar' 'vale destacar' 'é importante notar' 'é importante ressaltar' 'dessa forma' 'desse modo' 'sendo assim' 'em suma' 'ou seja' 'nesse sentido'; do
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

## 8. Ritmo: sem trem de frases curtas

Palavras por frase, em ordem, ignorando títulos, listas e blocos de código:

```bash
grep -vE '^(#|-|\*|[0-9]+\.|```|>)' artigo.md | tr '\n' ' ' | perl -pe 's/([.!?])\s+/$1\n/g' | awk 'NF {print NF}'
```

PASSA se não existir nenhuma sequência de 3 ou mais frases seguidas com menos de 12
palavras, e se os períodos de 20+ palavras forem maioria no parágrafo corrido. A
frase curta existe, mas como soco isolado.

## 9. Fidelidade factual (manual, obrigatório)

Liste cada fato, nome, número, data, citação e anedota do texto e aponte de onde
veio: do pedido do usuário, do texto original ou de um `[PREENCHER]` que ele
respondeu. PASSA se nada foi inventado por você. Um único detalhe fabricado FALHA o
eval inteiro, por mais bonito que o texto tenha ficado.

## 10. Emoji decorativo: zero

PASSA se não houver emoji no texto, a menos que o usuário tenha pedido.
