#import "/globals.typ": *

= Methodology

== Overview

#slide[
  #block(height: 100%)[
    #align(center)[
      #image("/images/encoder.png", width: 100%)
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
      - Instance normalization

      #pause
      *Patches*
      - $H'$ is split into $p$ patches
      - Group temporally related data
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
      - Provides local information
        - These are learnable parameters
      - Consistant local information for patch $P_i$
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

      #pause
      *Gated Recurrent Unit*
      - Forwards information from $P_i$ to $P_(i+1)$
      - Temporally relates data in a sequence
      
      #pause
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
      #pause
      *Input*
        - Transpose locally enriched features
          - Isolate variables
          - Diffusion earlier
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
      - Global information is new
      - Adding global information after softmax
        - Bias probabilities

      #pause
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

// == Alternating Memory Enhancer
//
// #slide(composer: (1fr, 1fr))[
//   #block(height: 100%)[
//     #align(top)[
//       #pause
//       *Overview*
//       - Input
//         - Locally correlated features
//       - Outputs
//         - Local information $E$
//         - Global information $C_("glo")$
//       - Shared global memory
//
//       #pause
//       *Hyperparameters*
//       - $M$ #sym.arrow number of high level patterns
//         - Spikes, seasons, stable
//       - $D_("glo")$ #sym.arrow richness of patterns
//     ]
//   ]
// ][
//   #meanwhile
//   #image("/images/ame.png", width: 100%)
// ]
//
// #slide(composer: (1fr, 1fr))[
//   #block(height: 100%)[
//     #align(top)[
//       *Local Enhancer*
//       - Local memory regions $attach(#sym.Gamma, br: "loc"i)$
//         - One for each patch
//       - $P_i$ #sym.arrow.l.r.long $attach(#sym.Gamma, br: "loc"i)$ #sym.arrow $attach(#sym.Gamma, br: "loc"i)$ #sym.arrow.l.r.long $E_i$
//       - Not directly identical
//         - $E$ contains global memories influence
//         - Defined by $C_("loc")$
//       - Memories are *not* information
//     ]
//   ]
// ][
//   #meanwhile
//   #image("/images/ame.png", width: 100%)
// ]
//
// #slide(composer: (1fr, 1fr))[
//   #block(height: 100%)[
//     #align(top)[
//       *Global Enhancer*
//       - Learns from locally correlated features
//       - $attach(#sym.Gamma, br: "mem")$ is a large trainable tensor
//         - Produces inquiry tensor
//         - Recognizes patterns in data
//           - The $M$ high level patterns
//       #pause
//       - Inquiry tensor
//         - Prevalence of patterns in local data
//         - Similarity scores with global memory
//       #pause
//       - Probability distribution
//         - Importance of pattern
//       #pause
//       - Top $k$ most important patterns
//         - Stored in $C_("glo")$
//         - Scaled based on importance
//           - Weighted sum
//     ]
//   ]
// ][
//   #meanwhile
//   #image("/images/ame.png", width: 100%)
// ]
//
// #slide(composer: (1fr, 1fr))[
//   #block(height: 100%)[
//     #align(top)[
//       *Alternating Training*
//       - Local information $E$ requires
//         - Local memories
//         - Global memories
//       - Updating both simultaneously
//         - Unstable training
//         - Issues converging
//       - LE and GE alternate training
//         - Split adjustment of memories
//
//       #pause
//       *LE Training*
//       - Local memories > global memories
//         - More parameters #sym.arrow longer convergence
//       - Balance convergence
//         - Different learning rates
//         - LE training more
//     ]
//   ]
// ][
//   #pause
//   #image("/images/alternating_training.png", width: 100%)
// ]
