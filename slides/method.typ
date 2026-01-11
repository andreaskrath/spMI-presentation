#import "/globals.typ": *

= Methodology

== Overview

#slide[
  #block(height: 100%)[
    #align(center)[
      #image("/images/framework.png", width: 100%)
    ]
  ]
]

== Time Series Feature Extraction

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Architecture*
      - Channel independent mechanism
        - Split variables
      - Patching
        - Combine data
      - Stacked TSOperators
        - Self-attention
        - Fully connected
        - Normalization
      - Concatenate to combine variables
    ]
  ]
][
  #meanwhile
  #image("/images/algorithm_1.png", width: 100%)
  #image("/images/equation_4.png", width: 100%)
]

== Decomposition-Driven Frequency Matching

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Architecture*
      - Works on intermediate TSFE output
      - Splits representation
        - Trends (long-term)
        - Seasonality (the rest)
      - Consine similarity to match
      - Produces a "data-related" loss term
        - Relevant for back propagation
    ]
  ]
][
  #meanwhile
  #image("/images/equation_6.png", width: 100%)
  #image("/images/equation_8.png", width: 100%)
]

== Curriculum Training Trajectory Matching

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Architecture*
      - Expert buffer and current model
        - Current model is based on expert
      - Train current model $a$ epochs
      - Compare cosine for parameter movement
      - Rank based on similarity
        - Easy #sym.arrow Hard
      - Compute trajectory matching loss
    ]
  ]
][
  #meanwhile
  #image("/images/algorithm_2.png", width: 90%)
]

== Loss

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Loss*
      - Task specific loss
        - How good is the data?
      - Frequency related loss
        - How similar is the data?
      - Trajectory matching loss
        - How does data affect training?
    ]
  ]
][
  #meanwhile
  $L_text("all") = cal(L) + L_text("Fre") + L_text("tmm")$ (16)
]
