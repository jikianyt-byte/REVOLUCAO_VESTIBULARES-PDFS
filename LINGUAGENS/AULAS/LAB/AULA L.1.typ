// ============================================================
//  LINGUAGENS · O SISTEMA OPERACIONAL · LABORATÓRIO
//  Aula L.1 · Capítulo do aluno · Acento e crase como operadores de sentido
// ============================================================

#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2cm),
  numbering: "1 / 1",
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: rgb("#718096"))
      grid(columns: (1fr, auto),
        [REVOLUÇÃO VESTIBULARES · Linguagens: O Sistema Operacional],
        align(right)[Laboratório · Aula L.1],
      )
      line(length: 100%, stroke: 0.3pt + rgb("#cbd5e0"))
    }
  },
)

#import "@preview/cetz:0.3.4": canvas, draw
#counter("fig").update(1)

#set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.5pt, lang: "pt")
#set par(justify: true, leading: 0.68em, first-line-indent: 0pt)

// ---------- PALETA ----------
#let deep   = rgb("#1a365d")
#let mid    = rgb("#2b6cb0")
#let ochre  = rgb("#975a16")
#let red    = rgb("#c53030")
#let green  = rgb("#276749")
#let purple = rgb("#553c9a")
#let teal   = rgb("#285e61")
#let gray   = rgb("#4a5568")
#let light  = rgb("#f7fafc")
#let rule   = rgb("#cbd5e0")

// ---------- TÍTULOS ----------
#show heading.where(level: 1): it => {
  block(width: 100%, inset: (y: 8pt), stroke: (bottom: 1.1pt + deep),
    text(size: 15pt, weight: "bold", fill: deep, it.body))
  v(0.5em)
}
#show heading.where(level: 2): it => {
  v(0.9em)
  text(size: 9pt, weight: "bold", fill: ochre, tracking: 1.2pt, upper(it.body))
  v(0.35em)
}
#show heading.where(level: 3): it => {
  v(0.6em); text(size: 11pt, weight: "bold", fill: mid, it.body); v(0.15em)
}

// ---------- COMPONENTES ----------
#let caixa(titulo, body) = block(
  width: 100%, fill: light, inset: 12pt, radius: 2pt,
  stroke: (left: 3pt + mid, rest: 0.4pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: mid, tracking: 0.8pt)[#upper(titulo)]
  #v(0.4em)
  #body
]

#let alerta(titulo, body) = block(
  width: 100%, fill: rgb("#fff5f5"), inset: 12pt, radius: 2pt,
  stroke: (left: 3pt + red, rest: 0.4pt + rgb("#feb2b2")),
)[
  #text(size: 8.5pt, weight: "bold", fill: red, tracking: 0.8pt)[#upper(titulo)]
  #v(0.4em)
  #body
]

#let chave(body) = align(center, block(
  width: 92%, inset: 10pt, stroke: (y: 0.8pt + deep),
  text(size: 11pt, weight: "bold", fill: deep, body),
))

#let peca(rot, cor, corpo) = block(
  width: 100%, fill: rgb("#fdfdfc"), inset: 11pt, radius: 2pt,
  stroke: (left: 3pt + cor, rest: 0.4pt + rule),
)[
  #text(size: 8pt, weight: "bold", fill: cor, tracking: 1pt)[#upper(rot)]
  #v(0.35em)
  #set text(size: 10.5pt)
  #corpo
]

// ---------- FIGURAS ----------
#let fig(corpo, legenda: none, largura: 85%, fonte: none) = {
  v(0.9em)
  align(center)[
    #block(width: largura, breakable: false)[
      #corpo
      #if legenda != none {
        v(0.5em)
        set par(justify: false, leading: 0.55em)
        text(size: 8.5pt, fill: rgb("#4a5568"))[
          #text(weight: "bold", fill: mid)[Fig. #context counter("fig").display() — ]#legenda
          #if fonte != none { text(style: "italic", size: 8pt)[ (#fonte)] }
        ]
      }
    ]
  ]
  counter("fig").step()
  v(0.9em)
}

#let ph(nota, altura: 5cm) = block(
  width: 100%, height: altura, radius: 2pt, fill: rgb("#eef2f7"),
  stroke: (paint: rule, thickness: 0.6pt, dash: "dashed"),
)[
  #align(center + horizon)[
    #text(size: 8pt, weight: "bold", fill: mid, tracking: 1pt)[IMAGEM PENDENTE]
    #v(0.3em)
    #text(size: 8.5pt, fill: rgb("#718096"), style: "italic")[#nota]
  ]
]

#let img(caminho, largura: 100%) = image(caminho, width: largura)

// ============================================================
//  CAPA
// ============================================================

#let capa(
  curso: "Revolução Vestibulares",
  disciplina: "Linguagens · O Sistema Operacional",
  modulo: "Laboratório · Ortografia Forense · Aula L.1",
  titulo: [Quando o acento e a crase realmente mudam o sentido (e quando não mudam nada)?],
  epigrafe: [Existem dois tipos de sinal gráfico no português: os que carregam informação e os que carregam apenas obediência. A escola ensinou os dois com o mesmo peso — e foi assim que você perdeu tempo com o segundo e errou o primeiro.],
) = {
  block(
    width: 100%, inset: (x: 20pt, y: 22pt), radius: 3pt, fill: light,
    stroke: (left: 5pt + deep, rest: 0.5pt + rule),
  )[
    #grid(
      columns: (1fr, auto),
      align: (left + horizon, right + horizon),
      text(size: 13pt, weight: "bold", fill: deep, tracking: 2.5pt)[#upper(curso)],
      text(size: 8pt, weight: "bold", fill: ochre, tracking: 1pt)[#upper(disciplina)],
    )

    #v(6pt)
    #line(length: 100%, stroke: 0.8pt + rule)
    #v(6pt)

    #text(size: 8.5pt, weight: "medium", fill: rgb("#4a5568"), tracking: 1.4pt)[#upper(modulo)]

    #v(20pt)

    #block(width: 100%)[
      #set par(justify: false, leading: 0.55em)
      #text(size: 21pt, weight: "bold", fill: deep)[#titulo]
    ]

    #v(16pt)
    #line(length: 34%, stroke: 1.6pt + ochre)
    #v(14pt)

    #block(width: 100%, inset: (left: 14pt, y: 4pt), stroke: (left: 2.5pt + ochre))[
      #set par(justify: false, leading: 0.62em)
      #text(size: 11.5pt, style: "italic", fill: rgb("#744210"))[#epigrafe]
    ]
  ]
  v(1.4em)
}

#capa()

= Aula L.1 — O sinal gráfico só importa quando ele é a única coisa que separa dois sentidos possíveis.

== A âncora

Quatro pares. Leia em voz alta e repare no que muda — e no que não muda.

#v(0.5em)

#block(width: 100%, inset: 13pt, radius: 2pt, fill: rgb("#f0f5fa"),
  stroke: (left: 3pt + deep, rest: 0.4pt + rule))[
  #set par(justify: false, leading: 0.95em)
  #text(size: 10.5pt)[
    *(1)* Ele *secretaria* o evento. · Ele foi à *secretaria*. · Ele foi à *secretária*.\
    *(2)* *Nós* fomos. · Deu um *nó*. · O *nós* da frase é vago.\
    *(3)* Vendo *a* prazo. · Vendo *à* vista.\
    *(4)* Refiro-me *a* Maria. · Refiro-me *à* Maria. · Refiro-me *a* Vossa Excelência.
  ]
]

#v(0.5em)

Em (1), o acento decide *quem ou o quê*: um verbo, um lugar ou uma pessoa. Três realidades diferentes numa letra com chapéu.

Em (3), a coisa fica cirúrgica. *"Vendo a prazo"* e *"vendo à vista"* — por que uma leva acento grave e a outra não? Porque *prazo* é masculino e *vista* é feminino, e a crase é a fusão da preposição `a` com o artigo `a`. Mas repare no que isso significa: o acento grave em *à vista* não muda **nada** no sentido. Ele apenas registra graficamente uma fusão que sua boca já fez. Você entenderia perfeitamente a frase sem ele.

E em (4) o acento é praticamente uma questão de gosto: *"a Maria"* ou *"à Maria"*, dependendo de você usar ou não artigo antes do nome — e as duas formas são aceitas.

Ou seja: no mesmo campo — acentuação e crase — convivem sinais que **decidem o sentido** e sinais que **apenas cumprem protocolo**. E a prova sabe distinguir. Você precisa saber também.

#v(0.4em)

#chave[
  A pergunta certa nunca é "tem acento?". É: "se eu tirar este acento, sobra outra palavra possível ou sobra apenas um erro?"
]

== A desconstrução

Você foi treinado a tratar acentuação como um sistema de regras a decorar — proparoxítona, paroxítona terminada em ditongo, oxítona em `a`, `e`, `o`. E foi treinado a temer a crase como um bicho. As duas coisas produziram o mesmo aluno: alguém que sabe recitar regras e não sabe **ler** o que o sinal faz.

#v(0.45em)

#peca("mentira 1 — “o ENEM cobra regra de acentuação”", red)[
  #set par(justify: false, leading: 0.72em)
  Não cobra. Não existe item que peça "justifique a acentuação de *saúde*". O que existe é item que pergunta o *efeito de sentido* — e aí o acento entra quando ele é **distintivo**: quando separar *pôr* de *por*, *têm* de *tem*, *está* de *esta* altera quem age, quando age ou quantos agem.
  #v(0.3em)
  Regra de acentuação serve para a Redação (Competência 1). Acento distintivo serve para a interpretação. São duas funções diferentes do mesmo sinal, e você precisa saber em qual das duas está.
]

#v(0.45em)

#peca("mentira 2 — “crase é a regra mais difícil do português”", ochre)[
  #set par(justify: false, leading: 0.72em)
  Crase não é regra. É uma **soma**: preposição `a` + artigo `a` = `à`. Todo o resto é consequência aritmética disso. Se não há preposição, não há crase. Se a palavra seguinte não admite artigo feminino, não há crase. Duas verificações, não vinte.
  #v(0.3em)
  Difícil é o que se decorou como lista de exceções. Fácil é o que se entendeu como operação.
]

#v(0.45em)

#peca("mentira 3 — “todo sinal gráfico carrega significado”", purple)[
  #set par(justify: false, leading: 0.72em)
  Falso — e essa é a lição mais valiosa da aula. A maior parte dos acentos do português é **redundante**: eles registram uma pronúncia que você já faz. *Café*, *ônibus*, *saída* — tire o acento e ninguém lê diferente. O acento ali é convenção ortográfica, não informação.
  #v(0.3em)
  A minoria dos acentos é **distintiva**: sem ele, a palavra vira outra palavra. Essa minoria é onde a prova mora. Aprender a separar as duas categorias vale mais que decorar as regras das duas.
]

== A engenharia do conceito

=== 1. A distinção que organiza tudo: redundante × distintivo

#v(0.5em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    content((7, 8.5), text(size: 9pt, weight: "bold", fill: deep)[AS DUAS FUNÇÕES DO SINAL GRÁFICO])

    // Coluna esquerda
    rect((0.4, 4.6), (6.8, 7.9), fill: gray.lighten(93%),
      stroke: (left: 3pt + gray, rest: 0.4pt + rule), radius: 2pt)
    content((0.85, 7.55), anchor: "west",
      text(size: 8.5pt, weight: "bold", fill: gray.darken(20%))[REDUNDANTE — “protocolo”])
    content((0.85, 6.9), anchor: "west", box(width: 5.5cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        Registra uma pronúncia que o leitor já faria sem o sinal.\
        *café · ônibus · saída · herói · à vista*]])
    content((0.85, 5.6), anchor: "west", box(width: 5.5cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.2pt, fill: gray.darken(15%))[
        Tirar o sinal → *erro de escrita*.\
        Onde importa: *Redação, Competência 1*.]])

    // Coluna direita
    rect((7.2, 4.6), (13.6, 7.9), fill: red.lighten(94%),
      stroke: (left: 3pt + red, rest: 0.4pt + rgb("#feb2b2")), radius: 2pt)
    content((7.65, 7.55), anchor: "west",
      text(size: 8.5pt, weight: "bold", fill: red.darken(10%))[DISTINTIVO — “informação”])
    content((7.65, 6.9), anchor: "west", box(width: 5.5cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        É a única marca que separa dois sentidos possíveis.\
        *pôr / por · têm / tem · secretária / secretaria*]])
    content((7.65, 5.6), anchor: "west", box(width: 5.5cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.2pt, fill: red.darken(10%))[
        Tirar o sinal → *outra frase*.\
        Onde importa: *interpretação e itens de sentido*.]])

    // Teste
    line((7, 4.4), (7, 3.7), mark: (end: "stealth"), stroke: 0.7pt + deep)
    rect((1.6, 2.7), (12.4, 3.7), fill: rgb("#f0f5fa"),
      stroke: (left: 3pt + deep, rest: 0.4pt + rule), radius: 2pt)
    content((7, 3.2), box(width: 10.2cm)[#align(center)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 8pt, weight: "bold", fill: deep)[
        TESTE DA SUPRESSÃO: apague o sinal e releia a frase.\
        #text(weight: "regular", size: 7.6pt)[Se ainda faz sentido (só está errada) → redundante. Se muda de sentido ou fica ambígua → distintivo.]]]])

    // Consequência
    rect((1.6, 1.4), (12.4, 2.4), fill: green.lighten(94%),
      stroke: (left: 3pt + green, rest: 0.4pt + rule), radius: 2pt)
    content((7, 1.9), box(width: 10.2cm)[#align(center)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.8pt, fill: green.darken(15%))[
        A banca só transforma em *questão de interpretação* o sinal distintivo.\
        O redundante ela cobra em você — na sua folha de redação.]]])
  }),
  legenda: [O teste da supressão é mais econômico que qualquer regra: ele não pergunta *por que* o acento existe, pergunta *o que se perde* sem ele. Perda de sentido = objeto de prova. Perda de norma = objeto de correção.],
  largura: 100%,
)

=== 2. O catálogo dos acentos que mudam o mundo

Estes você não decora: você **reconhece**, porque cada par é uma decisão de sentido. São poucos e valem muito.

#v(0.4em)

#caixa("acentos distintivos — o que cada um decide")[
  #set par(justify: false, leading: 0.9em)
  · *pôr* (verbo) × *por* (preposição) → decide se há ação ou apenas relação.
  #v(0.2em)
  · *têm / vêm* (plural) × *tem / vem* (singular) → decide **quantos** agem. É o acento mais cobrado do português, porque a diferença é de número e não se ouve com clareza na fala.
  #v(0.2em)
  · *está* (verbo) × *esta* (pronome) → decide se a frase tem predicado ou só aponta.
  #v(0.2em)
  · *secretária* (pessoa) × *secretaria* (lugar / verbo) → decide o referente.
  #v(0.2em)
  · *sábia* (adjetivo) × *sabia* (pretérito) × *sabiá* (ave) → três classes, uma sílaba tônica de diferença.
  #v(0.2em)
  · *dúvida* (substantivo) × *duvida* (verbo); *público* × *publico* × *publicou*.
  #v(0.2em)
  · *pára* (verbo, forma antiga) × *para* (preposição) → o Acordo Ortográfico aboliu o acento, e ao abolir **criou ambiguidade real**: "*Ele para o carro*" pode ser lido como ação ou como finalidade. Guarde este caso: é a prova de que acento distintivo é informação, porque a informação desapareceu junto com ele.
]

#v(0.5em)

#alerta("o único trema, os únicos hiatos, e o que o acordo ortográfico apagou")[
  #set par(justify: false, leading: 0.82em)
  O Acordo de 1990 eliminou: o trema (*linguiça*, não *lingüiça*), o acento dos ditongos abertos em paroxítonas (*ideia*, *heroico*, *jiboia*), o acento de *feiúra* → *feiura*, e o acento diferencial de *pára*, *pêlo*, *pólo*, *pêra*.
  #v(0.3em)
  Sobreviveram, e sobreviveram exatamente por serem distintivos: *pôr*, *pôde* (passado) × *pode* (presente), *têm/vêm*, *fôrma* (facultativo, quando há risco de ambiguidade). Note o critério do legislador: manteve-se o acento **onde ele carregava informação de tempo, número ou classe**. É a nossa distinção, oficializada em decreto.
]

=== 3. A crase, resolvida em duas perguntas

Esqueça as listas. Crase é `a` + `a`. Logo, só existe se as duas parcelas existirem.

#v(0.5em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    content((7, 9.3), text(size: 9pt, weight: "bold", fill: deep)[O FLUXO DA CRASE — DUAS PERGUNTAS, TRÊS SAÍDAS])

    // P1
    rect((3.4, 7.9), (10.6, 8.8), fill: mid.lighten(90%),
      stroke: (paint: mid, thickness: 0.7pt), radius: 2pt)
    content((7, 8.35), text(size: 8pt, weight: "bold", fill: mid.darken(15%))[
      P1 · O termo anterior EXIGE a preposição “a”?])

    line((7, 7.9), (7, 7.3), stroke: 0.6pt + gray)
    line((3.0, 7.3), (11.0, 7.3), stroke: 0.6pt + gray)
    line((3.0, 7.3), (3.0, 6.85), mark: (end: "stealth"), stroke: 0.6pt + red)
    line((11.0, 7.3), (11.0, 6.85), mark: (end: "stealth"), stroke: 0.6pt + green)
    content((2.55, 7.08), text(size: 7pt, weight: "bold", fill: red)[NÃO])
    content((11.5, 7.08), text(size: 7pt, weight: "bold", fill: green)[SIM])

    rect((0.4, 5.9), (5.6, 6.85), fill: red.lighten(94%),
      stroke: (left: 3pt + red, rest: 0.4pt + rgb("#feb2b2")), radius: 2pt)
    content((3.0, 6.38), box(width: 4.6cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 7.2pt, fill: red.darken(10%))[
        *SEM CRASE.* Nem discuta.\
        “Assisti *a* aula” / “Cheguei *a* casa”]]])

    rect((8.4, 5.9), (13.6, 6.85), fill: green.lighten(94%),
      stroke: (left: 3pt + green, rest: 0.4pt + rule), radius: 2pt)
    content((11.0, 6.38), box(width: 4.6cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 7.2pt, fill: green.darken(15%))[
        Metade do caminho.\
        Vá para P2.]]])

    // P2
    line((11.0, 5.9), (11.0, 5.45), stroke: 0.6pt + gray)
    line((11.0, 5.45), (7, 5.45), stroke: 0.6pt + gray)
    line((7, 5.45), (7, 5.05), mark: (end: "stealth"), stroke: 0.6pt + gray)

    rect((3.4, 4.1), (10.6, 5.05), fill: mid.lighten(90%),
      stroke: (paint: mid, thickness: 0.7pt), radius: 2pt)
    content((7, 4.58), box(width: 6.8cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 8pt, weight: "bold", fill: mid.darken(15%))[
        P2 · A palavra seguinte ADMITE o artigo “a/as”?]]])

    line((7, 4.1), (7, 3.6), stroke: 0.6pt + gray)
    line((3.0, 3.6), (11.0, 3.6), stroke: 0.6pt + gray)
    line((3.0, 3.6), (3.0, 3.15), mark: (end: "stealth"), stroke: 0.6pt + red)
    line((11.0, 3.6), (11.0, 3.15), mark: (end: "stealth"), stroke: 0.6pt + green)
    content((2.55, 3.38), text(size: 7pt, weight: "bold", fill: red)[NÃO])
    content((11.5, 3.38), text(size: 7pt, weight: "bold", fill: green)[SIM])

    rect((0.4, 2.0), (5.6, 3.15), fill: red.lighten(94%),
      stroke: (left: 3pt + red, rest: 0.4pt + rgb("#feb2b2")), radius: 2pt)
    content((3.0, 2.58), box(width: 4.6cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 7.2pt, fill: red.darken(10%))[
        *SEM CRASE.*\
        verbo, masculino, plural indefinido,\
        pronome pessoal, “a Vossa Excelência”]]])

    rect((8.4, 2.0), (13.6, 3.15), fill: green.lighten(94%),
      stroke: (left: 3pt + green, rest: 0.4pt + rule), radius: 2pt)
    content((11.0, 2.58), box(width: 4.6cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 7.4pt, weight: "bold", fill: green.darken(15%))[
        CRASE: *à*\
        “Obedeço *à* lei” / “Fui *à* praia”]]])

    // Atalho
    rect((0.4, 0.25), (13.6, 1.5), fill: rgb("#fffaf0"),
      stroke: (left: 3pt + ochre, rest: 0.4pt + rule), radius: 2pt)
    content((7, 0.88), box(width: 12.6cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.6pt, fill: ochre.darken(15%))[
        *ATALHO DA TROCA PELO MASCULINO* — substitua a palavra feminina por um masculino equivalente.\
        Se sair *“ao”* → há crase (“Fui à feira” → “Fui ao mercado”). Se sair *“o”* → não há (“Vendo a prazo”).\
        Este atalho resolve a P1 e a P2 de uma vez, porque o masculino torna visível a preposição que o feminino esconde.]])
  }),
  legenda: [Repare na assimetria: a P1 é sobre *regência* (o termo anterior pede "a"?), a P2 é sobre *determinação* (o substantivo aceita artigo?). Quem erra crase quase sempre erra a P1 — isto é, erra regência, não erra acento.],
  largura: 100%,
)

=== 4. As três crases que efetivamente mudam o sentido

Aqui está o que a prova pode cobrar como interpretação — e é uma lista curta.

#v(0.4em)

#caixa("crase distintiva")[
  #set par(justify: false, leading: 0.9em)
  · *"Cheguei a casa"* × *"Cheguei à casa"* → sem crase, *casa* é o meu lar (sem determinação). Com crase, é uma casa específica, determinada, alheia. O sinal decide **de quem é a casa**.
  #v(0.25em)
  · *"Refiro-me a terra"* × *"Refiro-me à terra"* → sem crase, *terra* é o oposto de mar (visão de quem navega). Com crase, é o planeta ou um lugar determinado. O sinal decide **a escala do referente**.
  #v(0.25em)
  · *"Pintou o quadro a Portinari"* × *"à Portinari"* → sem crase, Portinari recebeu o quadro. Com crase (ou "à moda de"), o quadro foi pintado *no estilo* dele. O sinal decide **se alguém é destinatário ou modelo**.
  #v(0.25em)
  · *"Matou-o a bala"* × *"Matou-o à bala"* → instrumento único × modo/estilo de execução. Clássico de banca.
]

#v(0.5em)

Compare com o volume gigantesco de casos em que a crase é pura convenção — *à noite*, *à tarde*, *às vezes*, *à medida que*, *à vista*, *à mão*. Nenhuma dessas mudaria uma vírgula do sentido se fosse escrita sem o acento. São locuções cristalizadas: você as escreve certo porque é norma, não porque comunicam algo a mais.

#v(0.4em)

#chave[
  A crase é distintiva quando o artigo determina um referente que, sem ele, seria genérico. Em locução adverbial fixa, ela é só ortografia.
]

=== 5. Por que isso é uma aula de leitura, e não de gramática

Volte ao princípio do curso: nenhuma peça linguística é neutra, e classificar só vale se a classificação mudar a interpretação. Acento e crase são o teste extremo dessa regra — porque aqui existe, comprovadamente, uma parte do sistema que **não muda a interpretação**. E ter a coragem de dizer isso é o que separa quem estuda português de quem decora português.

O que você ganha: um filtro. Diante de um sinal gráfico sublinhado numa prova, você não pergunta qual regra o justifica. Pergunta o que ele resolve. Se resolve uma ambiguidade — é o objeto da questão. Se não resolve nada — a questão está em outro lugar, e você acabou de economizar quarenta segundos.

== A regra do jogo

#block(
  width: 100%, fill: rgb("#f0f5fa"), inset: 14pt, radius: 3pt,
  stroke: (left: 4pt + deep, rest: 0.5pt + rule),
)[
  #text(size: 11.5pt, weight: "bold", fill: deep)[O que você leva desta aula]
  #v(0.5em)
  #set enum(spacing: 0.7em)
  + *Todo sinal gráfico é redundante ou distintivo.* Redundante registra pronúncia; distintivo separa sentidos.
  + *Teste da supressão:* apague o sinal. Se sobra erro, é redundante. Se sobra ambiguidade, é distintivo.
  + *Redundante importa na Redação* (Competência 1). *Distintivo importa na interpretação.* Nunca confunda os dois campos.
  + *Os acentos que decidem sentido são poucos:* pôr/por, têm/tem, vêm/vem, pôde/pode, está/esta, secretária/secretaria, sábia/sabia/sabiá, dúvida/duvida, público/publico.
  + *O Acordo Ortográfico confirmou o princípio:* apagou acento redundante (trema, ideia, heroico) e preservou acento distintivo (pôr, pôde, têm).
  + *Crase é soma:* preposição `a` + artigo `a` = `à`. Duas perguntas resolvem tudo — o termo anterior exige preposição? A palavra seguinte admite artigo?
  + *Atalho do masculino:* trocou e virou "ao" → crase. Virou "o" → sem crase.
  + *Nunca há crase antes de:* verbo, palavra masculina, plural indefinido ("a pessoas"), pronome pessoal, "Vossa Excelência", "casa" e "terra" sem determinação.
  + *Crase distintiva é lista curta:* a/à casa, a/à terra, a/à Portinari, a/à bala. Fora disso, locução adverbial fixa é só norma.
  + *Quem erra crase, na verdade, errou regência.* O acento é o sintoma; o diagnóstico está no verbo.
]

#pagebreak()

= OQPS — A LINHA DE CHEGADA

#text(size: 9.5pt, fill: gray, style: "italic")[Sem consultar. Resposta curta e técnica.]

#v(0.8em)

#set enum(spacing: 1.5em, numbering: n => text(weight: "bold", fill: deep)[#n.])

+ Diferencie *acento redundante* de *acento distintivo* e enuncie o teste que separa um do outro.

+ Explique, em uma linha, por que o Acordo Ortográfico de 1990 aboliu o acento de *ideia* e *heroico* mas preservou o de *pôr* e *pôde*.

+ Defina crase em termos de sua composição morfológica e cite as duas perguntas que decidem sua ocorrência.

+ Cite três contextos em que a crase é *impossível*, independentemente da regência do termo anterior.

+ Diferencie, quanto ao sentido, *"Cheguei a casa"* de *"Cheguei à casa"*, e explique qual elemento gramatical produz essa diferença.

#pagebreak()

= GABARITO OQPS

#v(0.8em)

#set enum(spacing: 1.4em, numbering: n => text(weight: "bold", fill: ochre)[#n.])

+ *Redundante:* o acento apenas registra graficamente uma pronúncia que o leitor faria de todo modo (*café*, *ônibus*, *à vista*); sua ausência gera erro de escrita, não perda de sentido. *Distintivo:* o acento é a única marca que separa dois significados, classes ou flexões possíveis (*pôr/por*, *têm/tem*). *Teste da supressão:* apague o sinal e releia — se a frase permanece com o mesmo sentido, o acento era redundante; se muda de sentido ou se torna ambígua, era distintivo.

+ Porque em *ideia* e *heroico* o acento não distinguia nada — a pronúncia é a mesma com ou sem ele —, enquanto em *pôr* e *pôde* o acento é a única marca que separa verbo de preposição e pretérito de presente, isto é, carrega informação de classe e de tempo.

+ Crase é a *fusão da preposição "a" com o artigo definido feminino "a/as"*, grafada com acento grave (`à`). Duas perguntas: **(P1)** o termo anterior exige a preposição *a* (questão de regência)? **(P2)** a palavra seguinte admite o artigo *a/as* (questão de determinação)? Só há crase se ambas forem afirmativas.

+ Três dentre: antes de *verbo* ("Passou a estudar"); antes de *palavra masculina* ("Vendo a prazo"); antes de *plural indefinido* ("Refiro-me a pessoas honestas"); antes de *pronome pessoal* ("Dirigi-me a ela"); antes dos pronomes de tratamento com *Vossa/Sua* ("Dirijo-me a Vossa Excelência"); antes de *casa* e *terra* sem determinação.

+ *"Cheguei a casa"* — sem artigo, *casa* é o próprio lar do falante, referente genérico e não determinado. *"Cheguei à casa"* — com artigo, trata-se de uma casa específica, determinada, presumivelmente de outra pessoa (e normalmente seguida de especificação: "à casa de meu tio"). O elemento responsável é o *artigo definido*, cuja presença dentro da crase converte um referente genérico em referente determinado.

#v(1.4em)

#block(
  width: 100%, fill: light, inset: 13pt, radius: 3pt,
  stroke: (left: 4pt + ochre, rest: 0.5pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: ochre, tracking: 1pt)[FINALIZAÇÃO DA AULA]
  #v(0.5em)
  *O acento e a crase mudam realmente o sentido apenas quando são distintivos — isto é, quando são a única marca gráfica que separa duas classes, dois tempos, dois números ou dois graus de determinação do referente (pôr/por, têm/tem, a casa/à casa) — e não mudam nada quando são redundantes, registrando uma pronúncia ou uma locução cristalizada que o leitor reconheceria de qualquer modo (café, ideia, à noite, às vezes), caso em que o sinal pertence à Redação e não à interpretação.*
  #v(0.6em)
  Guarde o mecanismo, porque ele vai se repetir de forma mais violenta na próxima aula do Laboratório: se o acento pode decidir *quantos* agem, a *vírgula* pode decidir *quem* age, *quem* é excluído e *quem* paga a conta — é o Eixo 3 voltando com o bisturi na mão, agora no nível do sinal de pontuação que já custou milhões em contrato.
]

// PENDÊNCIAS VISUAIS:
// Nenhuma obrigatória. Fig. 1 (redundante × distintivo + teste da supressão)
// e Fig. 2 (fluxo decisório da crase) são nativas em CeTZ.
// Expansão opcional: Fig. 3 — reprodução fotográfica de placa comercial real
// com erro de crase ("Vendo à prazo" / "Sorvete á vontade"), fachada de comércio
// brasileiro, para leitura do erro em ambiente natural. Altura ~6cm.
