#import "/globals.typ": *

= Critique

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
      - Mistake in variance notation?
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

// == Notation
//
// #slide(composer: (1fr, 1fr))[
//   #block(height: 100%)[
//     #align(top)[
//       *Inconsistencies*
//       - $C_("glo")$ is global memory
//       - $C_("loc")$ is locally correlated features
//       - $E$ is local memory
//
//       #pause
//       *Symbol Reuse*
//       - $text("F", weight: "bold")$ is the ground truth
//       - $F$ is the dimensionality of $text("F", weight: "bold")$
//       - $text("F'", weight: "bold")$ is the encoding output
//       - $F'$ is the dimensionality of $text("F'", weight: "bold")$
//       - Confusing statements and diagrams
//     ]
//   ]
// ][
//   #pause
//   #block(height: 100%)[
//     #align(center + horizon)[
//       $text("F'", weight: "bold") #sym.in #sym.RR^(F' #sym.times N)$,
//       where $F'$ is the temporal dimension of the representation.
//     ]
//     #pause
//     #image("/images/input_notation.png", width: 100%)
//     #image("/images/output_notation.png", width: 100%)
//   ]
// ]
