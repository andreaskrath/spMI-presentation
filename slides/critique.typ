#import "/globals.typ": *

= Critique

== Notation

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Preprocessing*
      - As mentioned earlier
      - Unconventional notation
      - Obscures details
        - _What are they doing?_
      
      #pause
      *Symbol Reuse*
      - $text("F", weight: "bold")$ is the ground truth
        - $F$ is the dimensionality of $text("F", weight: "bold")$
          - i.e. the forecasting horizon
      - $text("F'", weight: "bold")$ is the encoding output
        - $F'$ is the dimensionality of $text("F'", weight: "bold")$
      - Confusing statements and diagrams
    ]
  ]
][
  #pause
  #block(height: 100%)[
    #align(center + horizon)[
      $text("F'", weight: "bold") #sym.in #sym.RR^(F' #sym.times N)$,
      where $F'$ is the temporal dimension of the representation.
    ]
    #pause
    #image("/images/input_notation.png", width: 100%)
    #image("/images/output_notation.png", width: 100%)
  ]
]
