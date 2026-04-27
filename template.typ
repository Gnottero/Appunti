// template.typ

// -- DEFINIZIONE DEI BLOCCHI PERSONALIZZATI (Top Level) --

// Box per le Definizioni (Blu)
#let definition(title, body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + rgb("#0074d9")),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("#dce1eb"))[Definizione: #title]
      #v(0.2em)
      #body
    ]
  )
}

// Box per le Proprietà (Oro)
#let prop(title, body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + rgb("#e2df11")),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill:  rgb("#dce1eb"))[Proprietà: #title]
      #v(0.2em)
      #body
    ]
  )
}

// Box per le Osservazioni (Verde)
#let obs(title, body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + rgb("#36b305")),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill:  rgb("#dce1eb"))[Osservazione: #title]
      #v(0.2em)
      #body
    ]
  )
}

// Box per i Teoremi
#let theorem(title, body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + rgb("#ff4136")),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill:  rgb("#dce1eb"))[Teorema: #title]
      #v(0.2em)
      #body
    ]
  )
}

#let note(body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + rgb("#7d36f0")),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("#dce1eb"))[Nota:]
      #body
    ]
  )
}

// Box per Esempi/Codice (Verde/Grigio)
#let example(body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + luma(100)),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill: rgb("#dce1eb"))[Esempio / Codice:]
      #v(0.2em)
      #body
    ]
  )
}

#let advexample(title, body) = {
  block(
    fill: rgb("#1d2030"),
    stroke: (left: 4pt + luma(100)),
    inset: 12pt,
    radius: 4pt,
    width: 100%,
    breakable: true,
    [
      #text(weight: "bold", fill:  rgb("#dce1eb"))[Esempio / Codice: #title]
      #v(0.2em)
      #body
    ]
  )
}

#let evaluated(expr, size: 100%) = $lr(#expr|, size: #size)$

#let project(
  title: "",
  author: "Valerio Collura",
  course: "",
  date: datetime.today().display("[day]/[month]/[year]"),
  body
) = {
  // Impostazioni della pagina
  set page(
    paper: "a4",
    margin: (x: 2.5cm, y: 2.5cm),
    fill: rgb("#2b2f3f"),
    numbering: "1",
    header: align(right)[
      #text(size: 8pt, style: "italic")[
        #course | #date
      ]
    ],
  )

  // Impostazioni del Font
  // Fallback su Arial/Courier se Fira non è installato
  set text(font: "Roboto", size: 11pt, lang: "it", fill: rgb("#f5f5f5"))
  
  show raw.where(block: true): it => block(
    fill: rgb("#262a37"),
    inset: 10pt,
    radius: 5pt,
    text(font: "Fira Code", size: 8.5pt, it)
  )


  // Impostazioni Paragrafi e Intestazioni
  set par(justify: true, leading: 0.65em)
  set heading(numbering: "1.1.")
  
  // Titolo del documento
  align(center)[
    #block(text(weight: 700, size: 2em, title))
    #v(1em, weak: true)
    #text(size: 1.2em, author)
    #v(2em, weak: true)
  ]

  // Indice (TOC)
  outline(depth: 2, indent: auto)
  pagebreak()

  // Restituisce il corpo del documento
  body
}