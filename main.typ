#import "/globals.typ": *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.subtitle,
  config-info(
    title: [Memformer],
    subtitle: [A Memory Guided Transformer for Time Series Forecasting],
    author: [#underline[Yunyao Cheng], Chenjuan Guo, Bin Yang, #underline[Haomin Yu], #underline[Kai Zhao], #underline[Christian S. Jensen]],
    date: [February 2025],
    institution: [Proceedings of the VLDB Endowment, Volume 18, Issue 2],
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))
#title-slide(extra: [_Presented by_ *Andreas Gottschalk Krath*])

#include "slides/intro.typ"
#include "slides/method.typ"
#include "slides/result.typ"
#include "slides/critique.typ"
