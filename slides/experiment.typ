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
      *Results*
      - All component are contributing
      
      *Patch-Wise Recurrent Graph Learning*
      - More degradation with more variables
      - Valuable for large-scale datasets
      
      *Recurrent*
      - More degradation in greater $F$
      - Valuable for long forecasting horizon
      - Captures temporal dynamics

      *Local*
      - Accelerated degradation in greater $F$
      - Valuable for long forecasting horizon
      - Captures dynamic correlations
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

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Global*
      - Degradation as a whole
      - Valuable for prediction accuracy
      - Global information provides context
      
      *Sharing*
      - Degradation at large $F$
      - Valuable for long forecasting horizon
      - Helps avoid overfitting locally

      *Alternating*
      - Degradation as a whole
      - Valuable for parameter optimization
      - Helps training stability and tuning
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
      - Results
        - Performed the best
        - Mitigate both types of outliers

      *Dynamic Correlations*
      - Introduce dynamic correlations
        - Different amounts
      - Results
        - Performed the best
    ]
  ]
]
