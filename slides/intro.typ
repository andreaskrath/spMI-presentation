#import "/globals.typ": *

= Introduction

== Motivation

#slide[
  #block(height: 100%)[
    #align(top)[
      *IoT*
      - More devices
      - Time series
      
      #pause
      *Data Volume*
      - Too much data
      - Edge computing
      - What can we do?
        - Less data #sym.arrow Same value

      #pause
      *Existing Methods*
      - Coreset construction
      - Streaming learning
      - Issues
        - Not optimal
        - Downstream tasks
    ]
  ]
]

== Problem

#slide[
  #block(height: 100%)[
    #align(top)[
      *Challenge 1*
      - Effectiveness
        - Bi-level optimization
        - Capture relevant information
      - Generalization
        - Different networks

      #pause
      *Solution*
      - Curriculum Training Trajectory Matching (CT²D)
      - Expert trajectories
        - Based on original dataset
        - Offline
      - Match based on model parameters
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *Challenge 2*
      - Complex Temporal Dependencies 
      - Existing methods focus on image
      - Time series requires temporal analysis
      - Channel independent
        - Training stability

      #pause
      *Solution*
      - Time Series Feature Extraction (TSFE)
        - Channel independent mechanism
        - Stacked TSOperators
      - Decomposition-Driven Frequency Matching (DDFM)
        - Analyze intermediate TSFE
        - Match to original data
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *Challenge 3*
      - Scalability
      - Bi-level optimization
      - Models must be loaded at runtime
      - Ineffective and memory intensive

      #pause
      *Solution*
      - Expert buffer
        - Pre-computed expert trajectories
      - Patching
        - Combine data
    ]
  ]
]

== Contributions

#slide[
  #block(height: 100%)[
    #align(top)[
      *Dataset Condensation*
      - Novel time series dataset condensation
      - TSFE
      - DDFM
      - CT²M
    ]
  ]
]
