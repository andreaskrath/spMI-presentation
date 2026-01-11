#import "/globals.typ": *

#show: metropolis-theme.with(
  aspect-ratio: "16-9",
  footer: self => self.info.subtitle,
  config-info(
    title: [Less is More],
    subtitle: [Efficient Time Series Dataset Condensation via Two-fold Modal Matching],
    author: [#underline[Hao Miao], Ziqiao Lui, #underline[Yan Zhao], Chenjuan Guo, Bin Yang, Kai Zheng, #underline[Christian S. Jensen]],
    date: [February 2025],
    institution: [Proceedings of the VLDB Endowment, Volume 18, Issue 2],
  ),
)
#set heading(numbering: numbly("{1}.", default: "1.1"))
#title-slide(extra: [_Presented by_ *Andreas Gottschalk Krath*])

#include "slides/intro.typ"
#include "slides/method.typ"
#include "slides/experiment.typ"
#include "slides/critique.typ"
#include "slides/project.typ"
#include "slides/evaluation.typ"
