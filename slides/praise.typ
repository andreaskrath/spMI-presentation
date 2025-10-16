#import "/globals.typ": *

= Praise

== Figures

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Colors*
      - Help understanding and data flow
        - Preprocessing #sym.arrow final encoding
        - Minor inconsistencies
          - Attention
      
      *Dimensionality*
      - Squares #sym.arrow 2-dimensional
      - Cubes #sym.arrow 3-dimensional
      - Transposed #sym.arrow lying down
      - Slices of shapes
        - $M$ slices of global memory
        - $P$ slices of local memory
    ]
  ]
][
  #meanwhile
  #align(center)[
    #image("/images/encoding.png", width: 100%)
    #image("/images/ame.png", width: 50%)
  ]
]
