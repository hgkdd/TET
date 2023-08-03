\documentclass{mytudbeamer}

\usepackage{amssymb}	% Mathe
\usepackage{amsmath} % Mathe
\usepackage{mathtools}
\usepackage[nice]{nicefrac}
\usepackage{empheq}
\usepackage{cancel}
\usepackage{xspace}
\usepackage{xstring}		% Für Stringvergleiche und weiteres

\usepackage{upgreek}
\usepackage{tikz}
\usetikzlibrary{decorations.pathmorphing}
\usetikzlibrary{decorations.markings}
\usetikzlibrary{circuits.ee.IEC}
\usetikzlibrary{calc}

\def\centerarc[#1](#2)(#3:#4:#5)% Syntax: [draw options] (center) (initial angle:final angle:radius)
    { \draw[#1] ($(#2)+({#5*cos(#3)},{#5*sin(#3)})$) arc (#3:#4:#5); }


\usepackage{babel}
\usepackage{ccicons}
\usepackage{datetime2}
\usepackage{siunitx}[=v2]						% Für Einheiten \si{\milli\metre} oder mit Zahlenwert \SI{11,3}{\milli\metre}


\subtitle{Theoretische Elektrotechnik -- Vertiefung}
\author[H.G. Krauthäuser]{Prof. Dr. Hans Georg Krauthäuser}
\datecity{Lizenz$\colon$ CC BY 3.0 DE \qquad \ccby}
\institute[Theoretische Elektrotechnik und EMV]{Theoretische Elektrotechnik und Elektromagnetische Verträglichkeit}
\setAdditionalLogo{oer-logo-grau}
\setAdditionalLogoFooter{1x1}
% \setDesignImage{pics/DesignFrameTest_1}

\makeatletter
\let\save@measuring@true\measuring@true
\def\measuring@true{%
  \save@measuring@true
  \def\beamer@sortzero##1{\beamer@ifnextcharospec{\beamer@sortzeroread{##1}}{}}%
  \def\beamer@sortzeroread##1<##2>{}%
  \def\beamer@finalnospec{}%
}
\makeatother

\input{newcommands.inc}		% Befehle für das Dokument, bitte nicht vergessen diese auch in die newcommandlist einzutragen
\usepackage{import}
\usepackage{xifthen}
\usepackage{pdfpages}
\usepackage{transparent}
\usepackage{stackengine,xcolor,scalerel}

\newcommand{\incfig}[1]{%
    \def\svgwidth{\columnwidth}
    \import{bilder/bilder/}{#1.pdf_tex}
  }
\newcommand{\xincfig}[2]{%
    \def\svgwidth{#2}
    \import{bilder/bilder/}{#1.pdf_tex}
  }

\def\cpm{\mathbin{\ThisStyle{\ensurestackMath{\abovebaseline[-\dimexpr1pt+0.7\LMpt]{%
  \stackunder[-\dimexpr1pt+0.8\LMpt]{\color{green!70}\SavedStyle+}{%
  \color{red}\SavedStyle-}}}}}}
\def\cmp{\mathbin{\ThisStyle{\ensurestackMath{\abovebaseline[-\dimexpr1pt-0.7\LMpt]{%
  \stackunder[-\dimexpr1pt+0.9\LMpt]{\color{green!70}\SavedStyle-}{%
  \color{red}\SavedStyle+}}}}}}

\graphicspath{{bilder/}{.}}