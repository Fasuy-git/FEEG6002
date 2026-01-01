//Import all libraries from template file
#import "template.typ": *

// LaTex-ify the Typst
#set page(margin: 1in)
#set text(font: "New Computer Modern")

// Need to show word count for total word func
#show: word-count

// Large centered title
#v(9cm)

#align()[
  #text(28pt)[#strong[FEEG 6002]] \

  #text(15pt)[Advanced Computational Methods I]
]

#v(1fr)

#line(length: 100%)


#align(left)[
  Author: Yusaf Sultan \
  Lecturers: Ranga Dinesh Kahanda Koralage, Richard Boardman, Ondrej Hovorka \
  Word Count: #total-words  \
  #v(2cm)
]

#pagebreak()  // start new page after title page

#set page(
  header: [
    FEEG 6002: Advanced Computational Methods I
    #h(1fr)
    #v(-0.3cm)
    #line(length: 100%)
  ],
  footer: context [
    #align(center)[
      #box(height: 14pt)[#v(0.35cm) #line(length: 43%)]
      #h(0.569cm)
      #counter(page).display("1")
      #h(0.569cm)
      #box(height: 14pt)[#v(0.35cm) #line(length: 43%)]
    ]
  ],
)

// LaTex-ify the Typst
#set text(hyphenate: true)
#set par(
  spacing: 0.65em,
)

#show heading: set block(below: 1.2em)
#set par(spacing: 1.5em)
#set figure(gap: 1.5em)

// Contents Page
#align(left)[

  #outline()

  #v(1cm)

  #outline(
    title: [List of Weeks],
    target: figure.where(kind: "week"),
  )

  #v(1cm)

  #outline(
    title: [List of Figures],
    target: figure.where(kind: figure),
  )

  #v(1cm)

  #outline(
    title: [List of Tables],
    target: figure.where(kind: table),
  )



  #pagebreak()

]<contents>


#show figure: set block(breakable: true)
#show: equate.with(breakable: true, sub-numbering: true)
#set math.equation(numbering: "(1.1)", supplement: [Eq.])
#set heading(numbering: "1.")
#set math.mat(delim: "[")
#set math.vec(delim: "[")

#include "lecture_1/lecture_1.typ"
#include "lecture_2/lecture_2.typ"
#include "lecture_4/lecture_4.typ"
#include "lecture_5/lecture_5.typ"
#include "lecture_6/lecture_6.typ"
#include "lecture_7/lecture_7.typ"
#include "lecture_8/lecture_8.typ"
