#import "/globals.typ": *

= Evaluation

#slide[
  #block(height: 100%)[
    #align(top)[
      *Idea*
      - Logical methodology
        - Data loss (DDFM)
        - Training loss (CT²M)
        - Usecase loss (downstream prediction task)
      - Focus on efficiency
        - Faster training
        - Less data
        - Lower memory usage
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *Execution*
      - Inconsistencies
        - TSOperator structure
        - TimeDC terminology
      - Missing details
        - Loss in CT²M
      - Cherry-picked results
        - Datasets
        - Forecasting horizons
        - Bold in Table 2
      - Resource constrained environments
        - Edge computing?
        - Embedded?
        - Moved computation to offline
    ]
  ]
]
