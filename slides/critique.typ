#import "/globals.typ": *

= Critique

== Terminology

#slide[
  #block(height: 100%)[
    #align(top)[
      *TimeDC*
      - Condensation framework
      - TSFE prediction architecture
      - Interchangable
        - Understand from context
    ]
  ]
]

#slide(composer: (1fr, 1fr))[
  #image("/images/table_1.png", width: 100%)
][
  #image("/images/table_2.png", width: 100%)
]

== Method

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *TSOperator Structure*
      - Figure 3 
        - Self-attention
        - Fully connected
        - Concatenation
      - Equation 4 + Algorithm 1
        - Self-attention
        - Fully connected
        - Normalization
    ]
  ]
][
  #block(height: 100%)[
    #align(center)[
      #rotate(-90deg, image("/images/tsfe.png", width: 80%), reflow: true)
      #image("/images/equation_4.png", width: 100%)
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *DDFM*
      - No details on comparison
        - Full condensed dataset?
        - Single time series from original?
        - Average similarity?
    ]
  ]
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *CT²M*
      - Unclear how loss works
        - Accumulated?
        - Sequential backpropagation?
      - Why order similarity?
    ]
  ]
][
  #image("/images/algorithm_2.png", width: 80%)
]

== Experiments and Results

#slide[
  #block(height: 100%)[
    #align(top)[
      *Dataset Condensation Performance (Table 1)*
      - All datasets
      - 96, 192, 336 PL

      *Generalization Performance (Table 2)*
      - All datasets
      - 96, 192 PL
        - No explination for 336 missing

      *Dynamic Memory Cost (Table 3)*
      - Only 4 datasets
      - Only ETTh1 as sub-dataset
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *Condensed Dataset Size (Figure 5)*
      - Only 4 datasets
      - Only ETTh1 as sub-dataset
      - Only 96 PL
        - No explination
      - Same for ablation study (Figure 6)

      *Training Time for Dataset Condensation*
      - Only 4 datasets (same as others)
      - 96, 192, 336 PL again
    ]
  ]
]
