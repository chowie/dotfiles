---
papersize: letter
fontsize: 10pt
documentclass: report
classoptions: 
    - \usepackage{lmodern}
    - \usepackage{framed}
    - \usepackage{xcolor}
    - \let\oldquote=\quote
    - \let\endoldquote=\endquote
    - \colorlet{shadecolor}{orange!15}
    - \renewenvironment{quote}{\begin{shaded*}\begin{oldquote}}{\end{oldquote}\end{shaded*}}
    - \usepackage{marginnote}
    - \usepackage[top=Bcm, bottom=Hcm, outer=Ccm, inner=Acm, heightrounded, marginparwidth=Ecm, marginparsep=Dcm]{geometry}
    - \usepackage{endnotes}
    - \let\footnote=\endnote
    - \def\footnotetext{\endnotetext[\number\numexpr\value{endnote}+1]}
    - \let\footnotemark\endnotemark
    - \usepackage{verbatim}
geometry: margin=1in
mainfont: DejaVu Sans
sansfont: DejaVu Sans
links-as-notes: true
title: User Stories for MIDisclose::Candidate Transaction Entry
subject: User stories created during the functional design phase of MIDisclose::Candidate
date: \today
author: Michigan Interactive, LLC
header-includes:
    - \usepackage[utf8]{inputenc}
    - \usepackage{fancyhdr}
    - \pagestyle{fancy}
    - \fancyhead{}
    - \fancyhead[R]{\footnotesize \em \rightmark}
    - \fancyhead[L]{\footnotesize \em \leftmark}
    - \fancyfoot{}
    - \fancyfoot[R]{\footnotesize \em version 2.2}
    - \fancyfoot[C]{\footnotesize \thepage}
colorlinks: true
linkcolor: Blue
citecolor: Green
---

