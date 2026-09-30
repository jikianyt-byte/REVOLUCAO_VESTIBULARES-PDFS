// ============================================================
//  LINGUAGENS · O SISTEMA OPERACIONAL · LABORATÓRIO
//  Aula L.2 · Capítulo do aluno · Regência, colocação e paralelismo na Redação
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
        align(right)[Laboratório · Aula L.2],
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
  modulo: "Laboratório · Gramática de Produção · Aula L.2",
  titulo: [Como não perder ponto de Redação por regência, colocação e paralelismo?],
  epigrafe: [Ninguém tira mil na Redação por escrever bonito. Tira mil quem não dá ao corretor nenhum motivo objetivo para descontar. E os três motivos objetivos mais comuns não são erros de ortografia — são erros de encaixe.],
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

= Aula L.2 — Os três erros que derrubam nota 1000 não estão na palavra: estão na conexão entre as palavras.

== A âncora

Quatro frases retiradas de redações reais de treineiros. Todas com vocabulário sofisticado. Todas com tese defensável. Todas perdendo ponto.

#v(0.5em)

#block(width: 100%, inset: 13pt, radius: 2pt, fill: rgb("#f0f5fa"),
  stroke: (left: 3pt + deep, rest: 0.4pt + rule))[
  #set par(justify: false, leading: 0.95em)
  #text(size: 10.5pt)[
    *(A)* "É necessário que o Estado *implique em* políticas de inclusão."\
    *(B)* "*Me* parece evidente que a desigualdade persiste."\
    *(C)* "O governo deve não apenas *investir* em saúde, mas também *a* educação *precisa de verba*."\
    *(D)* "A mídia, *cujo* o poder é imenso, *visa o* lucro."
  ]
]

#v(0.5em)

Leia de novo, em voz alta. Você provavelmente *entendeu todas as quatro*. É exatamente aí que está a armadilha: nenhuma delas é incompreensível. Todas são apenas *malfeitas* — e a Competência 1 do ENEM não avalia se o corretor entendeu você. Avalia se você domina a modalidade escrita formal.

Vamos ao raio-X:

Em *(A)*, "implicar" no sentido de "acarretar" não pede preposição. O correto é *implique políticas*. Você colou um "em" que a gramática não pediu — provavelmente por confusão com "implicar-se em".

Em *(B)*, "Me parece" é oralidade legítima na fala brasileira e proibida na escrita formal: pronome oblíquo não inicia período. Escreve-se *Parece-me*.

Em *(C)*, a frase começa uma estrutura ("não apenas... mas também...") e a abandona no meio do caminho: o primeiro membro é verbo com objeto, o segundo é uma oração inteira com outro sujeito. A promessa sintática foi rompida.

Em *(D)*, dois erros num fôlego: "cujo" já é possessivo e não admite artigo depois (*cujo poder*), e "visar", no sentido de "ter por objetivo", exige preposição (*visa ao lucro*).

#v(0.4em)

#chave[
  Nenhum desses erros é de ortografia, de acento ou de vocabulário. Todos são erros de *encaixe*: peças certas, montadas na ordem ou na conexão erradas.
]

== A desconstrução

Você acredita que perde ponto na Competência 1 por "erro de português" — e imagina algo como escrever *"exceção"* com dois esses. Isso quase nunca acontece com você. O que acontece, item por item, é o seguinte: você escreve frases longas, ambiciosas, com dois ou três verbos e uma enumeração — e, no meio dessa ambição, perde o fio da estrutura que você mesmo abriu.

#v(0.45em)

#peca("mentira 1 — “erro gramatical é erro de palavra”", red)[
  #set par(justify: false, leading: 0.72em)
  Falso. Palavra isolada quase não erra. O que erra é *relação*: qual preposição o verbo exige (regência), onde o pronome pode se apoiar (colocação), e se as partes coordenadas têm a mesma forma (paralelismo). Todos os três são erros de *sintaxe de ligação* — exatamente o que o Eixo 2 chamou de costura, agora aplicado ao seu texto, não ao texto do outro.
]

#v(0.45em)

#peca("mentira 2 — “se soa bem, está certo”", ochre)[
  #set par(justify: false, leading: 0.72em)
  O ouvido é péssimo consultor aqui, e por um motivo científico, não moral: o Eixo 6 já provou que a variedade brasileira falada tem gramática própria e legítima. *"Me empresta"*, *"assisti o filme"*, *"a mulher que eu falei dela"* são formas coerentes do português brasileiro real.
  #v(0.3em)
  O problema é de *adequação*, não de correção. Você não está escrevendo errado — está escrevendo em outro registro do que o exigido. E na Redação o registro é contratual: modalidade escrita formal. Quem confunde "errado" com "inadequado" fica paralisado; quem entende a diferença troca de registro sem culpa e sem medo.
]

#v(0.45em)

#peca("mentira 3 — “frase complexa vale mais ponto”", purple)[
  #set par(justify: false, leading: 0.72em)
  Vale menos, se quebrar. Uma frase de sete linhas com paralelismo rompido custa mais caro que três frases curtas impecáveis. O Eixo 3 mostrou que período longo é *marca de poder institucional* — mas também mostrou que ele é barreira. Na sua redação, o período longo é sobretudo *risco*: cada oração encaixada é uma nova chance de errar regência ou perder a simetria.
]

== A engenharia do conceito

Os três problemas são o mesmo problema visto de três ângulos: *a estrutura que você abriu precisa ser fechada do modo como foi aberta*.

#v(0.5em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    content((7, 8.7), text(size: 9pt, weight: "bold", fill: deep)[OS TRÊS ENCAIXES — MESMA LÓGICA, TRÊS NÍVEIS])

    let itens = (
      ("REGÊNCIA", teal, "O verbo/nome EXIGE uma preposição?", "“visar ao lucro”, não “visar o lucro”", "Nível: palavra ↔ complemento"),
      ("COLOCAÇÃO", mid, "Onde o pronome oblíquo pode se apoiar?", "“Parece-me”, não “Me parece”", "Nível: pronome ↔ verbo"),
      ("PARALELISMO", purple, "As partes coordenadas têm a MESMA forma?", "“investir em saúde e em educação”", "Nível: oração ↔ oração"),
    )

    for (i, it) in itens.enumerate() {
      let (tit, cor, perg, ex, niv) = it
      let y = 7.4 - i * 2.05
      rect((0.4, y - 0.9), (13.6, y + 0.9),
        fill: cor.lighten(95%), stroke: (left: 3.5pt + cor, rest: 0.4pt + rule), radius: 2pt)
      content((0.9, y + 0.5), anchor: "west",
        text(size: 8.6pt, weight: "bold", fill: cor.darken(10%))[#tit])
      content((0.9, y - 0.05), anchor: "west", box(width: 7.4cm)[
        #set par(leading: 0.5em, justify: false)
        #text(size: 7.4pt, fill: deep)[#perg]])
      content((0.9, y - 0.62), anchor: "west", box(width: 7.4cm)[
        #set par(leading: 0.5em, justify: false)
        #text(size: 7pt, style: "italic", fill: gray)[#niv]])
      content((8.9, y), anchor: "west", box(width: 4.4cm)[
        #set par(leading: 0.5em, justify: false)
        #text(size: 7.4pt, weight: "bold", fill: green.darken(10%))[#ex]])
    }

    rect((0.4, 0.15), (13.6, 1.15), fill: rgb("#f0f5fa"),
      stroke: (left: 3pt + deep, rest: 0.4pt + rule), radius: 2pt)
    content((7, 0.65), box(width: 12.8cm)[#align(center)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.6pt, fill: deep)[
        *O princípio único:* toda estrutura sintática é uma *promessa*. O verbo promete um tipo de complemento; a frase promete uma simetria.\
        Erro de Competência 1, nesses três casos, é sempre uma promessa aberta e não cumprida.]]])
  }),
  legenda: [Repare na escala crescente: regência opera entre uma palavra e seu complemento, colocação entre pronome e verbo, paralelismo entre orações inteiras. Quanto maior a escala, maior a distância entre o erro e o ponto onde ele nasceu — e por isso paralelismo é o mais difícil de enxergar na revisão.],
  largura: 100%,
)

=== 1. Regência: o verbo é quem manda, não você

Regência é a exigência que uma palavra faz sobre seu complemento. Não há lógica dedutível — há *memória de casos rentáveis*. E rentáveis são poucos: os que aparecem em texto argumentativo sobre políticas públicas, direitos e sociedade. Ou seja, exatamente os que você vai usar.

#v(0.4em)

#caixa("os treze verbos que decidem sua competência 1")[
  #set par(justify: false, leading: 0.92em)
  · *Visar* = ter por objetivo → *visa ao lucro*, *visa à inclusão*. (Sem preposição só em "visar o cheque".)
  #v(0.2em)
  · *Implicar* = acarretar → *implica mudanças* (sem "em"). Este é o erro nº 1 das redações de treineiro.
  #v(0.2em)
  · *Assistir* = ver → *assistir ao debate*. *Assistir* = prestar assistência → *assistir o paciente*.
  #v(0.2em)
  · *Obedecer / desobedecer* → sempre *a*: *obedecer à lei*.
  #v(0.2em)
  · *Aspirar* = desejar → *aspirar ao cargo*. (Sem preposição só no sentido de inalar.)
  #v(0.2em)
  · *Preferir* → *preferir A a B*. Nunca "do que", nunca "mais": *prefiro o diálogo à imposição*.
  #v(0.2em)
  · *Esquecer / lembrar* → sem pronome, sem preposição (*esqueci o nome*); com pronome, com preposição (*esqueci-me do nome*).
  #v(0.2em)
  · *Informar / avisar* → *informar alguém de algo*: *informar a população dos riscos*.
  #v(0.2em)
  · *Necessitar / carecer / dispor* → sempre *de*: *carece de investimento*.
  #v(0.2em)
  · *Consistir* → sempre *em*: *consiste em garantir acesso*. Nunca "consiste de".
  #v(0.2em)
  · *Ir / chegar* → lugar exige *a*, não "em": *chegar à escola*, *ir ao órgão competente*.
]

#v(0.5em)

#alerta("regência e crase são o mesmo problema")[
  #set par(justify: false, leading: 0.82em)
  Volte à aula L.1: crase é preposição `a` + artigo `a`. Se você não sabe se o verbo exige *a*, você não pode decidir a crase — e vai errar os dois de uma vez.
  #v(0.3em)
  *"Visa à inclusão"* tem crase porque *visar* exige *a* e *inclusão* admite artigo. *"Assistiu ao jogo"* leva *ao* pela mesma exigência. Quem escreve "visa a inclusão" ou "assistiu o jogo" não errou acento: errou regência, e o acento apenas denunciou.
]

=== 2. Colocação pronominal: três posições, uma proibição absoluta

Você não precisa decorar as regras completas. Precisa de um teto e um piso.

#v(0.4em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    content((7, 7.6), text(size: 9pt, weight: "bold", fill: deep)[AS TRÊS POSIÇÕES DO PRONOME OBLÍQUO])

    // Próclise
    rect((0.4, 5.5), (13.6, 6.9), fill: green.lighten(94%),
      stroke: (left: 3.5pt + green, rest: 0.4pt + rule), radius: 2pt)
    content((0.9, 6.55), anchor: "west",
      text(size: 8.4pt, weight: "bold", fill: green.darken(15%))[PRÓCLISE — antes do verbo · *há palavra atrativa*])
    content((0.9, 5.95), anchor: "west", box(width: 12.4cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        Atraem o pronome: *negação* (não, nunca, jamais, ninguém) · *pronomes relativos e interrogativos* (que, quem, qual) ·
        *conjunções subordinativas* (quando, se, porque, embora) · *advérbios* sem vírgula (sempre, talvez, aqui).\
        #text(weight: "bold", fill: green.darken(10%))[“Não *se* discute o problema.” · “O direito que *lhe* cabe.” · “Quando *me* perguntaram…”]]])

    // Ênclise
    rect((0.4, 3.7), (13.6, 5.1), fill: mid.lighten(93%),
      stroke: (left: 3.5pt + mid, rest: 0.4pt + rule), radius: 2pt)
    content((0.9, 4.75), anchor: "west",
      text(size: 8.4pt, weight: "bold", fill: mid.darken(15%))[ÊNCLISE — depois do verbo · *padrão quando não há atrativo*])
    content((0.9, 4.15), anchor: "west", box(width: 12.4cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        É a posição default da escrita formal, e a única possível no *início de período* e depois de *vírgula* ou *pausa*.\
        #text(weight: "bold", fill: mid.darken(10%))[“Trata-*se* de um problema estrutural.” · “Parece-*me* evidente.” · “Discute-*se* muito o tema.”]]])

    // Mesóclise
    rect((0.4, 1.9), (13.6, 3.3), fill: purple.lighten(94%),
      stroke: (left: 3.5pt + purple, rest: 0.4pt + rule), radius: 2pt)
    content((0.9, 2.95), anchor: "west",
      text(size: 8.4pt, weight: "bold", fill: purple.darken(10%))[MESÓCLISE — no meio do verbo · *futuro do presente / futuro do pretérito sem atrativo*])
    content((0.9, 2.35), anchor: "west", box(width: 12.4cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        Raríssima e desnecessária. Existe, é elegante, e você pode simplesmente *evitar a construção*.\
        #text(weight: "bold", fill: purple.darken(5%))[“Garantir-*se*-á o acesso.”] → prefira #text(weight: "bold", fill: green.darken(10%))[“O acesso será garantido.”]]])

    // Proibição
    rect((0.4, 0.15), (13.6, 1.5), fill: red.lighten(94%),
      stroke: (left: 3.5pt + red, rest: 0.4pt + rgb("#feb2b2")), radius: 2pt)
    content((0.9, 1.15), anchor: "west",
      text(size: 8.4pt, weight: "bold", fill: red.darken(10%))[A PROIBIÇÃO ABSOLUTA])
    content((0.9, 0.6), anchor: "west", box(width: 12.4cm)[
      #set par(leading: 0.55em, justify: false)
      #text(size: 7.4pt, fill: deep)[
        *Nunca* comece um período (ou uma oração após vírgula) com pronome oblíquo átono.\
        #text(weight: "bold", fill: red.darken(5%))[“Me parece…” ✗ · “Se trata de…” ✗ · “Lhe cabe o direito…” ✗] → *Parece-me* · *Trata-se* · *Cabe-lhe*]])
  }),
  legenda: [A hierarquia prática: se há palavra atrativa, próclise; se não há, ênclise. Mesóclise você reconhece na prova de interpretação e evita na sua folha. O único erro que o corretor jamais perdoa é a oralidade do pronome inicial — porque é o mais visível de todos.],
  largura: 100%,
)

Há uma exceção que vale ouro: *com verbo no particípio, jamais use ênclise*. Não existe "tinha dito-me". Escreve-se *"tinha me dito"* ou *"tinha-me dito"*. E depois de preposição *"em"* + gerúndio, próclise: *"em se tratando de"*.

=== 3. Paralelismo: a promessa sintática

Paralelismo é o princípio mais valioso desta aula porque é o único que o corretor lê como *problema de estrutura*, não de gramática — e por isso pode atingir a Competência 1 *e* a Competência 4 ao mesmo tempo.

A ideia é simples: quando você coordena elementos, todos devem ter *a mesma natureza sintática*.

#v(0.4em)

#caixa("paralelismo sintático — o teste do espelho")[
  #set par(justify: false, leading: 0.9em)
  ✗ "O projeto visa à *inclusão* e *melhorar* a renda." → substantivo + verbo.\
  ✓ "O projeto visa à *inclusão* e à *melhoria* da renda." → substantivo + substantivo.
  #v(0.3em)
  ✗ "É preciso *que se invista* em escolas e *ampliar* o acesso." → oração + infinitivo.\
  ✓ "É preciso *investir* em escolas e *ampliar* o acesso."
  #v(0.3em)
  ✗ "Não apenas *o Estado deve agir*, mas também *a sociedade*." → oração + substantivo solto.\
  ✓ "Não apenas *o Estado* deve agir, mas também *a sociedade*."
  #v(0.3em)
  *Teste:* leia o primeiro membro, pule o conectivo e cole o segundo direto no verbo. Se a frase desmonta, o paralelismo quebrou.\
  "visa à inclusão" / "visa à melhorar a renda" → desmontou.
]

#v(0.5em)

Existe também o *paralelismo semântico*: coordenar coisas que pertencem à mesma classe de sentido. "A escola combate a desigualdade, a evasão e *o Ministério da Educação*" está sintaticamente perfeita e semanticamente absurda — você somou dois problemas e uma instituição.

E existe o paralelismo dos *pares correlativos*, que a prova adora e a sua redação precisa: *não só… mas também*, *tanto… quanto*, *nem… nem*, *ora… ora*, *quanto mais… mais*. Abriu o primeiro, é obrigatório fechar com o segundo. "Não só investir, *como também* fiscalizar" é aceitável; "não só investir, *e* fiscalizar" é ruptura.

=== 4. A estratégia real: a economia do risco

Aqui está o segredo prático que nenhuma lista de regras te dá. Você tem cerca de 30 períodos numa redação de 30 linhas. Seu objetivo não é escrever os 30 com sofisticação máxima — é escrever *zero* deles com estrutura rompida.

#v(0.4em)

#peca("o protocolo dos 40 segundos de revisão", teal)[
  #set par(justify: false, leading: 0.78em)
  *1.* Circule todo pronome *me, se, lhe, o, a, nos* que estiver em início de linha ou logo após ponto ou vírgula. Reposicione.
  #v(0.2em)
  *2.* Circule todo *e*, *ou*, *mas também*, *bem como*. Aplique o teste do espelho nos dois lados.
  #v(0.2em)
  *3.* Circule *visar, implicar, assistir, obedecer, preferir, aspirar, informar*. Confira a preposição.
  #v(0.2em)
  *4.* Achou um período com mais de três linhas e você não tem certeza da estrutura? *Corte em dois com um ponto.* Ponto não é erro. Estrutura rompida é.
]

#v(0.4em)

#chave[
  Na dúvida, simplifique. A Competência 1 não premia coragem sintática — pune estrutura quebrada. Frase curta e correta vale mais que frase longa e ambiciosa que desmontou na terceira linha.
]

== A regra do jogo

#block(
  width: 100%, fill: rgb("#f0f5fa"), inset: 14pt, radius: 3pt,
  stroke: (left: 4pt + deep, rest: 0.5pt + rule),
)[
  #text(size: 11.5pt, weight: "bold", fill: deep)[O que você leva desta aula]
  #v(0.5em)
  #set enum(spacing: 0.7em)
  + *Os três erros são erros de encaixe, não de palavra.* Regência (palavra ↔ complemento), colocação (pronome ↔ verbo), paralelismo (oração ↔ oração).
  + *Regência é memória de casos, não dedução.* Domine treze verbos e você cobre 90% do que sua redação vai exigir.
  + *Implicar não pede "em"* quando significa acarretar. *Visar, aspirar, obedecer, assistir (ver)* pedem *a*.
  + *Nunca inicie período com pronome oblíquo átono.* "Me parece" → *Parece-me*. "Se trata" → *Trata-se*.
  + *Regra prática de colocação:* palavra atrativa (negação, relativo, conjunção subordinativa, advérbio) → próclise. Sem atrativo → ênclise. Mesóclise: evite reescrevendo.
  + *Nunca ênclise com particípio.* "Tinha me dito", nunca "tinha dito-me".
  + *Paralelismo sintático:* elementos coordenados têm a mesma forma. Substantivo com substantivo, infinitivo com infinitivo, oração com oração.
  + *Teste do espelho:* pule o conectivo e cole o segundo membro direto no verbo. Se desmonta, quebrou.
  + *Par correlativo aberto é par correlativo fechado:* não só… mas também; tanto… quanto; nem… nem.
  + *Regência mal resolvida gera erro de crase.* Os dois problemas são um só: L.1 e L.2 se cobram na mesma linha da sua folha.
  + *Ponto final não é erro.* Na dúvida entre um período longo arriscado e dois curtos seguros, escolha os dois curtos.
]

#pagebreak()

= OQPS — A LINHA DE CHEGADA

#text(size: 9.5pt, fill: gray, style: "italic")[Sem consultar. Resposta curta e técnica.]

#v(0.8em)

#set enum(spacing: 1.5em, numbering: n => text(weight: "bold", fill: deep)[#n.])

+ Defina *regência verbal* e explique por que um erro de regência frequentemente produz, na mesma linha, um erro de crase.

+ Enuncie a regra prática que decide entre *próclise* e *ênclise*, e cite três tipos de palavra atrativa.

+ Qual é a proibição absoluta da colocação pronominal na modalidade escrita formal? Corrija: *"Me parece que se trata de um erro."*

+ Defina *paralelismo sintático* e descreva o teste que permite detectar sua ruptura.

+ Diferencie a regência de *implicar* (no sentido de acarretar) da de *visar* (no sentido de ter por objetivo), com um exemplo de cada.

#pagebreak()

= GABARITO OQPS

#v(0.8em)

#set enum(spacing: 1.4em, numbering: n => text(weight: "bold", fill: ochre)[#n.])

+ *Regência verbal* é a exigência que o verbo faz quanto à presença e ao tipo de preposição do seu complemento. Como a crase é a fusão da preposição *a* com o artigo *a*, decidir a crase depende de saber se o verbo exige *a*: quem não sabe que *visar* (ter por objetivo) é transitivo indireto escreve "visa a inclusão" em vez de "visa à inclusão" — o erro nasce na regência e apenas se manifesta no acento.

+ *Regra prática:* havendo palavra atrativa antes do verbo, usa-se *próclise* (pronome antes); não havendo, usa-se *ênclise* (pronome depois, ligado por hífen). Três tipos de atrativo: *palavras de sentido negativo* (não, nunca, ninguém, jamais); *pronomes relativos e interrogativos* (que, quem, qual); *conjunções subordinativas* (quando, se, porque, embora). Também atraem os *advérbios* não seguidos de vírgula.

+ *Proibição absoluta:* não se inicia período — nem oração após pausa/vírgula — com pronome oblíquo átono. Correção: *"Parece-me que se trata de um erro."* (Observe que o segundo pronome permanece em próclise, porque a conjunção *que* é palavra atrativa.)

+ *Paralelismo sintático* é o princípio segundo o qual elementos coordenados entre si devem apresentar a mesma natureza e função sintática (substantivo com substantivo, infinitivo com infinitivo, oração com oração). *Teste do espelho:* suprima o conectivo e ligue o segundo membro diretamente ao termo regente do primeiro; se a construção resultante for impossível, o paralelismo foi rompido.

+ *Implicar*, no sentido de acarretar, é *transitivo direto* — não admite preposição: "A medida *implica mudanças* estruturais." *Visar*, no sentido de ter por objetivo, é *transitivo indireto* e exige a preposição *a*: "A política *visa à redução* da desigualdade." São, portanto, exigências opostas, e ambas contrariam a intuição da fala.

#v(1.4em)

#block(
  width: 100%, fill: light, inset: 13pt, radius: 3pt,
  stroke: (left: 4pt + ochre, rest: 0.5pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: ochre, tracking: 1pt)[FINALIZAÇÃO DA AULA]
  #v(0.5em)
  *Você não perde ponto de Redação por regência, colocação e paralelismo quando entende que os três são o mesmo erro — uma estrutura sintática aberta e não cumprida — e passa a revisar sua folha caçando encaixes em vez de caçando palavras: preposição que o verbo exige, pronome que não pode abrir período, e simetria obrigatória entre elementos coordenados, cortando em dois todo período longo cuja arquitetura você não consegue garantir.*
  #v(0.6em)
  E guarde a implicação estratégica, porque a próxima etapa do Laboratório inverte a mão: até aqui você usou a gramática para *não errar*; a partir de agora vai usá-la para *convencer* — as mesmas estruturas de coordenação e subordinação viram arquitetura de argumento, e o paralelismo que aqui era obrigação técnica reaparece como o recurso rítmico que o Eixo 5 chamou de anáfora e que Castro Alves usou para fazer um comício virar poema.
]

// PENDÊNCIAS VISUAIS:
// Nenhuma obrigatória. Fig. 1 (os três encaixes) e Fig. 2 (posições do pronome)
// são nativas em CeTZ.
// Expansão opcional: Fig. 3 — reprodução de fragmento real de folha de redação
// corrigida do ENEM (recorte com marcações do corretor em Competência 1,
// tarjas sobre dados do candidato). Altura ~7cm.
