// ============================================================
//  LINGUAGENS · O SISTEMA OPERACIONAL · LABORATÓRIO
//  Aula L.3 · Capítulo do aluno · Leitura de tabela, gráfico e mapa
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
        align(right)[Laboratório · Aula L.3],
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
  modulo: "Laboratório · Leitura de Dados e Infográficos · Aula L.3",
  titulo: [Como se lê uma tabela, um gráfico e um mapa como se lê um parágrafo?],
  epigrafe: [Você não "olha" um gráfico. Você o lê. E se você só olha, alguém já escreveu a conclusão por você antes de a sua vista chegar lá.],
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

= Aula L.3 — Todo dado é uma frase. Tem sujeito, tem verbo, tem recorte — e tem alguém que escolheu por você.

== A âncora

Duas imagens do *mesmo número*, publicadas na mesma semana, sobre o mesmo assunto.

#v(0.5em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    let vals = (100, 103, 106, 108)
    let anos = ("2022", "2023", "2024", "2025")

    // ---------- GRÁFICO A: eixo truncado ----------
    content((3.4, 7.7), text(size: 8.4pt, weight: "bold", fill: red.darken(10%))[VERSÃO A — “EXPLOSÃO”])
    // eixos
    line((1.0, 1.6), (1.0, 7.1), stroke: 0.7pt + gray)
    line((1.0, 1.6), (6.2, 1.6), stroke: 0.7pt + gray)
    // rótulos do eixo y truncado (98 a 110)
    for (i, v) in (98, 102, 106, 110).enumerate() {
      let y = 1.6 + i * 1.75
      line((0.85, y), (1.0, y), stroke: 0.6pt + gray)
      content((0.6, y), text(size: 6.5pt, fill: gray)[#v])
    }
    // barras: escala (v-98)/12 * 5.25
    for (i, v) in vals.enumerate() {
      let x = 1.5 + i * 1.15
      let h = (v - 98) / 12 * 5.25
      rect((x, 1.6), (x + 0.75, 1.6 + h), fill: red.lighten(55%), stroke: 0.5pt + red)
      content((x + 0.375, 1.3), text(size: 6.5pt, fill: gray)[#anos.at(i)])
    }
    content((3.6, 0.6), box(width: 5.2cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 6.8pt, fill: red.darken(15%))[Início do eixo em *98*. A última barra parece *5 vezes* a primeira.]]])

    // ---------- GRÁFICO B: eixo na origem ----------
    content((11.0, 7.7), text(size: 8.4pt, weight: "bold", fill: green.darken(10%))[VERSÃO B — “ESTABILIDADE”])
    line((8.6, 1.6), (8.6, 7.1), stroke: 0.7pt + gray)
    line((8.6, 1.6), (13.8, 1.6), stroke: 0.7pt + gray)
    for (i, v) in (0, 40, 80, 120).enumerate() {
      let y = 1.6 + i * 1.75
      line((8.45, y), (8.6, y), stroke: 0.6pt + gray)
      content((8.15, y), text(size: 6.5pt, fill: gray)[#v])
    }
    for (i, v) in vals.enumerate() {
      let x = 9.1 + i * 1.15
      let h = v / 120 * 5.25
      rect((x, 1.6), (x + 0.75, 1.6 + h), fill: green.lighten(60%), stroke: 0.5pt + green)
      content((x + 0.375, 1.3), text(size: 6.5pt, fill: gray)[#anos.at(i)])
    }
    content((11.2, 0.6), box(width: 5.2cm)[#align(center)[
      #set par(leading: 0.5em, justify: false)
      #text(size: 6.8pt, fill: green.darken(15%))[Início do eixo em *0*. A variação real aparece: *+8%* em três anos.]]])
  }),
  legenda: [Os quatro valores plotados são idênticos nas duas versões: 100, 103, 106 e 108. O que muda é apenas onde o eixo vertical começa. Nenhuma das duas mente sobre o dado — mas apenas uma delas conta a verdade sobre a *proporção*. Truncar o eixo é o equivalente visual de escolher um adjetivo avaliativo: não altera o fato, altera o juízo que você forma dele.],
  largura: 100%,
)

Se você olhou a Versão A e sentiu "nossa, disparou", você não foi enganado por um número falso. Você foi enganado por um *recurso de linguagem*. Exatamente como acontece quando a manchete escolhe "vândalos" em vez de "manifestantes".

#v(0.4em)

#chave[
  Gráfico truncado é a versão gráfica do adjetivo avaliativo. Mesmo fato, outro juízo.
]

== A desconstrução

Você trata dado como algo que *não precisa ser interpretado*. Número parece limpo, neutro, imune a opinião — e é justamente por isso que ele é a ferramenta retórica mais eficiente que existe hoje. Quem quer te convencer não te dá um argumento: te dá um gráfico, porque gráfico dispensa argumento.

#v(0.45em)

#peca("mentira 1 — “número não tem autor”", red)[
  #set par(justify: false, leading: 0.72em)
  Tem, e ele deixou impressão digital em cinco lugares antes de você bater o olho: *quem coletou*, *o que exatamente foi medido*, *qual recorte de tempo*, *qual unidade* e *qual tipo de gráfico foi escolhido*. Cinco decisões humanas antes do primeiro pixel.
  #v(0.3em)
  Na Versão A alguém decidiu começar o eixo em 98. Essa decisão é uma tese: "isso está explodindo". Você leu a tese e achou que tinha lido um fato.
]

#v(0.45em)

#peca("mentira 2 — “ler gráfico é matemática”", ochre)[
  #set par(justify: false, leading: 0.72em)
  Não é. Cálculo aqui é aritmética de terceira série — regra de três, porcentagem, subtração. O que a prova cobra é *leitura*: identificar variáveis, comparar, e principalmente reconhecer o *limite do que o dado autoriza afirmar*. É o mesmo trabalho de 0.4: separar o que o texto diz, o que ele implica e o que você achou.
]

#v(0.45em)

#peca("mentira 3 — “se o dado mostra os dois juntos, um causou o outro”", purple)[
  #set par(justify: false, leading: 0.72em)
  Este é o erro mais caro da prova inteira. Duas curvas que sobem juntas mostram *correlação* — andar junto. Não mostram *causalidade* — um produzir o outro. O consumo de sorvete e o número de afogamentos sobem juntos todo verão; sorvete não afoga ninguém. Existe uma terceira variável (calor) explicando as duas.
  #v(0.3em)
  Qualquer alternativa que transforme correlação em causa é distrator. E é o distrator mais bonito de todos, porque parece inteligente.
]

== A engenharia do conceito

Um infográfico é um *texto*. Tem título (tese), eixos (categorias gramaticais), fonte (autoria), legenda (contrato de leitura) e escala (ênfase). Ler no lugar errado é como ler uma crônica buscando informação.

=== 1. O protocolo dos seis passos — sempre nesta ordem

#v(0.4em)

#fig(
  canvas(length: 1cm, {
    import draw: *

    content((7, 9.5), text(size: 9pt, weight: "bold", fill: deep)[PROTOCOLO DE LEITURA DE DADOS — A ORDEM É OBRIGATÓRIA])

    let passos = (
      ("1 · TÍTULO", teal, "O que exatamente está sendo medido?", "“Homicídios” ≠ “mortes violentas” ≠ “sensação de insegurança”."),
      ("2 · FONTE E DATA", mid, "Quem produziu e quando?", "IBGE, instituto contratado, empresa do setor: interesse muda o recorte."),
      ("3 · EIXOS E UNIDADE", purple, "Número absoluto ou taxa? % de quê?", "1.000 casos em SP ≠ 1.000 casos no Acre. Taxa por 100 mil resolve."),
      ("4 · RECORTE TEMPORAL", ochre, "Onde a série começa e termina?", "Escolher o ano-base é escolher a conclusão."),
      ("5 · TENDÊNCIA", green, "Sobe, cai, oscila, estabiliza? Onde vira?", "Descreva o movimento antes de explicá-lo."),
      ("6 · LIMITE", red, "O que este dado NÃO autoriza dizer?", "O dado mostra o quê. Quase nunca mostra o por quê."),
    )

    for (i, p) in passos.enumerate() {
      let (tit, cor, perg, obs) = p
      let y = 8.3 - i * 1.38
      rect((0.4, y - 0.58), (13.6, y + 0.58),
        fill: cor.lighten(95%), stroke: (left: 3.5pt + cor, rest: 0.4pt + rule), radius: 2pt)
      content((0.85, y + 0.24), anchor: "west",
        text(size: 8pt, weight: "bold", fill: cor.darken(12%))[#tit])
      content((0.85, y - 0.28), anchor: "west", box(width: 5.6cm)[
        #set par(leading: 0.48em, justify: false)
        #text(size: 7.2pt, fill: deep)[#perg]])
      content((6.9, y), anchor: "west", box(width: 6.4cm)[
        #set par(leading: 0.5em, justify: false)
        #text(size: 7pt, style: "italic", fill: gray)[#obs]])
    }

    rect((0.4, 0.15), (13.6, 0.95), fill: rgb("#f0f5fa"),
      stroke: (left: 3pt + deep, rest: 0.4pt + rule), radius: 2pt)
    content((7, 0.55), box(width: 12.8cm)[#align(center)[
      #text(size: 7.4pt, fill: deep)[*Os passos 1 a 4 são leitura do contrato. Os passos 5 e 6 são a resposta da questão.*]]])
  }),
  legenda: [Repare que quatro dos seis passos acontecem *antes* de você olhar as barras. Aluno que começa no passo 5 acerta a descrição do movimento e erra a interpretação — porque não sabe o que estava sendo movido.],
  largura: 100%,
)

=== 2. Tabela: a leitura em cruz

Tabela não se lê da esquerda para a direita como parágrafo. Lê-se em *cruz*: você fixa uma linha e percorre as colunas (evolução de um caso no tempo), ou fixa uma coluna e percorre as linhas (comparação entre casos no mesmo momento).

#v(0.4em)

#caixa("as três perguntas que resolvem qualquer tabela")[
  #set par(justify: false, leading: 0.9em)
  · *Qual o extremo?* Maior e menor valor — e a que categoria pertencem.
  #v(0.2em)
  · *Qual a exceção?* A célula que rompe o padrão das outras. Prova adora perguntar dela.
  #v(0.2em)
  · *Qual a comparação que o enunciado pediu?* Não leia a tabela toda. Leia a interseção pedida.
  #v(0.2em)
  *Cuidado técnico:* linha "Total" e linha "Outros" não são categorias comparáveis às demais. Somar ou comparar com elas é o erro clássico de linha.
]

=== 3. Gráfico: a forma escolhida já é um argumento

Cada tipo de gráfico serve para *uma* operação. Usar o tipo errado é como usar gênero errado — o suporte já distorce a mensagem.

#v(0.4em)

#caixa("qual gráfico serve para o quê")[
  #set par(justify: false, leading: 0.9em)
  · *Barras/colunas* → comparar quantidades entre categorias distintas.
  #v(0.15em)
  · *Linhas* → mostrar evolução de uma variável contínua no tempo. Só faz sentido se o eixo X for temporal.
  #v(0.15em)
  · *Setores (pizza)* → mostrar composição de um total 100%. Não serve para evolução, e fica ilegível com mais de seis fatias.
  #v(0.15em)
  · *Dispersão* → sugerir relação entre duas variáveis. Sugerir, note bem: nunca provar causa.
  #v(0.15em)
  · *Pirâmide etária* → estrutura de população por sexo e faixa de idade. Base larga = população jovem; base estreitando = envelhecimento.
]

#v(0.4em)

#alerta("as quatro manipulações que você tem obrigação de detectar")[
  #set par(justify: false, leading: 0.85em)
  *1. Eixo truncado* — não começa no zero. Amplia visualmente diferenças mínimas. (Versão A da âncora.)
  #v(0.2em)
  *2. Recorte de conveniência* — a série começa exatamente no ano que favorece a tese. Sempre pergunte: e antes disso?
  #v(0.2em)
  *3. Absoluto disfarçado de taxa* — comparar números brutos entre populações de tamanhos diferentes. "O estado X tem mais casos" é quase sempre "o estado X tem mais gente".
  #v(0.2em)
  *4. Área e volume desproporcionais* — o ícone dobra de altura *e* de largura, mas a área quadruplica. Seu olho lê área; o dado dobrou.
]

=== 4. Mapa: a projeção é a opinião do cartógrafo

Mapa é o infográfico mais persuasivo que existe, porque parece cópia da realidade. Não é. Toda projeção é uma escolha sobre *o que distorcer* — nenhuma planifica a esfera sem sacrifício.

#v(0.4em)

#fig(
  ph([Duas projeções mundiais lado a lado, mesma escala de exibição, com grade de meridianos/paralelos visível: (esq.) *Mercator* — projeção cilíndrica conforme, destacando o inflacionamento de Groenlândia, Canadá, Rússia e Europa em relação à África e ao Brasil; (dir.) *Peters/Gall* ou *Equal Earth* — projeção equivalente, com a África em área proporcional real. Rotular explicitamente: "Groenlândia ≈ 2,2 milhões km²" e "África ≈ 30 milhões km²" nas duas versões.], altura: 6.5cm),
  legenda: [Na Mercator a Groenlândia parece do tamanho da África; na realidade cabe quatorze vezes dentro dela. A projeção que serviu à navegação colonial é a mesma que inflou visualmente o Norte por quatro séculos — e é o exemplo mais limpo de que forma visual carrega tese, não só informação.],
  fonte: "IBGE / Atlas escolar ou base cartográfica de domínio público",
  largura: 100%,
)

#v(0.3em)

#caixa("o que ler em qualquer mapa, nesta ordem")[
  #set par(justify: false, leading: 0.9em)
  · *Título e tema* — mapa de quê: político, físico, temático, de fluxo?
  #v(0.15em)
  · *Legenda* — a chave de decodificação. Sem ela, cor é enfeite.
  #v(0.15em)
  · *Escala* — grande escala (1:1.000) = pouca área, muito detalhe. Pequena escala (1:10.000.000) = muita área, pouco detalhe. Sim: é o inverso da intuição.
  #v(0.15em)
  · *Orientação e projeção* — norte para cima é convenção, não lei da natureza.
  #v(0.15em)
  · *Padrão espacial* — onde o fenômeno se concentra, onde ele falta, e se a concentração coincide com concentração populacional (quase sempre coincide, e quase nunca é a explicação).
  #v(0.15em)
  *Coroplético (mapa por cores em áreas):* a cor cobre o polígono inteiro e apaga a variação interna. Um estado "vermelho" pode ter três municípios críticos e cinquenta tranquilos.
]

=== 5. O passo 6, que decide a questão

Aqui está o que separa nota alta de nota média. A alternativa correta em questão de infográfico *quase nunca* explica o fenômeno. Ela descreve o que o dado autoriza — e as erradas extrapolam.

#v(0.4em)

#peca("o teste do “o dado mostra isso?”", teal)[
  #set par(justify: false, leading: 0.78em)
  Um gráfico mostra que a taxa de evasão escolar caiu 12% após a criação de um programa de bolsas.
  #v(0.25em)
  ✗ "O programa de bolsas *reduziu* a evasão." → causalidade não demonstrada. Pode ter havido mudança demográfica, mudança de critério de contagem, outro programa simultâneo.
  #v(0.2em)
  ✓ "Houve queda de 12% na taxa de evasão *no período posterior* à criação do programa." → é isso, e só isso, que está na folha.
  #v(0.25em)
  *Palavras que denunciam extrapolação na alternativa:* provoca, causa, resulta de, comprova, todos, sempre, tende a se manter. Se o dado é uma fotografia, alternativa que fala de futuro é chute.
]

== A regra do jogo

#block(
  width: 100%, fill: rgb("#f0f5fa"), inset: 14pt, radius: 3pt,
  stroke: (left: 4pt + deep, rest: 0.5pt + rule),
)[
  #text(size: 11.5pt, weight: "bold", fill: deep)[O que você leva desta aula]
  #v(0.5em)
  #set enum(spacing: 0.7em)
  + *Dado é texto com autor.* Título, fonte, unidade, recorte e tipo de gráfico são cinco decisões humanas — leia todas antes das barras.
  + *Protocolo fixo:* título → fonte/data → eixos e unidade → recorte temporal → tendência → limite. Nunca comece pela tendência.
  + *Eixo que não começa no zero amplia diferença mínima.* Confira a origem do eixo Y antes de sentir qualquer coisa.
  + *Número absoluto não se compara entre populações diferentes.* Exige taxa (por 100 mil, per capita, percentual).
  + *Correlação nunca é causalidade.* Duas curvas juntas podem ter uma terceira variável explicando as duas.
  + *Cada gráfico tem uma função:* barras comparam, linhas mostram evolução, setores mostram composição, dispersão sugere relação.
  + *Tabela se lê em cruz*, não em varredura. E "Total" e "Outros" não são categorias comparáveis.
  + *Em mapa, projeção é tese.* Mercator infla altas latitudes; nenhuma projeção é neutra.
  + *Escala grande = área pequena com muito detalhe.* É contraintuitivo e é cobrado.
  + *Mapa coroplético apaga variação interna* da unidade colorida.
  + *A alternativa correta descreve; a errada explica.* Desconfie de causa, comprovação, totalidade e previsão.
]

#pagebreak()

= OQPS — A LINHA DE CHEGADA

#text(size: 9.5pt, fill: gray, style: "italic")[Sem consultar. Resposta curta e técnica.]

#v(0.8em)

#set enum(spacing: 1.5em, numbering: n => text(weight: "bold", fill: deep)[#n.])

+ Enuncie, em ordem, os seis passos do protocolo de leitura de dados e indique em qual deles a maioria dos alunos erra por começar cedo demais.

+ Explique o efeito do *truncamento do eixo Y* e por que ele não constitui, tecnicamente, falsificação do dado.

+ Diferencie *correlação* de *causalidade* e cite o tipo de terceira variável que torna a confusão possível.

+ Por que comparar *números absolutos* entre duas unidades territoriais é um erro metodológico, e qual recurso o corrige?

+ Defina *escala grande* e *escala pequena* em cartografia e explique o que um *mapa coroplético* oculta por construção.

#pagebreak()

= GABARITO OQPS

#v(0.8em)

#set enum(spacing: 1.4em, numbering: n => text(weight: "bold", fill: ochre)[#n.])

+ *Ordem:* (1) título — o que é medido; (2) fonte e data — quem produziu e quando; (3) eixos e unidade — absoluto ou taxa; (4) recorte temporal — início e fim da série; (5) tendência — descrição do movimento; (6) limite — o que o dado não autoriza afirmar. O erro típico é começar no passo 5: o aluno descreve corretamente o movimento de algo que não sabe o que é, e por isso acerta a leitura e erra a interpretação.

+ O truncamento consiste em iniciar o eixo vertical em valor diferente de zero. Como a percepção visual compara *comprimento e área* das barras, e não os rótulos numéricos, uma variação pequena passa a ocupar quase toda a altura do gráfico e é lida como salto. Não é falsificação porque cada valor plotado permanece correto e verificável — a manipulação incide sobre a *proporção percebida*, não sobre o dado. É, portanto, um recurso retórico, equivalente funcional do adjetivo avaliativo em texto verbal.

+ *Correlação* é a ocorrência conjunta ou variação simultânea de duas variáveis; *causalidade* é a produção de uma variável pela outra. A correlação é condição necessária, mas não suficiente, para causa. A confusão é possibilitada por uma *terceira variável interveniente* (ou variável de confusão), que atua sobre as duas séries simultaneamente — como o calor explicando, ao mesmo tempo, o aumento do consumo de sorvete e o de afogamentos.

+ Porque o número absoluto não informa sobre a *base* da qual foi extraído: mil casos numa população de vinte milhões e mil casos numa de oitocentas mil descrevem realidades incomparáveis. A comparação só é válida após *relativização* — conversão em taxa (por 100 mil habitantes), valor per capita ou percentual sobre o total da própria unidade.

+ *Escala grande* (ex.: 1:1.000) representa área pequena com alto nível de detalhe; *escala pequena* (ex.: 1:10.000.000) representa área extensa com baixo detalhe — a nomenclatura refere-se ao valor da fração, não à extensão retratada. O *mapa coroplético* atribui uma única cor a toda a unidade territorial, e portanto oculta por construção a *variação interna* dessa unidade: uma média estadual apaga a diferença entre municípios extremos dentro dela.

#v(1.4em)

#block(
  width: 100%, fill: light, inset: 13pt, radius: 3pt,
  stroke: (left: 4pt + ochre, rest: 0.5pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: ochre, tracking: 1pt)[FINALIZAÇÃO DA AULA]
  #v(0.5em)
  *Você lê uma tabela, um gráfico e um mapa como se lê um parágrafo quando trata cada elemento visual como uma escolha de autor — título como tese, unidade e eixo como ênfase, recorte como seleção, projeção e cor como ponto de vista — e só então descreve a tendência, terminando sempre pela pergunta que decide a questão: o que este dado, por construção, não me autoriza a afirmar?*
  #v(0.6em)
  Guarde o passo 6, porque ele é a ponte: o dado nunca entrega o *por quê* — entrega o *quê*. Quem preenche o "por quê" é sempre alguém, com interesse, usando o dado como escudo de autoridade. É exatamente esse movimento que o próximo Laboratório vai desmontar, transformando você de leitor de infográficos em *produtor* deles: escolher qual gráfico usar na sua própria argumentação é escolher do que você quer convencer — e a fronteira entre síntese honesta e manipulação é uma linha que você vai aprender a desenhar de propósito, do mesmo lado em que o Eixo 4 pôs a fake news e o gráfico truncado.
]

// PENDÊNCIAS VISUAIS:
// Fig. 3 — comparação Mercator × projeção equivalente (Peters/Gall ou Equal Earth),
//   com grade de meridianos e rótulos de área de Groenlândia e África.
//   Buscar em: Atlas Geográfico Escolar do IBGE (domínio público),
//   Wikimedia Commons (arquivos "Mercator projection SW" e "Equal Earth projection SW").
// Fig. 1 e Fig. 2 são nativas em CeTZ — não substituir por imagem.
// Expansão opcional: Fig. 4 — recorte de infográfico real de portal de notícias
//   com eixo Y truncado (crédito e data visíveis, para auditoria em aula).
