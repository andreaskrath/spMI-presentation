#import "/globals.typ": *

= Methodology

== Overview

== Preprocessing

#slide[
  #block(height: 100%)[
    #align(top)[
      *Instance normalization*
      - Normalize within historical horizon only
      - Mitigates the issue of internal covariate shift
      - Allows model to effectively grasp the intricate temporal dynamics inherent in time series

      #grid(
        columns: 2,
        column-gutter: 2em,
        [
          #block(width: 100%)[
            #align(center)[
              $ 
                & H' = (H - #sym.mu) \/ sqrt((#sym.sigma^2 + c)), text("where") \
                & H text("is the historical horizon") \
                & #sym.mu text("is the mean") \
                & #sym.sigma text("is the variance") \
                & c text("ensures numerical stability")
              $
            ]
          ]
        ],
        [
          #pause
          #align(center + horizon)[
            #block(width: 100%)[
              #image("/images/preprocessing.png", width: 100%)
            ]
          ]
        ],
      )

      #pause
      - Mistake in variance?
        - $#sym.sigma$ is conventional notation for standard deviation
        - $#sym.sigma^2$ is conventional notation for variance
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *What is going on?*

      #pause
      - Explored code to find answer
      - `data_provider/data_loader.py`
        - Only place anything related to loading data happens
        - `Dataset_ETT_hour`, `Dataset_ETT_minute`, `Dataset_Custom`, `Dataset_Pred`

      #pause
      ```python
      from sklearn.preprocessing import StandardScaler
      class ...:
          def __read_data__(self):
              self.scalar = StandardScaler()
              self.scaler.fit(train_data.values)
              data = self.scaler.transform(df_data.values)
      ```
      #pause
      - They fit on training data
      - Normalize entire dataset with #sym.mu and #sym.sigma from training data
    ]
  ]
]

#slide[
  #block(height: 100%)[
    #align(top)[
      *What are they actually doing?*
      #grid(
        columns: 2,
        column-gutter: 2em,
        [
          #align(top + center)[
            #block(width: 100%)[
              #align(center)[
                Preprocessing
                $ 
                  & H' = (H - #sym.mu) \/ sqrt((#sym.sigma^2 + c)), text("where") \
                  & H text("is the historical horizon") \
                  & #sym.mu text("is the mean") \
                  & #sym.sigma text("is the variance") \
                  & c text("ensures numerical stability")
                $
              ]
            ]
          ]
        ],
        [
          #align(top + center)[
            #block(width: 100%)[
              #align(center)[
                StandardScaler
                $ 
                  & z = (x - #sym.mu) \/ #sym.sigma, text("where") \
                  & x text("is the sample") \
                  & #sym.mu text("is the mean") \
                  & #sym.sigma text("is the standard deviation") \
                $
              ]
            ]
          ]
        ]
      )

      #pause
      - We know that $sqrt(#sym.sigma^2) = #sym.sigma$
      #pause
      - Essentially same formula, except constant
      #pause
      - Fit on training data, normalize entire dataset #sym.arrow.r global normalization
      #pause
      - None of the stated benefits of instance normalization
        - Mitigate internal covariate shift
        - Grasp intricate temporal dynamics in TS
    ]
  ]
]

== Patch-wise Recurrent Graph Learning

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Architecture*
      $
        text("Upper part") #sym.arrow.r & text("dynamic correlation") \
        text("Lower part") #sym.arrow.r & text("normalized data") \
        text("Output") #sym.arrow.r & text("enriched input features") \
      $
    ]
  ]
][
  #meanwhile
  #image("/images/patch-wise-recurrent-graph-learning.png", width: 100%)
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Normalized Data*
      - Normalized as described earlier
        - Not what the paper actually states

      #pause
      *Patches*
      - $H'$ is split into $p$ patches
      - Stride $S$
      - Size $T$
      - If $S >= T$ patches are disjoint
      - If $S < T$ patches overlap
        - Common elements for adjacent patches
    ]
  ]
][
  #meanwhile
  #image("/images/patches.png", width: 100%)
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *AME*
      - Provides local memory embedding
        - These are learnable parameters
      - Consistant local memory for patch $P_i$
      - Matrix product of $E_i #sym.times.circle E^T_i$
        - Similarity matrix for variables in $P_i$

      #pause
      *ReLU + Softmax*
      - ReLU eliminates negative values
        - Removes negative correlations
      - Softmax scales into influence scores

      #pause
      *Graph*
      - Translates influence scores into graph
      - Captures connection between variables
        - Dynamic correlations
    ]
  ]
][
  #meanwhile
  #image("/images/graphs.png", width: 100%)
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Diffusion Convolution*
      - Normalized data is adjusted based on connections in graph
      - Numeric values "diffuse" into neighbours
        - Not only immediate neighbours
      - Spatially relates data based on connections

      *Gated Recurrent Unit*
      - Forwards information from $P_i$ to $P_(i+1)$
      - Temporally relates data in a sequence
      
      *Output*
      - Input features enriched with local information
      - Spatial #sym.arrow.r dynamic correlations
      - Temporal #sym.arrow.r GRU
    ]
  ]
][
  #meanwhile
  #image("/images/patch-wise-recurrent-graph-learning.png", width: 100%)
]

== Global Attention

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Motivation*
      - Patch-wise correlations are sensitive
        - Outliers dominate
      - Constrain locally enriched features
        - Mitigate disrupted correlations

      *Input*
        - Transpose locally enriched features
          - Isolate variables
        - Linear transformation
          - Positional encoding
        - Converted to Q, K, V matrices
          - Learnable parameters
    ]
  ]
][
  #meanwhile
  #image("/images/global-attention.png", width: 100%)
]

#slide(composer: (1fr, 1fr))[
  #block(height: 100%)[
    #align(top)[
      *Attention*
      - Relatively conventional implementation
        - Query and Key to find importance
        - Weight Value by importance
      - Global information is new
      - Adding global information after softmax
        - Bias probabilities
        - Global information affects parameters

      *Output*
      - The final "representation" of data
      - $text("F'", weight: "bold")$ is not a forecast
        - Final feature representation
      - Linear layer maps to forecasting horizon
    ]
  ]
][
  #meanwhile
  #image("/images/global-attention.png", width: 100%)
]
