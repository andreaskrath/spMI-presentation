#import "/globals.typ": *

= Experiments

== Noteworthy Details

#slide[
  #block(height: 100%)[
    #align(top)[
      *Datasets*
      - 7 in total
        - 4 are variants of the same
      - 7, 21, 321, and 862 variables
      - $H = 336$
      - $F = [96, 192, 336, 720]$
      
      #pause
      *Comparisons*
      - Multiple different model architectures
        - Channel independent models
        - Linear models
        - Attention models
    ]
  ]
]

== Forecasting Accuracy

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Results*
      - Compare on MSE and MAE
      - Bold is best, underline is second best
      - Almost always best performance
        - Loses on MSE for low $F$ in one dataset
    ]
  ]
][
  #block(height: 100%)[
    #align(center + horizon)[
      #meanwhile
      #image("/images/forecasting_accuracy.png", width: 100%)
    ]
  ]
]

== Ablation Study

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Overview*
      - Are components contributing?
      - Experiment without
        - Graph learning
        - GRU
        - Local
        - Global
        - Sharing
        - Alternating

      #pause
      *Results*
      - All component are contributing
    ]
  ]
][
  #block(height: 100%)[
    #align(center)[
      #meanwhile
      #image("/images/ablation_study.png", width: 100%)
    ]
  ]
]

== Challenge 1

#slide[
  #block(height: 100%)[
    #align(top)[
      *Disrupted Correlations*
      - Robustness
      - Introduce outliers
        - Different amounts
        - Independent
        - Dependent
      #pause
      - Results
        - Performed the best
        - Mitigate both types of outliers

      #pause
      *Dynamic Correlations*
      - Introduce dynamic correlations
        - Different amounts
      #pause
      - Results
        - Performed the best
    ]
  ]
]
