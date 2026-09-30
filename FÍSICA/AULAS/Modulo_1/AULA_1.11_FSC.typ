// ============================================================
//  FÍSICA · A LÓGICA DO COSMOS · EIXO 1 — A Geometria do Movimento
//  Aula 1.11 · Capítulo do aluno
// ============================================================

#import "@preview/cetz:0.3.4": canvas, draw
#counter("fig").update(1)

#set page(
  paper: "a4",
  margin: (x: 2.2cm, y: 2cm),
  numbering: "1 / 1",
  header: context {
    if counter(page).get().first() > 1 {
      set text(size: 8.5pt, fill: rgb("#718096"))
      grid(columns: (1fr, auto),
        [REVOLUÇÃO VESTIBULARES · Física: A Lógica do Cosmos],
        align(right)[Eixo 1 · Aula 1.11],
      )
      line(length: 100%, stroke: 0.3pt + rgb("#cbd5e0"))
    }
  },
)

#set text(font: ("Libertinus Serif", "New Computer Modern"), size: 10.5pt, lang: "pt")
#set par(justify: true, leading: 0.68em, first-line-indent: 0pt)

// ---------- PALETA ----------
#let deep  = rgb("#1a365d")
#let mid   = rgb("#2b6cb0")
#let ochre = rgb("#975a16")
#let light = rgb("#f7fafc")
#let rule  = rgb("#cbd5e0")
#let red   = rgb("#822727")
#let green = rgb("#22543d")

// ---------- ESTILOS DE TÍTULO ----------
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
#let cit(body) = block(
  width: 100%, inset: (left: 12pt, y: 5pt), stroke: (left: 2.5pt + ochre),
  text(size: 10pt, style: "italic", fill: rgb("#744210"), body),
)

#let caixa(titulo, body) = block(
  width: 100%, fill: light, inset: 12pt, radius: 2pt,
  stroke: (left: 3pt + mid, rest: 0.4pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: mid, tracking: 0.8pt)[#upper(titulo)]
  #v(0.4em)
  #body
]

#let chave(body) = align(center, block(
  width: 92%, inset: 10pt, stroke: (y: 0.8pt + deep),
  text(size: 11pt, weight: "bold", fill: deep, body),
))

// ---------- PROTOCOLO VISUAL ----------
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
          #if fonte != none [ #text(style: "italic", size: 8pt)[(#fonte)]]
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
)[#align(center + horizon)[
  #text(size: 8pt, weight: "bold", fill: mid, tracking: 1pt)[IMAGEM PENDENTE]
  #v(0.3em)
  #text(size: 8.5pt, fill: rgb("#718096"), style: "italic")[#nota]
]]

#let img(caminho, largura: 100%) = image(caminho, width: largura)

// ============================================================
//  CAPA
// ============================================================

#let capa(
  curso: "Revolução Vestibulares",
  disciplina: "Física · A Lógica do Cosmos",
  modulo: "Eixo 1 · A Geometria do Movimento — Aula 1.11",
  titulo: [Como a Física descreve o movimento de qualquer coisa com apenas duas ideias?],
  epigrafe: [Você acha que estudou dez assuntos neste eixo. Estudou dois. E o mais poderoso deles não é uma equação — é o direito de escolher de onde você olha.],
) = {
  block(
    width: 100%,
    inset: (x: 20pt, y: 22pt),
    radius: 3pt,
    fill: light,
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
      #text(size: 23pt, weight: "bold", fill: deep)[#titulo]
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

= Aula 1.11 — Síntese: encontros, gráficos e a escolha do referencial como arma

== A âncora

Duas motos numa estrada reta. A primeira passa pelo marco zero a 20 m/s. Dez segundos depois, a segunda passa pelo mesmo marco a 30 m/s. Pergunta: onde a segunda alcança a primeira?

Você já viu esse problema. E você sabe o que a maioria faz: escreve duas funções horárias, cuida dos instantes iniciais defasados, iguala as posições, resolve, erra um sinal, refaz, gasta seis minutos.

Agora observe outra pessoa resolver. Ela não escreve nenhuma função horária. Ela escreve *três números*:

#cit[
  "Quando a segunda parte, a primeira já está 200 m à frente. Ela se aproxima 10 m por segundo. Logo, 20 segundos."
]

Vinte segundos. Nenhuma equação. Nenhum sinal para errar.

Isso não é truque, nem malandragem de cursinho. É *Física mais correta* que a da primeira solução — porque a segunda pessoa fez algo que você tem o direito de fazer desde a aula 1.1, e provavelmente nunca usou de propósito: ela *mudou de referencial*. Ela subiu na moto da frente.

Esta aula é sobre transformar as dez aulas anteriores em duas ideias e uma decisão.

== A desconstrução

O senso comum do aluno de véspera de prova é este:

#cit[
  "Cinemática tem umas oito fórmulas. Eu preciso decorar todas e saber em qual encaixar cada questão."
]

Vamos contar honestamente o que existe. Faça o inventário de tudo o que você usou no Eixo 1:

$
x = x_0 + v t quad quad x = x_0 + v_0 t + (a t^2)/2 quad quad v = v_0 + a t quad quad v^2 = v_0^2 + 2 a Delta x
$

$
y = y_0 - (g t^2)/2 quad quad v = omega R quad quad a_c = v^2/R
$

Sete expressões. Mas olhe de perto. A primeira é a segunda *com $a = 0$*. A quarta é a segunda e a terceira *com o tempo eliminado* (você deduziu isso em 1.5 — e refaz em quarenta segundos). A quinta é a segunda *com $a = -g$ e $v_0 = 0$* (1.6). O lançamento oblíquo inteiro (1.8) é a primeira na horizontal *somada* à quinta na vertical. E o movimento circular (1.9) é a mesma descrição em coordenada angular, com $phi$ no lugar de $x$ e $omega$ no lugar de $v$.

#chave[
  Não existem sete fórmulas. Existem *duas*: velocidade constante e aceleração constante. Todo o resto é caso particular, soma de dois casos, ou troca de nome de variável.
]

E existe uma segunda desconstrução, mais valiosa: você acredita que o enunciado da questão manda no referencial. Não manda. O enunciado descreve o mundo; *você* escolhe de onde olhar. Se você olha de um lugar burro, o problema é difícil. Se você olha de um lugar inteligente, o problema muitas vezes deixa de existir.

== A engenharia do conceito

=== 1. As duas únicas ideias, escritas de uma vez

*Ideia 1 — velocidade constante.* Nada muda de ritmo. O gráfico $x times t$ é uma *reta*, e a velocidade é a *inclinação* dela (0.7 e 1.3). Em qualquer eixo, em qualquer direção: posição cresce em proporção direta ao tempo.

*Ideia 2 — aceleração constante.* A velocidade muda a ritmo fixo. O gráfico $v times t$ é uma reta, a aceleração é a *inclinação* dela, e o deslocamento é a *área embaixo* dela (1.5). É dessa área — um trapézio — que sai o famoso $a t^2\/2$ que você quase decorou.

Guarde a versão de bolso destas duas ideias, porque é ela que resolve provas:

#align(center)[
  #table(
    columns: (auto, 1fr, 1fr),
    inset: 9pt,
    align: left,
    stroke: 0.4pt + rule,
    fill: (_, y) => if y == 0 { rgb("#eaf0f7") },
    [*Você quer saber*], [*Leia no gráfico $x times t$*], [*Leia no gráfico $v times t$*],
    [Velocidade], [inclinação da curva], [valor no eixo vertical],
    [Aceleração], [curvatura (reta = zero)], [inclinação da reta],
    [Deslocamento], [diferença entre duas alturas], [área sob a curva],
    [Repouso], [reta horizontal], [curva cruzando o zero],
    [Inversão de sentido], [vértice / pico], [troca de sinal de $v$],
    [Encontro de dois corpos], [*cruzamento das curvas*], [(não se lê aqui)],
  )
]

#v(0.4em)

A última linha é ouro de vestibular. *Encontro é cruzamento de curvas no gráfico $x times t$* — e nada mais. Se as duas curvas se cruzam, os dois corpos estão na mesma posição no mesmo instante. Se elas apenas se tocam pelo mesmo valor de $v$, isso é outra coisa (mesma velocidade, distância máxima ou mínima). Confundir esses dois eventos é o erro campeão do tópico.

#fig(
  canvas(length: 1cm, {
    import draw: *

    // eixos
    line((0, 0), (9.2, 0), stroke: (paint: deep, thickness: 1pt),
      mark: (end: "stealth", fill: deep, scale: 0.3))
    line((0, 0), (0, 5.6), stroke: (paint: deep, thickness: 1pt),
      mark: (end: "stealth", fill: deep, scale: 0.3))
    content((9.2, -0.5), text(size: 8.5pt, fill: deep)[$t$ (s)])
    content((-0.55, 5.6), text(size: 8.5pt, fill: deep)[$x$ (m)])

    // grade leve
    for i in range(1, 5) {
      line((0, i * 1.1), (9.0, i * 1.1), stroke: (paint: rgb("#e6ecf3"), thickness: 0.4pt))
    }

    // moto 1: parte de x=0 em t=0, v=20 -> reta suave
    line((0, 0), (6.6, 3.88), stroke: (paint: mid, thickness: 1pt))
    content((1.1, 0.9), angle: 30deg, text(size: 7pt, weight: "bold", fill: mid)[moto 1 · $v = 20m\/s$])

    // moto 2: parte de x=0 em t=10 -> reta mais inclinada
    line((2.2, 1.64), (6.6, 3.88), stroke: (paint: red, thickness: 1pt))
    content((3.15, 2.35), angle: 27deg, text(size: 7pt, weight: "bold", fill: red)[moto 2 · $v = 30m\/s$])

    // ponto de encontro (aprox. interseccao visual)
    let ex = 6.55
    let ey = 0.55 + (4.9 - 0.55) * ex / 8.6
    circle((ex, ey), radius: 0.12, fill: green, stroke: (paint: white, thickness: 0.8pt))
    line((ex, 0), (ex , ey), stroke: (paint: green, thickness: 0.7pt, dash: "dashed"))
    line((0, ey), (ex, ey), stroke: (paint: green, thickness: 0.7pt, dash: "dashed"))
    content((ex + 1.1, ey ), text(size: 8pt, weight: "bold", fill: green)[ENCONTRO])
    content((ex, -0.5), text(size: 7.5pt, fill: green)[$t = 30$s])
    content((-0.5, ey +0.03), text(size: 7.5pt, fill: green)[$600m$])
    content((-0.5, ey -2.2), text(size: 7.5pt, fill: green)[$200m$])

    // atraso inicial
     content((2.15, -0.25),  
      text(size: 7.5pt, weight: "bold", fill: ochre)[atraso de 10s])
    

    // linha de 200m
    line((0, ey -2.23), (ex, ey -2.23), stroke: (paint: green, thickness: 0.7pt, dash: "dashed"))
    line((2.2, 0.05), (2.2, 1.66), stroke: (paint: ochre, thickness: 0.7pt, dash: "dashed"),
      mark: (start: "bar", end: "bar", fill: ochre, scale: 0.25))

  }),
  legenda: [O encontro *não* é onde as retas ficam paralelas nem onde as velocidades se igualam — é onde as curvas se *cruzam*, porque só ali as duas motos ocupam a mesma posição no mesmo instante. Note que a reta vermelha é mais inclinada (maior $v$) e começa depois: é a inclinação maior que "come" os 200 m de vantagem. Se a inclinação da moto 2 fosse igual ou menor, as retas nunca se cruzariam — e o encontro seria fisicamente impossível, não apenas "difícil de calcular".],
  largura: 100%,
)

=== 2. A decisão: qual referencial escolher

Aqui está a técnica que separa o aluno de 700 do aluno de 900, e que quase nenhum material ensina explicitamente.

Movimento é *relação*, não propriedade (1.1). Isso significa que você pode fixar sua origem em qualquer coisa — inclusive em um objeto que está se movendo — desde que seja *consistente*. E há uma escolha que quase sempre simplifica: *cole o referencial no corpo cujo movimento você não quer descrever.*

Volte às motos. Escolha o referencial da *moto 1*. Nesse ponto de vista:

· a moto 1 está *parada* (por construção — você está sentado nela);
· a moto 2 se aproxima com velocidade *relativa* $v_"rel" = 30 - 20 = 10$ m/s;
· quando a moto 2 parte, a moto 1 já está $200$ m à frente.

O problema virou trivial — um único corpo se aproximando de um alvo parado:

$
t = (Delta x)/(v_"rel") = 200/10 = 20 " s"
$

Vinte segundos depois da partida da moto 2, ou seja, $t = 30$ s no relógio do chão. E a posição do encontro? Volte ao referencial do chão, que é onde a pergunta foi feita: a moto 1 andou $20 dot 30 = 600$ m. Confere com a Fig. 1.

#caixa("A regra da velocidade relativa — e o único sinal que importa")[
  Em movimento sobre a mesma reta:

  #v(0.4em)
  · *Mesmo sentido* $arrow.r$ $v_"rel" = |v_A - v_B|$ (subtrai). É por isso que ultrapassar um caminhão na estrada demora uma eternidade: a diferença é pequena.

  · *Sentidos opostos* $arrow.r$ $v_"rel" = |v_A| + |v_B|$ (soma). É por isso que a colisão frontal é a mais destrutiva, e por que um cruzamento de trens em sentidos opostos dura um segundo.

  #v(0.4em)
  *Aviso:* velocidade relativa só simplifica quando os corpos têm *velocidade constante*, ou quando têm a *mesma aceleração* (nesse caso a aceleração relativa é zero — e é exatamente por isso que dois objetos soltos juntos em queda livre parecem flutuar um em relação ao outro; guarde esta frase para 5.4).
]

=== 3. O protocolo de quatro passos

Diante de qualquer questão de movimento, do MRU ao lançamento oblíquo, faça isto — nesta ordem:

*Passo 1 — Escolha e declare o referencial.* Origem onde? Sentido positivo para onde? Escreva isso na folha. Metade dos erros de sinal do vestibular morre aqui.

*Passo 2 — Classifique cada corpo: $a = 0$ ou $a$ constante?* São as duas únicas ideias. Se um corpo tem trechos diferentes (acelera, mantém, freia), *quebre em trechos* e trate cada um separadamente. O gráfico $v times t$ é o melhor lugar para fazer isso, porque o deslocamento total é só a soma de áreas.

*Passo 3 — Decompoonha, se houver duas dimensões.* Lançamento é 1.7 aplicada: horizontal e vertical *não conversam*. Duas colunas independentes, ligadas por uma única grandeza compartilhada — o *tempo*. O tempo é a ponte, sempre.

*Passo 4 — Só agora escolha a ferramenta pelo que falta.* Se o enunciado não menciona tempo e não pergunta tempo, use Torricelli. Se pergunta "onde e quando se encontram", iguale posições — ou melhor, use velocidade relativa. Se dá um gráfico, a resposta está na área ou na inclinação; não invente conta.

#fig(
  canvas(length: 1cm, {
    import draw: *

    let cw = 3.9
    let bh = 1.15

    // caixa auxiliar
    let box(x, y, w, h, cor, titulo, sub) = {
      rect((x, y), (x + w, y + h), radius: 0.08,
        fill: rgb("#f4f8fc"), stroke: (paint: cor, thickness: 1.1pt))
      content((x + w / 2, y + h * 0.63), text(size: 8.5pt, weight: "bold", fill: cor)[#titulo])
      content((x + w / 2, y + h * 0.25), text(size: 7.5pt, fill: rgb("#4a5568"))[#sub])
    }

    box(0, 6.0, cw, bh, deep, [1 · REFERENCIAL], [origem e sentido positivo])
    box(0, 4.1, cw, bh, mid, [2 · CLASSIFICAR], [$a = 0$ ou $a$ constante?])
    box(0, 2.2, cw, bh, mid, [3 · DECOMPOR], [horizontal × vertical])
    box(0, 0.3, cw, bh, ochre, [4 · FERRAMENTA], [pelo que falta no enunciado])

    // setas verticais
    for y in (6.0, 4.1, 2.2) {
      line((cw / 2, y), (cw / 2, y - 0.75),
        stroke: (paint: rgb("#8a9bb0"), thickness: 1pt),
        mark: (end: "stealth", fill: rgb("#8a9bb0"), scale: 0.28))
    }

    // ramo lateral: as duas ideias
    line((cw, 4.1 + bh / 2), (cw + 1.0, 4.1 + bh / 2),
      stroke: (paint: green, thickness: 1pt),
      mark: (end: "stealth", fill: green, scale: 0.28))
    rect((cw + 1.0, 3.55), (cw + 5.6, 5.85), radius: 0.08,
      fill: rgb("#f0f7f2"), stroke: (paint: green, thickness: 1pt))
    content((cw + 3.3, 5.45), text(size: 8pt, weight: "bold", fill: green)[AS DUAS ÚNICAS IDEIAS])
    content((cw + 3.3, 4.85), text(size: 8pt, fill: rgb("#22543d"))[$a = 0$: reta em $x times t$])
    content((cw + 3.3, 4.32), text(size: 8pt, fill: rgb("#22543d"))[$a$ const.: reta em $v times t$])
    content((cw + 3.3, 3.85), text(size: 7pt, style: "italic", fill: rgb("#4a5568"))[área = deslocamento])

    // ramo lateral: a ponte do tempo
    line((cw, 2.2 + bh / 2), (cw + 1.0, 2.2 + bh / 2),
      stroke: (paint: red, thickness: 1pt),
      mark: (end: "stealth", fill: red, scale: 0.28))
    rect((cw + 1.0, 2.05), (cw + 5.6, 3.1), radius: 0.08,
      fill: rgb("#fbf3f3"), stroke: (paint: red, thickness: 1pt))
    content((cw + 3.3, 2.72), text(size: 8pt, weight: "bold", fill: red)[O TEMPO É A PONTE])
    content((cw + 3.3, 2.28), text(size: 7.5pt, fill: rgb("#4a5568"))[única grandeza comum aos dois eixos])

    // ramo lateral: atalho
    line((cw, 0.3 + bh / 2), (cw + 1.0, 0.3 + bh / 2),
      stroke: (paint: ochre, thickness: 1pt),
      mark: (end: "stealth", fill: ochre, scale: 0.28))
    rect((cw + 1.0, 0.15), (cw + 5.6, 1.2), radius: 0.08,
      fill: rgb("#fdf8ef"), stroke: (paint: ochre, thickness: 1pt))
    content((cw + 3.3, 0.87), text(size: 8pt, weight: "bold", fill: ochre)[ATALHO DO ENCONTRO])
    content((cw + 3.3, 0.43), text(size: 7.5pt, fill: rgb("#4a5568"))[$t = Delta x \/ v_"rel"$])
  }),
  legenda: [O protocolo é sequencial por um motivo: cada passo elimina uma classe de erro. O passo 1 mata erros de sinal; o passo 2 mata a aplicação de $a t^2\/2$ em trecho de velocidade constante; o passo 3 mata a tentativa de usar a velocidade total num único eixo; o passo 4 mata a caça à fórmula. Repare que a ferramenta é o *último* item — nunca o primeiro.],
  largura: 100%,
)

=== 4. O que este eixo realmente te deu

Você não aprendeu a descrever carros, motos e pedras. Você aprendeu a descrever *qualquer coisa* — e o eixo seguinte vai provar isso sem mudar uma vírgula da matemática.

Porque a próxima pergunta não é mais "*qual* é o movimento?". É "*quem* causou?". E o instante em que você perguntar isso, a aceleração deixa de ser um número lido num gráfico e passa a ser o *sintoma* de algo: uma força. A cinemática descreve o crime; a dinâmica encontra o culpado.

Só que existe um preço a pagar antes disso, e ele está escondido na frase mais importante desta aula: "você pode escolher qualquer referencial". Isso é verdade na cinemática. Na dinâmica, *não é* — e essa é a razão pela qual a "força centrífuga" da aula 1.9 parece existir para quem está dentro do carro. Alguns referenciais mentem sobre as causas, mesmo descrevendo corretamente o movimento. Guarde essa inquietação.

== A regra do jogo

#block(
  width: 100%, fill: rgb("#f0f5fa"), inset: 14pt, radius: 3pt,
  stroke: (left: 4pt + deep, rest: 0.5pt + rule),
)[
  #text(size: 11.5pt, weight: "bold", fill: deep)[O que você leva desta aula para a prova]
  #v(0.5em)
  #set enum(spacing: 0.9em)
  + *Toda a cinemática são duas ideias:* velocidade constante ($a = 0$) e aceleração constante. Todo o resto é caso particular, soma de casos ou troca de variável.
  + *Duas leituras gráficas resolvem tudo:* inclinação dá taxa de variação; área dá acumulação. Inclinação de $x times t$ é $v$; inclinação de $v times t$ é $a$; área de $v times t$ é $Delta x$.
  + *Encontro = cruzamento das curvas em $x times t$.* Mesma velocidade $eq.not$ encontro: é o instante de distância máxima ou mínima.
  + *Declare o referencial antes de qualquer conta:* origem e sentido positivo por escrito. É o antídoto contra erro de sinal.
  + *Referencial é escolha sua, não do enunciado.* Cole-o no corpo cujo movimento você quer anular.
  + *Velocidade relativa:* mesmo sentido subtrai, sentidos opostos soma. Válida para velocidades constantes ou acelerações iguais.
  + *Em duas dimensões, os eixos são independentes e o tempo é a única ponte* entre eles.
  + *Escolha a equação pelo que o problema NÃO menciona.* Sem tempo no enunciado e sem tempo na pergunta $arrow.r$ Torricelli.
  + *Movimento com trechos distintos se resolve por trechos*, somando áreas — nunca com uma equação única.
]

#pagebreak()

= OQPS — A LINHA DE CHEGADA

#text(size: 9.5pt, fill: gray, style: "italic")[
  Este é o checkpoint de fechamento do Eixo 1. Responda sem consultar. Se travar, o problema não é esta aula — é a aula que ela resume.
]

#v(0.8em)

#set enum(spacing: 1.4em, numbering: n => text(weight: "bold", fill: deep)[#n.])

+ Enuncie as *duas* ideias fundamentais que descrevem todo movimento na cinemática e indique a forma do gráfico $x times t$ e do gráfico $v times t$ em cada uma.

+ Diferencie, no gráfico $x times t$ de dois móveis, o significado físico de *curvas que se cruzam* e de *curvas com a mesma inclinação no mesmo instante*.

+ Defina velocidade relativa em movimento retilíneo e indique a operação correta para móveis de mesmo sentido e de sentidos opostos.

+ Justifique por que, num lançamento oblíquo, os movimentos horizontal e vertical podem ser resolvidos separadamente, e identifique a única grandeza que os conecta.

+ Cite o critério objetivo para decidir usar a equação de Torricelli em vez das funções horárias.

#pagebreak()

= GABARITO OQPS

#v(0.8em)

#set enum(spacing: 1.3em, numbering: n => text(weight: "bold", fill: ochre)[#n.])

+ *(i) Velocidade constante ($a = 0$):* $x times t$ é uma *reta* (inclinação $= v$); $v times t$ é uma *reta horizontal*. *(ii) Aceleração constante:* $x times t$ é uma *parábola*; $v times t$ é uma *reta inclinada* (inclinação $= a$, área $= Delta x$).

+ *Cruzamento das curvas:* os móveis ocupam a *mesma posição no mesmo instante* — é o encontro (ultrapassagem, colisão). *Mesma inclinação:* os móveis têm a *mesma velocidade instantânea*, o que significa que a distância entre eles é *máxima ou mínima* naquele instante — não há encontro necessariamente.

+ Velocidade relativa é a velocidade de um móvel medida no referencial do outro. *Mesmo sentido:* $v_"rel" = |v_A - v_B|$ (subtração). *Sentidos opostos:* $v_"rel" = |v_A| + |v_B|$ (soma). Vale diretamente para velocidades constantes ou quando as acelerações são iguais.

+ Pelo *princípio da independência dos movimentos* (Galileu): a aceleração da gravidade é vertical e não possui componente horizontal, logo não altera o movimento horizontal, que permanece uniforme. A única grandeza compartilhada pelos dois eixos é o *tempo* de voo.

+ Use Torricelli ($v^2 = v_0^2 + 2 a Delta x$) quando o *tempo não é dado nem pedido* — ela é exatamente a função horária com o tempo eliminado, e evita uma variável intermediária inútil.

// ============================================================
//  FINALIZAÇÃO
// ============================================================

#v(1.2em)
#line(length: 100%, stroke: 0.5pt + rule)
#v(0.8em)

#block(
  width: 100%, fill: light, inset: 13pt, radius: 3pt,
  stroke: (left: 4pt + ochre, rest: 0.5pt + rule),
)[
  #text(size: 8.5pt, weight: "bold", fill: ochre, tracking: 1pt)[A RESPOSTA, EM UMA FRASE]
  #v(0.4em)
  #text(size: 11.5pt, weight: "bold", fill: deep)[
    A Física descreve o movimento de qualquer coisa com apenas duas ideias — velocidade constante
    e aceleração constante, lidas como inclinação e área de um gráfico — porque tudo o mais
    (queda, lançamento, giro, encontro) é uma dessas duas repetida em outro eixo, em outra
    variável ou vista de outro referencial, e é você quem escolhe o referencial que torna o
    problema fácil.
  ]
]

#v(0.9em)

O Eixo 1 termina aqui, e ele termina *incompleto de propósito*. Você agora consegue descrever com precisão cirúrgica o que acontece: onde o corpo está, quão rápido vai, quando encontra o outro. E não sabe explicar *nada*.

Por que a moto acelera? Por que a pedra cai? Por que o carro derrapa na curva de 1.9? Você tem o retrato perfeito de um crime e nenhum suspeito.

A próxima aula abre o Eixo 2 pela pergunta mais mal respondida da história do pensamento humano — a que Aristóteles errou e todo mundo continua errando por instinto: *por que você é jogado para frente quando o ônibus freia, se nada te empurrou?* Prepare-se para descobrir que sua intuição mais profunda sobre movimento — a de que é preciso força para continuar andando — está errada há dois mil e quatrocentos anos. E que a Física só começou de verdade quando alguém teve coragem de duvidar dela.

#align(center)[
  #v(0.6em)
  #text(size: 9pt, fill: gray, style: "italic")[Eixo 2 · Aula 2.1 · Inércia: corpos não mudam de estado de movimento sozinhos]
]

// PENDÊNCIAS VISUAIS:
// Nenhuma. Fig. 1 (gráfico x×t do encontro das duas motos) e Fig. 2 (fluxograma do
// protocolo de 4 passos) são diagramas nativos em CeTZ, conforme o protocolo.
// Enriquecimento OPCIONAL: nenhum necessário — esta é aula de síntese e
// fotografias tenderiam a diluir o argumento gráfico.
