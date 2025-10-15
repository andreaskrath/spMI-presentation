#import "/globals.typ": *

= Introduction

== Motivation

#slide[
  #block(height: 100%)[
    #align(top)[
      *Forecasting*
      - Predicting the future
        - Allows preparation
      - Many applications
        - Electricity prices
        - Finance
      - Long term forecasting?
        - Obviously more difficult than short term
        - Time constrained tasks
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *Long Term Forecasting*
      - What defines long term?
        - Historical horizon
        - Forecasting horizon
        - Both exceed 96 time steps
          - Hourly time step #sym.arrow 4 days
        - Time series

      *Variable Correlation*
      - Complex systems have many variables
      - $A$ increases and $B$ increases #sym.arrow Positive
      - $A$ increases and $B$ decreases #sym.arrow Negative
      - $A$ increases and $B$ is stagnant #sym.arrow None
      - These impact forecasting accuracy
        - Patterns in the data
    ]
  ]
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Dynamic Correlations*
      - Are variable correlations stable over time?
        - No
      - Correlations are dynamic over time
        - Seasons
        - Sensor drift
      - We often consider average
        - Especially hurtful in time series
        - Predictions are bad in periods
    ]
  ]
][
  #pause
  #image("/images/dynamic_correlations.png", width: 100%)
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Disrupted Correlations*
      - System errors
      - External influence
      - What happens with outliers?
        - Affect correlation #sym.arrow accuracy
      - Many models are sensitive to outliers
        - Numeric difference dominates training
        - Reason for a lot of preprocessing
          - Normalization
          - Clipping
          - Pruning
    ]
  ]
][
  #pause
  #image("/images/disrupted_correlations.png", width: 100%)
]

== Problem

#slide[
  #block(height: 100%)[
    #align(top)[
      *Challenge 1*
      - Capture dynamic correlations
      - Mitigate disrupted correlations
      - Existing solutions struggle with the latter
        - Capture dynamic and disrupted
        - Reduces model robustness

      *Challenge 2*
      - Local information #emoji.hands.shake global information
      - Global information is _all_ local information
      - Local information _affects_ global information
      - Existing solutions struggle with combining
        - Only local
        - Only global
    ]
  ]
]

== Contributions

#slide[
  #block(height: 100%)[
    #align(top)[
      *Memformer*
      - Transformer
      - Patch-wise recurrent graph learning
        - Captures dynamic correlations
      - Global attention
        - Mitigates disrupted correlations
      - Adresses challenge 1

      *Alternating Memory Enhancer*
      - Memory network
      - Associates local and global information
      - Adresses challenge 2

      *Experiments*
      - Proof
    ]
  ]
]
