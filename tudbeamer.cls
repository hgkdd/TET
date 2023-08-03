%
% Praesentationsfolien-Klasse fuer die TU Dresden
% Autoren: Lukas Baron
%
\def\fileversion{1}
\def\filedate{2018/02/05}
\def\filename{tudbeamer}

\NeedsTeXFormat{LaTeX2e}  
\ProvidesClass{\@currname}[\filedate Praesentationsfolien-Klasse fuer die TU Dresden]
\typeout{Class: '\filename' Version \fileversion, Praesentationsfolienvorlage der Technischen Universitaet Dresden}

\RequirePackage{kvoptions}
\SetupKeyvalOptions{%
    family=tud,%
    prefix=tud@%
}

\newif\if@useGerman                             % explizit deutsche Namen verwenden und german-Package einbinden ?
\newif\if@useNoGerman                           % explizit englische Namen verwenden
\DeclareOption{nogerman}{\@useNoGermantrue\@useGermanfalse}
\DeclareOption{german}{\@useGermantrue\@useNoGermanfalse}
\DeclareOption{ngerman}{\@useGermantrue\@useNoGermanfalse}

\newif\if@useLegacy\@useLegacyfalse
\DeclareOption{legacy}{\@useLegacytrue}

%\newif\if@ifaBibliographyStyle\@ifaBibliographyStylefalse
%\DeclareOption{bibIfa}{\@ifaBibliographyStyletrue}

\newif\if@useNavBar\@useNavBarfalse
\DeclareOption{navbar}{\@useNavBartrue}
\newif\if@useProgress\@useProgressfalse
\DeclareOption{progress}{\@useProgresstrue}

\newif\if@sansMath\@sansMathtrue
\DeclareOption{serifmath}{\@sansMathfalse}

\newif\if@useSectionFrame\@useSectionFrametrue
\DeclareOption{nosectionframe}{\@useSectionFramefalse}
\newif\if@useSectionTOC\@useSectionTOCtrue
\DeclareOption{nosectiontoc}{\@useSectionTOCfalse}
\newif\if@useSectionTOCFrame\@useSectionTOCFramefalse
\DeclareOption{sectiontocframe}{\@useSectionTOCFrametrue}

\newif\if@usePartFrame\@usePartFrametrue
\DeclareOption{nopartframe}{\@usePartFramefalse}
\newif\if@usePartTOCFrame\@usePartTOCFrametrue
\DeclareOption{noparttoc}{\@usePartTOCFramefalse}

\newif\if@useTOCFrame\@useTOCFrametrue
\DeclareOption{notoc}{\@useTOCFramefalse}
\newif\if@useFrameCounter\@useFrameCountertrue
\DeclareOption{noFrameCounter}{\@useFrameCounterfalse}
\newif\if@noPrintColorInHandout\@noPrintColorInHandoutfalse
\DeclareOption{noPrintColorInHandout}{\@noPrintColorInHandouttrue}

\newif\ifdraftMode\draftModefalse
\DeclareOption{draft}{\draftModetrue}

\newif\if@useSectionNumInFrameTitle\@useSectionNumInFrameTitletrue
\DeclareOption{noframetitlesectionnum}{\@useSectionNumInFrameTitlefalse}

\DeclareStringOption[tud]{titlestyle} %option is tud@titlestyle
\DeclareStringOption[tud]{structurestyle} %option is tud@structurestyle

\DeclareStringOption[169]{aspectratio} %changing default aspect ratio

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{beamer}}
\ProcessKeyvalOptions*
\ProcessOptions\relax

%
% additional settings
%
\newcommand*{\datecity}[1]{\renewcommand*{\insertdatecity}{#1}}

\newcommand*\tud@additionallogo{}
\newcommand*{\setAdditionalLogo}[1]{\renewcommand*{%
    \tud@additionallogo}{#1}%
    \ifx\@empty\tud@additionallogofooter%
        \renewcommand*{\tud@additionallogofooter}{#1}%
    \fi%
}%
\newcommand*\tud@additionallogofooter{}
\newcommand*{\setAdditionalLogoFooter}[1]{\renewcommand*{\tud@additionallogofooter}{#1}}
\newcommand*\tud@designImage{}
\newcommand*{\setDesignImage}[1]{\renewcommand*{\tud@designImage}{#1}}

\def\today{\number\day.\number\month.\number\year}

\newcommand\enableProgress{\@useProgresstrue}
\newcommand\disableProgress{\@useProgressfalse}

\newcommand\enableNavBar{\@useNavBarfalse}
\newcommand\disableNavBar{\@useNavBartrue}

\newcommand\setStructureStyle[1]{\def\tud@structurestyle{#1}}

\newcommand\disablePartFrame{\@usePartFramefalse}
\newcommand\enablePartFrame{\@usePartFrametrue}
\newcommand\disablePartTOCFrame{\@usePartTOCFramefalse}
\newcommand\enablePartTOCFrame{\@usePartTOCFrametrue}

\newcommand\disableSectionFrame{\@useSectionFramefalse}
\newcommand\enableSectionFrame{\@useSectionFrametrue}
\newcommand\disableSectionTOCFrame{\@useSectionTOCFramefalse}
\newcommand\enableSectionTOCFrame{\@useSectionTOCFrametrue}
\newcommand\disableSectionTOC{\@useSectionTOCfalse}
\newcommand\enableSectionTOC{\@useSectionTOCtrue}
\newcommand\disableFrameCounter{\@useFrameCounterfalse}
\newcommand\enableFrameCounter{\@useFrameCountertrue}

\newcommand\enableFrameTitleSectionNum{\@useSectionNumInFrameTitletrue}
\newcommand\disableFrameTitleSectionNum{\@useSectionNumInFrameTitlefalse}

\gdef\tud@settingsOverride{}
\newcommand{\setSettingOverride}[1]{%
    \gdef\tud@settingsOverride{#1}%
    \tud@settingsOverride%
}%


\PassOptionsToPackage{table,fixpdftex,svgnames,hyperref,cmyk}{xcolor}
\PassOptionsToPackage{final}{listings}
\PassOptionsToPackage{unicode,naturalnames}{hyperref}

%
% load main class
%
\LoadClass[aspectratio=\tud@aspectratio]{beamer}

%
% language and font packages
%
\usefonttheme{professionalfonts}
\RequirePackage[defaultsans,scale=.95]{opensans} %scales the letter spacing, default refers to the printing style for numbers
\RequirePackage[T1]{fontenc}
\RequirePackage{lmodern}
% \RequirePackage[OT1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english, main=ngerman]{babel}
\RequirePackage{csquotes}          % Ergänzungspaket zu Babel für erweiterte Zitierfunktionen

% \usepackage{fontspec}
% \setsansfont{opensans}


%\DeclareLanguageMapping{ngerman}{ngerman-apa}
%\DeclareLanguageMapping{german}{german-apa}
%\DeclareLanguageMapping{english}{english-apa}

%
% other packages
%
\RequirePackage{pifont}
%\RequirePackage{caption}      % Paket zum Einbinden von Captions bei Nicht-Float-Objekten (hauptsächlich für Anhang)
\RequirePackage[	 % Verwendung von biblatex für das Literaturverzeichnis
    style=numeric-comp,%
    backend=biber,  %
	natbib=true,%
    sorting=none%
]{biblatex}

\RequirePackage{zref}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{color}
\RequirePackage[bse=none]{pdfcomment}

\RequirePackage{MnSymbol}
\RequirePackage{amsmath}

%\RequirePackage{appendixnumberbeamer}

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{\TPHorizModule}
\textblockorigin{0mm}{0mm}

\RequirePackage{listings}
\RequirePackage{wasysym}
\RequirePackage{calc}
\RequirePackage{zref-savepos}
\RequirePackage{environ}
\RequirePackage{multimedia}
\RequirePackage{tabularx,array,ragged2e}
\RequirePackage[export]{adjustbox}
\RequirePackage{comment}
\RequirePackage{transparent}
\RequirePackage{tikz}
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.15}
\usepgfplotslibrary{patchplots}
\usepgfplotslibrary{colormaps}
\usetikzlibrary{backgrounds}
\usetikzlibrary{pgfplots.colormaps}

%\usepackage{xspace}
%\RequirePackage{xcolor}
\RequirePackage{hyperref} %always require hyperref as the last package


%
% color setup - basic colors
%
% basic colors

\definecolor{white}{gray}{1.00}
\definecolor{gray}{gray}{0.65}
\definecolor{black}{gray}{0.00}

% cd print colors
\definecolor{hks41}{cmyk/RGB}{1,0.7,0.1,0.5/0,48,94}%TU blue primary cd color
\definecolor{hks92}{cmyk/RGB}{0.1,0,0.05,0.65/114,120,121}%TU grey secondary cd color - grey

\definecolor{hks44}{cmyk/RGB}{1,0.5,0,0/0,106,179}%highlight color 1st category cd   - brightblue
\definecolor{cyan}{cmyk/RGB}{1,0,0,0/0,158,224}%highlight color 1st category cd      - cyan

\definecolor{hks65}{cmyk/RGB}{0.65,0,1,0/106,176,35}%highlight color 2nd category cd - bright green
\definecolor{hks57}{cmyk/RGB}{1,0,0.9,0.2/0,125,64}%highlight color 2nd category cd - dark green

\definecolor{hks33}{cmyk/RGB}{0.5,1,0,0/147,16,126}%highlight color 2nd category cd - purple
\definecolor{hks36}{cmyk/RGB}{0.8,0.9,0,0/84,55,138}%highlight color 2nd category cd - violet

\definecolor{hks07}{cmyk/RGB}{0,0.6,1,0/238,127,0}%highlight color 2nd category cd - orange

%web colors
\definecolor{webredbright}{RGB}{221,39,39}
\definecolor{webreddark}{RGB}{181,28,28}
\definecolor{webbluebright}{RGB}{39,66,117}
\definecolor{webbluedark}{RGB}{0,37,87}

%sins colors
\definecolor{mathnaturebright}{cmyk/RGB}{0.65,0,1,0/106,176,35}
\definecolor{mathnaturedark}{cmyk/RGB}{0.9,0.17,1,0.05/0,133,49}

\definecolor{architectureenvironmentbright}{cmyk/RGB}{0.8,0,0.4,0/0,171,164}
\definecolor{architectureenvironmentdark}{cmyk/RGB}{1,0.1,0.4,0.15/0,129,139}

\definecolor{engineeringbright}{cmyk/RGB}{0.85,0.1,0.05,0/0,161,213}
\definecolor{engineeringdark}{cmyk/RGB}{1,0.2,0.05,0.2/0,119,173}

\definecolor{humansocialbright}{cmyk/RGB}{0.05,0.9,0,0/221,46,135}
\definecolor{humansocialdark}{cmyk/RGB}{0.05,1,0,0.1/204,0,114}

\definecolor{medicinebright}{cmyk/RGB}{0,0.85,0.85,0/230,68,46}
\definecolor{medicinedark}{cmyk/RGB}{0.15,1,1,0/204,7,30}

\definecolor{teachingbright}{cmyk/RGB}{0,0.6,1,0/238,127,0}
\definecolor{teachingdark}{cmyk/RGB}{0.1,0.8,1,0.05/209,77,23}


%default design colors
\colorlet{bgwhite}{white}
\colorlet{bgtud1}{hks41}
\colorlet{bgtud2}{hks44}
    \newcommand{\bgtudposone}{0.14}
    \newcommand{\bgtudpostwo}{1}
    \newcommand{\bgtudangle}{20}
\colorlet{bgdesign}{white}

\colorlet{designbar}{white}
\colorlet{designbarborder}{gray}
\newcommand{\designbaropacity}{0.6}

\colorlet{footerlogo}{hks41}

%\colorlet{text}{hks41}
%\colorlet{footertext}{hks41}

\colorlet{titletextbgwhite}{hks41}
\colorlet{titletextbgtud}{white}
\colorlet{titletextbgdesign}{white}

\colorlet{titleinstitutetextbgwhite}{hks41}
\colorlet{titleinstitutetextbgtud}{white}
\colorlet{titleinstitutetextbgdesign}{hks92}

\colorlet{titledatecitytextbgwhite}{hks41}
\colorlet{titledatecitytextbgtud}{white}
\colorlet{titledatecitytextbgdesign}{hks92} %TODO?

% \colorlet{frametitletext}{hks41}
% \colorlet{framesubtitletext}{hks92!125}


%alternative color names
\colorlet{tudblue}{hks41}%
\colorlet{primary}{hks41}%
\colorlet{tudgray}{hks92}%
\colorlet{secondary}{hks92}%
\colorlet{emph1_1}{hks44}%
\colorlet{emphblue}{hks44}%
\colorlet{emph1_2}{cyan}%
\colorlet{emphcyan}{cyan}%
\colorlet{emph2_1}{hks65}%
\colorlet{emphbrightgreen}{hks65}%
\colorlet{emph2_2}{hks57}%
\colorlet{emphgreen}{hks57}%
\colorlet{emph2_3}{hks33}%
\colorlet{emphpurple}{hks33}%
\colorlet{emph2_4}{hks36}%
\colorlet{emphviolet}{hks36}%
\colorlet{emph2_5}{hks36}%
\colorlet{emphorange}{hks07}%
\colorlet{alert}{hks07}%

\colorlet{blockbg}{hks41}%
\colorlet{blockbgexample}{hks92}%
\colorlet{blockbgalert}{hks07}%
\colorlet{blockbgproof}{hks57}%

\newcommand{\setBeamerColors}{%
    \setbeamercolor{normal text}{fg=text}%
    \setbeamercolor{structure}{fg=text}%
    \setbeamercolor{alerted text}{fg=hks07}%
    \setbeamercolor{frametitle}{fg=frametitletext}%
    \setbeamercolor{framesubtitle}{fg=framesubtitletext}%

    \setbeamercolor{block title}{bg=blockbg!60,fg=white}%
    \setbeamercolor{block body}{bg=blockbg!10,fg=text}%

    \setbeamercolor{block title example}{bg=blockbgexample!60,fg=white}%
    \setbeamercolor{block body example}{bg=blockbgexample!10,fg=text}%

    \setbeamercolor{block title alerted}{bg=blockbgalert!60,fg=white}%
    \setbeamercolor{block body alerted}{bg=blockbgalert!20,fg=text}%

    % \setbeamercolor{block title proof}{bg=blockbgproof!60,fg=white}%
    % \setbeamercolor{block body proof}{bg=blockbgproof!20,fg=blockbgproof}%

    \setbeamercolor{footline}{fg=footertext}%
    \setbeamercolor{enumerate item}{fg=text}%
    \setbeamercolor{itemize item}{fg=text}%
    \setbeamercolor{description item}{fg=text}%
    \setbeamercolor{item}{fg=text}%
    \setbeamercolor{item projected}{fg=text}%
    \setbeamercolor{example text}{fg=text}%

    \setbeamercolor{button}{fg=white,bg=hks41!60}
    \setbeamercolor{button border}{fg=hks41}
}

\newcommand{\setTitleTextColors}[1]{%
    \typeout{titletextstyle: #1}%

    \colorlet{titletext}{titletextbgwhite}%
    \colorlet{titleinstitutetext}{titleinstitutetextbgwhite}%
    \colorlet{titledatecitytext}{titledatecitytextbgwhite}%

    \ifthenelse{\equal{#1}{tud}}{%
        \colorlet{titletext}{titletextbgtud}%
        \colorlet{titleinstitutetext}{titleinstitutetextbgtud}%
        \colorlet{titledatecitytext}{titledatecitytextbgtud}%
    }{}%
    \ifthenelse{\equal{#1}{hks41}}{%
        \colorlet{titletext}{titletextbgtud}%
        \colorlet{titleinstitutetext}{titleinstitutetextbgtud}%
        \colorlet{titledatecitytext}{titledatecitytextbgtud}%
    }{}%
    \ifthenelse{\equal{#1}{tudblue}}{%
        \colorlet{titletext}{titletextbgtud}%
        \colorlet{titleinstitutetext}{titleinstitutetextbgtud}%
        \colorlet{titledatecitytext}{titledatecitytextbgtud}%
    }{}%
    \ifthenelse{\equal{#1}{primary}}{%
        \colorlet{titletext}{titletextbgtud}%
        \colorlet{titleinstitutetext}{titleinstitutetextbgtud}%
        \colorlet{titledatecitytext}{titledatecitytextbgtud}%
    }{}%
   \ifthenelse{\equal{#1}{design}}{%
        \colorlet{titletext}{titletextbgdesign}%
        \colorlet{titleinstitutetext}{titleinstitutetextbgdesign}%
        \colorlet{titledatecitytext}{titledatecitytextbgdesign}%
    }{}%
}%
\newcommand{\setBodyColors}[1]{%
    \ifthenelse{\equal{#1}{tud}}{%
        \colorlet{text}{white}%
        \colorlet{frametitletext}{white}%
        \colorlet{framesubtitletext}{white}%
    }{}%
    \ifthenelse{\equal{#1}{design}}{%
        \colorlet{text}{white}%
        \colorlet{frametitletext}{white}%
        \colorlet{framesubtitletext}{white}%
    }{}%
    \ifthenelse{\equal{#1}{hks41}}{%
        \colorlet{text}{white}%
        \colorlet{frametitletext}{white}%
        \colorlet{framesubtitletext}{white}%
    }{}%
    \ifthenelse{\equal{#1}{tudblue}}{%
        \colorlet{text}{white}%
        \colorlet{frametitletext}{white}%
        \colorlet{framesubtitletext}{white}%
    }{}%
    \ifthenelse{\equal{#1}{primary}}{%
        \colorlet{text}{white}%
        \colorlet{frametitletext}{white}%
        \colorlet{framesubtitletext}{white}%
    }{}%
    \ifthenelse{\equal{#1}{white}}{%
        \colorlet{text}{hks41}%
        \colorlet{frametitletext}{hks41}%
        \colorlet{framesubtitletext}{hks92!125}%
    }{}%
    \setBeamerColors%    
    \usebeamercolor[fg]{normal text}%
    \color{text}%
}%

\newcommand{\setDefaultColors}{%
    %TODO eval class options%
%
    \setTitleTextColors{\tud@titlestyle}%
    \colorlet{footertext}{hks92}%hks92
    \setBodyColors{white}%
%
    \if@noPrintColorInHandout\else%
        \mode<handout>{%
            \colorlet{text}{black}%
            \colorlet{frametitletext}{black}%
            \colorlet{framesubtitletext}{gray}%
            \colorlet{bg}{bgwhite}%
            \colorlet{titlebg}{bgwhite}%
            \colorlet{footerbg}{bgwhite}%
            \colorlet{footertext}{gray}%
            \colorlet{titlebg}{white}%
            \colorlet{footerlogo}{gray}%
            \setBeamerColors%
            \usebeamercolor[fg]{normal text}%
            \color{text}%
        }%
    \fi%
}

%
% bibliography settings
%
\setlength{\bibitemsep}{6pt}
\defbibheading{bibliography}{}
% for Texnic Center
\renewcommand*{\bibliography}[1]{\addbibresource{#1.bib}}
% adaption brackets of 'authoryear-comp' style
\renewcommand*{\citep}[2][]{\mkbibbrackets{\cite[#1]{#2}}}

%
% logo settings TODO where does the logo come from?
%
% \def\logo@front{logo_weiss}
% \def\logo@frontBrightBg{logo_blau}
% \def\logo@default{logo_blau}
% \ifx\pdfoutput\undefined\else\ifx\pdfoutput\relax\else\ifcase\pdfoutput\else\def\logo@front{TU_Logo_SW}\def\logo@default{TU_Logo_SW}\fi\fi\fi

%
% font settings
%
% \renewcommand*\encodingdefault{OT1}
\renewcommand*\familydefault{fos} %family open sans
% \renewcommand*\bfseries{\fontseries{b}\selectfont}
% \renewcommand*\shapedefault{n}
% \renewcommand*\sfdefault{fos}
% \renewcommand*\ttfamily{\not@math@alphabet\ttfamily\mathtt\fontfamily\ttdefault\fontseries\mddefault\selectfont}
%\newcommand*{\dinfamily}{\fontencoding{OT1}\fontfamily{\familydefault}\fontseries{b}\selectfont} %TODO remove

\newcommand\setDefaultBeamerFonts{
    \setbeamerfont{itemize/enumerate subbody}{size=\scriptsize}
    \setbeamerfont{itemize/enumerate subsubbody}{size=\scriptsize}
    \setbeamerfont{title}{size=\LARGE,series=\bfseries,family=\fontfamily{\familydefault}}
    \setbeamerfont{frametitle}{size=\Large,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{framesubtitle}{size=\large,series=\bfseries,family=\fontfamily{\familydefault}}
    \setbeamerfont{subtitle}{size=\large,series=\bfseries,family=\fontfamily{\familydefault}}
    \setbeamerfont{institute}{size=\small,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{author}{size=\small,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{date}{size=\small,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{footline}{size=\tiny,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{headline}{size=\tiny,series=,family=\fontfamily{\familydefault}}
    \setbeamerfont{caption}{size=\scriptsize}
}
\newcommand\setStructureFrameFonts{
    \setbeamerfont{frametitle}{size=\LARGE,series=\bfseries,family=\fontfamily{\familydefault}}
}

\if@sansMath
    \DeclareSymbolFont{fosLetters}{T1}{fos}{l}{sl}
    \SetSymbolFont{fosLetters}{bold}{T1}{fos}{b}{sl}
    \DeclareSymbolFont{fosOperators}{T1}{fos}{l}{n}
    \SetSymbolFont{fosOperators}{bold}{T1}{fos}{b}{n}
    
    \DeclareMathSymbol{a}{\mathalpha}{fosLetters}{`a}
    \DeclareMathSymbol{b}{\mathalpha}{fosLetters}{`b}
    \DeclareMathSymbol{c}{\mathalpha}{fosLetters}{`c}
    \DeclareMathSymbol{d}{\mathalpha}{fosLetters}{`d}
    \DeclareMathSymbol{e}{\mathalpha}{fosLetters}{`e}
    \DeclareMathSymbol{f}{\mathalpha}{fosLetters}{`f}
    \DeclareMathSymbol{g}{\mathalpha}{fosLetters}{`g}
    \DeclareMathSymbol{h}{\mathalpha}{fosLetters}{`h}
    \DeclareMathSymbol{i}{\mathalpha}{fosLetters}{`i}
    \DeclareMathSymbol{j}{\mathalpha}{fosLetters}{`j}
    \DeclareMathSymbol{k}{\mathalpha}{fosLetters}{`k}
    \DeclareMathSymbol{l}{\mathalpha}{fosLetters}{`l}
    \DeclareMathSymbol{m}{\mathalpha}{fosLetters}{`m}
    \DeclareMathSymbol{n}{\mathalpha}{fosLetters}{`n}
    \DeclareMathSymbol{o}{\mathalpha}{fosLetters}{`o}
    \DeclareMathSymbol{p}{\mathalpha}{fosLetters}{`p}
    \DeclareMathSymbol{q}{\mathalpha}{fosLetters}{`q}
    \DeclareMathSymbol{r}{\mathalpha}{fosLetters}{`r}
    \DeclareMathSymbol{s}{\mathalpha}{fosLetters}{`s}
    \DeclareMathSymbol{t}{\mathalpha}{fosLetters}{`t}
    \DeclareMathSymbol{u}{\mathalpha}{fosLetters}{`u}
    \DeclareMathSymbol{v}{\mathalpha}{fosLetters}{`v}
    \DeclareMathSymbol{w}{\mathalpha}{fosLetters}{`w}
    \DeclareMathSymbol{x}{\mathalpha}{fosLetters}{`x}
    \DeclareMathSymbol{y}{\mathalpha}{fosLetters}{`y}
    \DeclareMathSymbol{z}{\mathalpha}{fosLetters}{`z}
    \DeclareMathSymbol{A}{\mathalpha}{fosLetters}{`A}
    \DeclareMathSymbol{B}{\mathalpha}{fosLetters}{`B}
    \DeclareMathSymbol{C}{\mathalpha}{fosLetters}{`C}
    \DeclareMathSymbol{D}{\mathalpha}{fosLetters}{`D}
    \DeclareMathSymbol{E}{\mathalpha}{fosLetters}{`E}
    \DeclareMathSymbol{F}{\mathalpha}{fosLetters}{`F}
    \DeclareMathSymbol{G}{\mathalpha}{fosLetters}{`G}
    \DeclareMathSymbol{H}{\mathalpha}{fosLetters}{`H}
    \DeclareMathSymbol{I}{\mathalpha}{fosLetters}{`I}
    \DeclareMathSymbol{J}{\mathalpha}{fosLetters}{`J}
    \DeclareMathSymbol{K}{\mathalpha}{fosLetters}{`K}
    \DeclareMathSymbol{L}{\mathalpha}{fosLetters}{`L}
    \DeclareMathSymbol{M}{\mathalpha}{fosLetters}{`M}
    \DeclareMathSymbol{N}{\mathalpha}{fosLetters}{`N}
    \DeclareMathSymbol{O}{\mathalpha}{fosLetters}{`O}
    \DeclareMathSymbol{P}{\mathalpha}{fosLetters}{`P}
    \DeclareMathSymbol{Q}{\mathalpha}{fosLetters}{`Q}
    \DeclareMathSymbol{R}{\mathalpha}{fosLetters}{`R}
    \DeclareMathSymbol{S}{\mathalpha}{fosLetters}{`S}
    \DeclareMathSymbol{T}{\mathalpha}{fosLetters}{`T}
    \DeclareMathSymbol{U}{\mathalpha}{fosLetters}{`U}
    \DeclareMathSymbol{V}{\mathalpha}{fosLetters}{`V}
    \DeclareMathSymbol{W}{\mathalpha}{fosLetters}{`W}
    \DeclareMathSymbol{X}{\mathalpha}{fosLetters}{`X}
    \DeclareMathSymbol{Y}{\mathalpha}{fosLetters}{`Y}
    \DeclareMathSymbol{Z}{\mathalpha}{fosLetters}{`Z}

    \DeclareMathSymbol{,}{\mathpunct}{fosLetters}{`,}
    \DeclareMathSymbol{.}{\mathord}{fosLetters}{`.}
    \DeclareMathSymbol{/}{\mathord}{fosLetters}{`/}

    \DeclareMathSymbol{0}\mathalpha{fosOperators}{"30}
    \DeclareMathSymbol{1}\mathalpha{fosOperators}{"31}
    \DeclareMathSymbol{2}\mathalpha{fosOperators}{"32}
    \DeclareMathSymbol{3}\mathalpha{fosOperators}{"33}
    \DeclareMathSymbol{4}\mathalpha{fosOperators}{"34}
    \DeclareMathSymbol{5}\mathalpha{fosOperators}{"35}
    \DeclareMathSymbol{6}\mathalpha{fosOperators}{"36}
    \DeclareMathSymbol{7}\mathalpha{fosOperators}{"37}
    \DeclareMathSymbol{8}\mathalpha{fosOperators}{"38}
    \DeclareMathSymbol{9}\mathalpha{fosOperators}{"39}

    \DeclareSymbolFontAlphabet{\mathsf}{fosOperators}
    \DeclareSymbolFontAlphabet{\mathnormal}{fosLetters}
    \DeclareMathAlphabet\mathbf{T1}{fos}{b}{n}
    \SetMathAlphabet\mathbf{bold}{T1}{fos}{b}{n}
    \DeclareMathAlphabet\mathit{T1}{fos}{l}{sl}
    \SetMathAlphabet\mathit{bold}{T1}{fos}{l}{sl}
    %\DeclareMathSizes{\f@size}{12}{12}{10}

    \let\operator@font\sf
\fi
\usefonttheme[onlymath]{serif}


% language settings
%
% predefined symbols
\newcommand*{\englishvocabulary}{%
    \newcommand*{\tud@vocslide}{slide}
    \newcommand*{\tud@vocof}{of}
    \newcommand*{\tud@vocpart}{Part}
    \newcommand*{\tud@vocagenda}{Agenda}
}
\newcommand*{\germanvocabulary}{%
    \newcommand*{\tud@vocslide}{Folie}
    \newcommand*{\tud@vocof}{von}
    \newcommand*{\tud@vocpart}{Teil}
    \newcommand*{\tud@vocagenda}{Gliederung}
}
\DeclareRobustCommand\one{1\kern0.1pt} % 1 mit anschliessendem Freiraum, damit sie nicht deutlich kuerzer ist als die anderen Ziffern

%
% length settings
%
\newlength{\tudlogox}
\newlength{\tudlogoy}
\newlength{\tudlogoheight}

\newlength{\tudlogofooterx}
\newlength{\tudlogofootery}
\newlength{\tudlogofooterheight}

\newlength{\designbary}
\newlength{\designbarheight}
\newlength{\designbarborderwidth}

\newlength{\footery}
\newlength{\footerheight}

\newlength{\bodyy} %dynamic
\newlength{\bodyx} %dynamic
\newlength{\bodydefaultx}
\newlength{\bodyheight} %dynamic
\newlength{\bodydefaulty}
\newlength{\bodydefaultheight}
\newlength{\bodywidth}%dynamic
\newlength{\bodydefaultwidth}

\newlength{\textborderleft}
\newlength{\textborderright}

\newlength{\footertextx}
\newlength{\footertexty}
\newlength{\footertextwidth}

\newlength{\footerslidenumx}
\newlength{\footerslidenumy}
\newlength{\footerslidenumwidth}

\newlength{\addlogoxright}
\newlength{\addlogoy}
\newlength{\addlogoheight}
\newlength{\addlogofooterxright}
\newlength{\addlogofootery}
\newlength{\addlogofooterheight}

\newlength{\titley}
\newlength{\subtitley}
\newlength{\authorinstitutey}
\newlength{\titledatey}

\newlength{\frametitley}
\newlength{\framesubtitley}

\newlength{\structuretitley}
\newlength{\templength}
\newlength{\templengthb}

% dimensions are derived from the powerpoint template
%ppt width 33.867cm
%ppt height 19.05cm
\setlength{\tudlogox}{0.0239\beamer@paperwidth}
\setlength{\tudlogoy}{0.0509\beamer@paperheight}
\setlength{\tudlogoheight}{0.0751\beamer@paperheight}

\setlength{\tudlogofooterx}{0.0416\beamer@paperwidth}
\setlength{\tudlogofootery}{0.9239\beamer@paperheight}
\setlength{\tudlogofooterheight}{0.0472\beamer@paperheight}

\setlength{\designbary}{0.1496\beamer@paperheight}
\setlength{\designbarheight}{0.0252\beamer@paperheight}
\setlength{\designbarborderwidth}{.5pt}

\setlength{\footery}{0.8929\beamer@paperheight}
\setlength{\footerheight}{0.1071\beamer@paperheight}

\setlength{\footertextx}{0.2392\beamer@paperwidth}
\setlength{\footertexty}{0.9113\beamer@paperheight}
\setlength{\footertextwidth}{0.4251\beamer@paperwidth}

\setlength{\footerslidenumx}{0.7355\beamer@paperwidth}
\setlength{\footerslidenumwidth}{0.15\beamer@paperwidth}
\setlength{\footerslidenumy}{0.9369\beamer@paperheight}

\setlength{\textborderleft}{0.0718\beamer@paperwidth}
\setlength{\textborderright}{0.0718\beamer@paperwidth}

\setlength{\addlogoxright}{0.9771\beamer@paperwidth}
\setlength{\addlogoy}{0.0509\beamer@paperheight}
\setlength{\addlogoheight}{0.0751\beamer@paperheight}
\setlength{\addlogofooterxright}{0.9632\beamer@paperwidth}
\setlength{\addlogofootery}{0.9239\beamer@paperheight}
\setlength{\addlogofooterheight}{0.0509\beamer@paperheight}

\setlength{\titley}{0.4945\beamer@paperheight}
\setlength{\subtitley}{0.6206\beamer@paperheight}
\setlength{\titledatey}{0.7706\beamer@paperheight}
\setlength{\authorinstitutey}{0.3533\beamer@paperheight}

\setlength{\frametitley}{0.0504\beamer@paperheight}
\setlength{\framesubtitley}{0.12756\beamer@paperheight}

\setlength{\bodydefaultx}{0.0718\beamer@paperwidth}
\setlength{\bodydefaulty}{0.2157\beamer@paperheight}
\setlength{\bodydefaultwidth}{0.8679\beamer@paperwidth}
\setlength{\bodydefaultheight}{0.6357\beamer@paperheight}

\setlength{\structuretitley}{0.494\beamer@paperheight}

\newcommand{\setbeamerdimensions}{%
    \beamersetleftmargin{\bodyx}%
    \setlength{\templength}{\beamer@paperwidth-\bodyx-\bodywidth}%
    \beamersetrightmargin{\templength}%
    \setlength{\headsep}{5pt}%-0.005\beamer@paperheight}
}%

\newcommand{\setbodydefaultdimensions}{%
    \setlength{\bodyy}{\bodydefaulty}%
    \setlength{\bodyx}{\bodydefaultx}%
    \setlength{\bodyheight}{\bodydefaultheight}%
    \setlength{\bodywidth}{\bodydefaultwidth}%
    %\setbeamerdimensions
}%

\newcommand{\setbodynotitledimensions}{%    
    \setlength{\bodyy}{\frametitley}%
    \setlength{\bodyheight}{\bodydefaulty-\frametitley+\bodydefaultheight}%
    %\setbeamerdimensions
}%
\newcommand{\setbodynomargindimensions}{%
    \setlength{\bodyx}{0}%
    \setlength{\bodywidth}{\bodydefaultwidth+2\bodydefaultx}%
    %\setbeamerdimensions
}%
\newcommand{\setbodytitleframedimensions}{%
    \setbodydefaultdimensions%
    \setlength{\bodyheight}{\beamer@paperheight-\bodyy}%
   %\setbeamerdimensions
}%

%
% fixing buttons
%
\let\originalbeamerbutton\beamerbutton
\let\originalbeamergotobutton\beamergotobutton
\let\originalbeamerreturnbutton\beamerreturnbutton
\let\originalbeamerskipbutton\beamerskipbutton

\renewcommand\beamerbutton[1]{%    
    \raisebox{-0.2ex}{%
        \originalbeamerbutton{#1}%
    }%
}%
\renewcommand\beamergotobutton[1]{%    
    \raisebox{-0.2ex}{%
        \originalbeamergotobutton{#1}%
    }%
}%
\renewcommand\beamerreturnbutton[1]{%    
    \raisebox{-0.2ex}{%
        \originalbeamerreturnbutton{#1}%
    }%
}%
\renewcommand\beamerskipbutton[1]{%    
    \raisebox{-0.2ex}{%
        \originalbeamerskipbutton{#1}%
    }%
}%

%
% listings settings
%
\lstset{%
    basicstyle=\ttfamily\scriptsize\selectfont,%
    tabsize=2,%
    breaklines=true,%
    backgroundcolor=\color{tudblue!10},%
    frame=lines,%
    numbers=left,%
    numberstyle=\tiny,%
    numbersep=6pt,
    xleftmargin=1.5em,%
    keywordstyle=\bfseries,%
    commentstyle=\color{tudgray},
    stringstyle=\ttfamily\color{emph1_1},
    identifierstyle=\color{emph2_2},
    framexleftmargin=1.5em,%
    inputencoding=utf8,%
    extendedchars=true,%
    literate=%
        {€}{\euro}1%
        {§}{\S}1%
        {°}{\textdegree{}}1%
        {ä}{{\"a}}1%
        {ö}{{\"o}}1%
        {ü}{{\"u}}1%
        {ß}{{\ss}}1%
        {Ä}{{\"A}}1%
        {Ö}{{\"O}}1%
        {Ü}{{\"U}}1%
        {µ}{\textmu}1%
        {¹}{{\textsuperscript{1}}}1%
        {²}{{\textsuperscript{2}}}1%
        {³}{{\textsuperscript{3}}}1%
        {¼}{\textonequarter}1%
        {½}{\textonehalf}1%
        {¢}{\textcent}1%
    %style=tudListing%
}%

%
% template settings
%
%% patching the vertical skip between sections in table of contents
\patchcmd{\beamer@sectionintoc}{\vskip1.5em}{\vskip0.5em}{}{}%

%\newcommand{}{}

\newcounter{backmatterframes}%
\setcounter{backmatterframes}{0}%

%\patchcmd{\beamer@framefootnotetext}{\rule\z@\footnotesep\ignorespaces#1\@finalstrut\strutbox}{\ignorespaces#1}{}{}%
%\addtobeamertemplate{footnote}{}{\vspace{2ex}}%

%
% set template commands
%

\newcommand{\tud@logofile}{TU_Logo_SW}%

\newcommand{\tud@designframestyle}{tud} %possible values white/tud/design
\newcommand{\setDesignFrameStyle}[1]{\renewcommand{\tud@designframestyle}{#1}}%

%use tud@designimage variable for the design frame style

\newcommand*{\insertdatecity}{Dresden}%
\newcommand*{\inserttotalpagenumber}{\textbf{??}}%
\newcommand*{\inserteffectiveframenumber}{\textbf{??}}%

\newcommand*{\setNavigationSymbolTemplate}{%
    \if@useNavBar
        \setbeamertemplate{navigation symbols}{%
            \insertslidenavigationsymbol%
            \insertframenavigationsymbol%
            \insertsubsectionnavigationsymbol%
            \insertsectionnavigationsymbol%
            \insertdocnavigationsymbol%
            \insertbackfindforwardnavigationsymbol%
        }%
    \else%
        \setbeamertemplate{navigation symbols}{}\fi% Nav-Leiste aus
}

\newcommand{\setAuxilliaryBeamerTemplates}{%
    %TODO
    %\setbeamertemplate{items}{\color{text}--}%
    %
    % set itemize symbol template
    %
    \beamertemplatedotitem%
    \setbeamertemplate{itemize items}{--}%
    %
    % Templates
    \setNavigationSymbolTemplate%
    %
    % footnotes
    %
    \setbeamertemplate{footnote}{%
      \vskip-4pt%
      \tiny%
      \parindent 1em\noindent\hangindent=1.5em%
      \raggedright
      \hbox to 1.5em{\hfil\insertfootnotemark}\insertfootnotetext\par%
      \vskip4pt%
    }%
    \setlength\footnotesep{0pt}%
    \let\origfootnoterule\footnoterule%
    \renewcommand\footnoterule{\origfootnoterule\vskip3.5pt}%

    %
    % captions
    %
    \setbeamertemplate{caption}[numbered]%
    \setlength\abovecaptionskip{2pt}%
    % {%
    %     \insertcaptionname\ \insertcaptionnumber: \insertcaption Test
    % }

    %
    % blocks
    %
    %\addtobeamertemplate{block title end}{\vskip-1ex}

    %
    % buttons
    %
    % \setbeamertemplate{button}{%
    %     \tikz
    %         \node[
    %             %inner xsep=10pt,
    %             draw=structure!100,
    %             fill=structure!80,
    %             %rounded corners=4pt
    %         ]%
    %         {\scriptsize\color{white}\insertbuttontext};%
    % }

    % 
    % citation
    % 
    \setbeamertemplate{bibliography item}{\insertbiblabel} % removes the bibliography items since they do not match the cd, display the number
	\renewcommand{\bibfont}{\normalfont\tiny}%
}%

\newcommand{\setTitleHeadlineTemplates}{%
    \setbeamertemplate{headline}{%
        \setlength{\templength}{\beamer@paperwidth/2-\tudlogox}%
        \begin{textblock*}{\templength}(\tudlogox,\tudlogoy)%
          \color{hks41}\includegraphics[height=\tudlogoheight]{\tud@logofile}%
        \end{textblock*}%
        \ifx\tud@additionallogo\@empty\else%
            \begin{textblock*}{\templength}(\addlogoxright-\templength,\addlogoy)%
              \color{hks41}%
              \raggedleft\includegraphics[height=\addlogoheight]{\tud@additionallogo}%
            \end{textblock*}%
        \fi%
    }%
}%
\newcommand{\setTitleFooterTemplates}{%
    \setbeamertemplate{footline}{%
    }%
}%
\newcommand{\setFrameHeadlineTemplates}{%
    \setbeamertemplate{headline}{
        \usebeamercolor[fg]{normal text}%
        \color{text}%
    }%  
}%
%sets the footerheight via patching a command in the beamerclass, since no other way was found
\patchcmd{\beamer@calculateheadfoot}{\advance\footheight by 4pt}{\setlength{\footheight}{\footerheight+2pt}}{}{}%
\newcommand{\setFrameFooterTemplates}{%
    \setbeamertemplate{footline}{%
        %\fontsize{\footerheight}{\footerheight}\selectfont\vskip-2ex test\newline test2\newline\strut%
        %\scriptsize%
        \usebeamerfont{footline}%
        \begin{textblock*}{\the\beamer@paperwidth}(0pt,\the\footery)%
            \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,0cm)}]%current page.north west)]
                %\begin{scope}%
                    \draw[line width=\the\designbarborderwidth,designbarborder] (0,0)--(\the\beamer@paperwidth,0);%
                %\end{scope}%
            \end{tikzpicture}%
        \end{textblock*}%
        \setlength{\templength}{\beamer@paperwidth/2-\tudlogofooterx}%
        \begin{textblock*}{\templength}(\tudlogofooterx,\tudlogofootery)%
            \color{footerlogo}\includegraphics[height=\tudlogofooterheight]{\tud@logofile}%
        \end{textblock*}%
        \ifx\tud@additionallogofooter\@empty\else%
            \begin{textblock*}{\templength}(\addlogofooterxright-\templength,\addlogofootery)%
                \color{footerlogo}%
                \raggedleft\includegraphics[height=\addlogofooterheight]{\tud@additionallogofooter}%
            \end{textblock*}%
        \fi%
        \if@useFrameCounter%
            \begin{textblock*}{\footertextwidth}(\footertextx,\footertexty)%
        \else
            \begin{textblock*}{\footertextwidth+\footerslidenumwidth}(\footertextx,\footertexty)%
        \fi
            \fontsize{6pt}{6.5pt}\selectfont\color{footertext}\strut\insertshorttitle\strut\newline%\vskip.4ex%%\newline
            \fontsize{6pt}{6.5pt}\selectfont\strut\insertshortinstitute\strut%\tud@affiliationshort%
                \ifx\insertshortinstitute\@empty\else\ifx\beamer@shortauthor\@empty\else\,/\,\fi\fi%
                \strut\insertshortauthor\strut\newline%\vskip.7ex%
            \fontsize{6pt}{6.5pt}\selectfont\strut\insertdatecity\strut%
            \color{text}%
            \usebeamercolor[fg]{normal text}%
        \end{textblock*}%
        \if@useFrameCounter%
            \begin{textblock*}{\footerslidenumwidth}(\footerslidenumx,\footerslidenumy)%
                \color{footertext}%
                \raggedleft\strut\tud@vocslide\ \insertframenumber\ \tud@vocof\ \inserteffectiveframenumber\strut%
                \color{text}%
                \usebeamercolor[fg]{normal text}%
            \end{textblock*}%
        \else\fi%
        \usebeamercolor[fg]{normal text}%
        \color{text}%
    }%
    \usebeamercolor[fg]{normal text}%
    \color{text}%
}%
\newcommand{\drawTikzColorBackground}[3][tud]{% 1=style, 2=width; 3=height
    \typeout{drawingbackground style: #1, width: \number#2, height: \number#3}%
    \ifthenelse{\equal{#1}{tud}}{%
        \ifdraftMode%
            \fill[hks41] (0,0) rectangle (#2,#3);%
        \else%
            \if@useLegacy                
                \begin{axis}[%
                    width=#2,%
                    height=#3,%
                    scale only axis,%
                    domain=0:\number#2,%
                    y domain=0:\number#3,%
                    view={0}{90},%
                    hide axis,%
                    colormap= {tud}{color(0cm)=(bgtud1); color(\bgtudposone cm)=(bgtud1); color(\bgtudpostwo cm)=(bgtud2); color(1.0001cm)=(bgtud2)}]%
                    %zmin=0,zmax=1,title=,xlabel=,ylabel=,zlabel=,,ymin=0,ymax=10,xmin=0,xmax=10,
                        \addplot3[surf,shader=flat,patch type=bilinear,samples=50] {(-.4*x) + (.4) + (y)};%shader=interp% does not work on sumatrapdf
                        %,mesh/color input=explicit,draw=\transparent{1},shader=interp,patch,shader=faceted interp
                \end{axis}%
            \else
                \def\ratio{#2/#3}
                \pgfdeclareverticalshading{tudshadedbackground}%
                  {100bp}{%               
                    %only the area defined between 25bp and 75bp is visible on the shaded path
                    color(0bp)=(bgtud1);    
                    color(22bp)=(bgtud1);%lower right corner - dark
                    color(85bp)=(bgtud2);%upper left corner - bright
                    color(100bp)=(bgtud2)%
                }
                \pgfrect[ use as bounding box]{%
                    \pgfpoint{0pt}{0}%
                }{%
                    \pgfpoint{#2}{#3}%
                }%
                \pgfshadepath{tudshadedbackground}{\bgtudangle}%
                \pgfusepath{discard}%
            \fi
        \fi%
    }{%
        \fill[#1] (0,0) rectangle (#2,#3);%
    }%
}%
\newcommand*{\storecurrposy}[1]{%
     \zsavepos{#1}%
}%
\newcommand*{\getcurrposy}[1]{%
    \dimexpr\zposy{#1}sp\relax%
}%
\newcommand{\setTitleBodyTemplates}{%
    \setbodytitleframedimensions%
    %1. background
    \setbeamertemplate{background canvas}{%
        \ifthenelse{\equal{\tud@titlestyle}{design}}{%            
            \adjustbox{margin=0 0  0 \designbary}{%
                \setlength\templength{\beamer@paperheight-\designbary}%
                \setlength\templengthb{1.1\beamer@paperwidth}%
                \hspace*{-.05\beamer@paperwidth}\fillgraphicbox{\templengthb}{\templength}{\tud@designImage}%
            }%   
            \begin{tikzpicture}[overlay,inner frame sep=0,shift={(-1.05\beamer@paperwidth,\beamer@paperheight)}]
                   \fill[designbar,opacity=\designbaropacity] (0,-\the\designbary+.2pt) rectangle (\the\beamer@paperwidth, -\the\designbary-\the\designbarheight-.2pt);%
            \end{tikzpicture}%
        }{%
            \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,-\the\beamer@paperheight+0cm)}]
                \setlength\templength{\beamer@paperheight-\designbary}%              
                \drawTikzColorBackground[\tud@titlestyle]{\beamer@paperwidth}{\templength}%
                \pgfresetboundingbox%
            \end{tikzpicture}%
        }%
        \ifthenelse{\equal{\tud@titlestyle}{white}}{%
            \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,0cm)}]
                    \draw[line width=\the\designbarborderwidth,designbarborder] (0,-\the\designbary)--(\the\beamer@paperwidth,-\the\designbary);%
                    \draw[line width=\the\designbarborderwidth,designbarborder] (0,-\the\designbary-\the\designbarheight)--(\the\beamer@paperwidth,-\the\designbary-\the\designbarheight);%
            \end{tikzpicture}%
        }{%   
            \ifthenelse{\equal{\tud@titlestyle}{design}}{}{%else   
                \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,0cm)}]
                   \fill[designbar,opacity=\designbaropacity] (0,-\the\designbary+.2pt) rectangle (\the\beamer@paperwidth, -\the\designbary-\the\designbarheight-.2pt);%
                \end{tikzpicture}%
            }%
        }%
    }%
    \setbeamertemplate{title page}{%
        \setlength{\templength}{\beamer@paperwidth-\textborderleft-\textborderright}%
        %institute
        \begin{textblock*}{\templength}(\textborderleft,\authorinstitutey)%
          \usebeamerfont{author}%
          \color{titleinstitutetext}\strut\insertauthor\strut\ifx\beamer@shortauthor\@empty\else\\\fi%
          \usebeamerfont{institute}%
          \strut\insertinstitute\strut%
        \end{textblock*}%
        %title
        \begin{textblock*}{\templength}(\textborderleft,\titley)%
            \usebeamerfont{title}\color{titletext}%
                \strut\inserttitle\strut%
            \storecurrposy{afterTitle}%
            \setlength{\templengthb}{\beamer@paperheight-\getcurrposy{afterTitle}}%
            \ifthenelse{\templengthb > \subtitley}{%
                \vskip1.0ex%
                \usebeamerfont{subtitle}\color{titletext}\strut\insertsubtitle\strut%
            }{}%
        \end{textblock*}%
        %subtitle
        \setlength{\templengthb}{\beamer@paperheight-\getcurrposy{afterTitle}}%
        \ifthenelse{\templengthb > \subtitley}{}{%
            \begin{textblock*}{\templength}(\textborderleft,\subtitley)%
                \usebeamerfont{subtitle}\color{titletext}\strut\insertsubtitle\strut%
            \end{textblock*}%
        }%
        \begin{textblock*}{\templength}(\textborderleft,\titledatey)%
          \usebeamerfont{date}%
          \color{titledatecitytext}\strut\insertdatecity\strut%
        \end{textblock*}%
    }%
}%
\newsavebox\@structureframebackground%
\gdef\@savedstructureframebackground{notsaved}%
\newcommand\@setsavedstructureframebackground[1]{\gdef\@savedstructureframebackground{#1}}%
\newcommand\@structureframestyle{tud}%

\newcommand{\fillgraphicbox}[3]{%% width,height,path
    \adjustbox{min height=#2,min width=#1%
            ,Clip*={.5\width-.5#1} {.5\height-.5#2} {.5\width+.5#1} {.5\height+.5#2}%
    }{%
        \includegraphics[max height=#2,max width=#1,center,keepaspectratio=true]{#3}%
    }%
}%

\newcommand{\setStructureFrameBackgroundTemplates}[1][]{%
    \setbeamertemplate{background}{%
        \ifstrempty{#1}{\renewcommand\@structureframestyle{\tud@structurestyle}}{\renewcommand\@structureframestyle{#1}}%
        \ifthenelse{\equal{\@structureframestyle}{design}}{%
            \setlength\templength{\beamer@paperheight-\footerheight}%
            \fillgraphicbox{\beamer@paperwidth}{\templength}{\tud@designImage}%
        }{%
            \ifthenelse{\equal{\@structureframestyle}{tud}}{%
                \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,0cm-\the\footery)}]%
                    \drawTikzColorBackground[\@structureframestyle]{\beamer@paperwidth}{\footery}%
                    \pgfresetboundingbox%
                \end{tikzpicture}%
            }{%
                \begin{tikzpicture}[overlay,inner frame sep=0,shift={(0cm,0cm-\the\footery)}]
                    \drawTikzColorBackground[\@structureframestyle]{\beamer@paperwidth}{\footery}%
                    \pgfresetboundingbox%
                \end{tikzpicture}%
            }%
        }%
    }%
}%

\newcommand{\setDefaultBodyTemplates}{%
    \setbeamertemplate{background canvas}{}%   
    \setbeamertemplate{background}{}%
    \setbeamertemplate{frametitle}{%
        \nointerlineskip%
        \usebeamerfont{frametitle}\vskip3.5mm%
        \color{frametitletext}\strut\if@useSectionNumInFrameTitle\frame@title@section\fi\insertframetitle\strut%\\%
        \ifx\insertframesubtitle\@empty\else\usebeamerfont{framesubtitle}\color{framesubtitletext}\newline\vskip-3.5mm\strut\insertframesubtitle\strut\fi%
        %\vskip-1.5ex%\newline\fi%\vskip.5ex%  
        \usebeamercolor[fg]{normal text}%
        \color{text}%
    }%
    \usebeamercolor[fg]{normal text}%
    \color{text}%
}%
\newcommand\@insertsectionframetitlewithouttoc{%  
    \usebeamerfont{title}\color{titletext}%
    \begin{textblock*}{\bodywidth}(\bodyx,\structuretitley)%
        \usebeamerfont{title}\color{titletext}\strut\ifnum\c@section>9\else0\fi\arabic{section}\,\,\insertsection\strut%
    \end{textblock*}%
}%
\newcommand\@insertsectiontocframecontent{%
    \frametitle*{\insertsection\,--\,\tud@vocagenda}%
    \tableofcontents[currentsection,sectionstyle=show/shaded,subsectionstyle=show/show/hide]%
}%
\newcommand{\setSectionFrameBodyTemplates}{%
    \setDefaultBodyTemplates%
    \setTitleTextColors{\tud@structurestyle}%    
    \if@useSectionTOC%
        \if@useSectionTOCFrame%
            \setStructureFrameBackgroundTemplates%
        \else\fi%
    \else%
        \setStructureFrameBackgroundTemplates%
    \fi%
    \setbeamertemplate{section page}{%
        \if@useSectionTOC%
            \if@useSectionTOCFrame%
                \@insertsectionframetitlewithouttoc%
            \else%
                \@insertsectiontocframecontent%
            \fi%
        \else%
            \@insertsectionframetitlewithouttoc%
        \fi%
    }%
}
\newcommand\@insertparttocframecontent{%
    \frametitle*{\tud@vocpart\, \insertpartnumber\,--\,\tud@vocagenda}%
    \tableofcontents[sectionstyle=show,subsectionstyle=hide]%
}%
\newcommand{\setPartFrameBodyTemplates}{%
    \setDefaultBodyTemplates%
    \setTitleTextColors{\tud@structurestyle}%
    \setStructureFrameBackgroundTemplates%
    \setbeamertemplate{part page}{%
        \begin{textblock*}{\bodywidth}(\bodyx,\structuretitley)%
            \usebeamerfont{title}\color{titletext}%
            \strut\tud@vocpart\,\insertpartnumber\,\,\insertpart\strut%
        \end{textblock*}%
    }%
}%
\newcommand{\setDesignFrameBodyTemplates}{%
    \setBodyColors{\tud@structurestyle}%
    \setDefaultBodyTemplates%
    \setStructureFrameBackgroundTemplates%
    %TODO adjust, in case there is a title
}%
\newcommand{\setTitleFrameTemplates}{%
    \setTitleHeadlineTemplates%
    \setTitleFooterTemplates%
    \setTitleBodyTemplates%
    \setbeamertemplate{navigation symbols}{}%
    \tud@settingsOverride%
}%
\newcommand{\setDefaultFrameTemplates}{%
    \setDefaultBeamerFonts%
    \setDefaultColors%
    \setFrameHeadlineTemplates%
    \setFrameFooterTemplates%
    \setDefaultBodyTemplates%
    \tud@settingsOverride%
}%
\newcommand{\setDesignFrameTemplates}{%    
    \setFrameHeadlineTemplates%
    \setFrameFooterTemplates%
    %\setDefaultBodyTemplates%
    \setDesignFrameBodyTemplates%
    \tud@settingsOverride%
}%
\newcommand{\setPartFrameTemplates}{%
    \setStructureFrameFonts%
    \setFrameHeadlineTemplates%
    \setFrameFooterTemplates%
    \setPartFrameBodyTemplates% 
    \tud@settingsOverride%   
}%
\newcommand{\setSectionFrameTemplates}{%
    \setStructureFrameFonts%
    \setFrameHeadlineTemplates%
    \setFrameFooterTemplates%
    \setSectionFrameBodyTemplates%    
    \tud@settingsOverride%  
}%
\newcommand{\setFinalFrameTemplates}{%
    \setStructureFrameFonts%
    \setFrameHeadlineTemplates%
    \setFrameFooterTemplates%
    \setPartFrameBodyTemplates% 
    \setBodyColors{\tud@structurestyle}%
    \tud@settingsOverride%
}%

%
% environments for special frames
%
\newcounter{framenumbertemp}
\NewEnviron{backmatterframe}[1][]{%
    \def\frameOptions{#1}%
    \setcounter{framenumbertemp}{-\value{framenumber}}
    \typeout{begin backmatterframe at frame \the\value{framenumber}, backmatterframecounter: \the\value{backmatterframes}}
    \ifx\frameOptions\@empty%
        \begin{frame}%
            \BODY%
        \end{frame}%
    \else%
        \begin{frame}[#1]%
            \BODY%
        \end{frame}%
    \fi%
    \addtocounter{framenumbertemp}{\value{framenumber}}
    \addtocounter{backmatterframes}{\value{framenumbertemp}}%
    \typeout{end backmatterframe, at frame \the\value{framenumber}, count of frames \the\value{framenumbertemp}, new backmatterframecounter: \the\value{backmatterframes}}
}%

\NewEnviron{finalframe}[1][]{%
    \def\frameOptions{#1}%
    \setFinalFrameTemplates%
    \ifx\frameOptions\@empty%
        \begin{frame}%
            \BODY%
        \end{frame}%
    \else%
        \begin{frame}[#1]%
            \BODY%
        \end{frame}%
    \fi%
    \setDefaultFrameTemplates%
}%

%
% document commands and hooks
%
\AtEndPreamble{%
    \setbodydefaultdimensions%
    \setbeamerdimensions%

    \setDefaultColors%
    \mode<handout:0>{
        \hypersetup{
            linkcolor=text,%
            urlcolor=text,%
            citecolor=hks57,%
            pdfborder=0 0 0,%
            % bookmarks=true,%
            % pdftitle=\inserttitle,%
            % pdfauthor=\insertauthor,%
            % pdfsubject=\insertsubject%
        }
    }
    \mode<handout>{
        \hypersetup{
            linkcolor=text,%
            urlcolor=text,%
            citecolor=text,%  
            pdfborder=0 0 0,%
            % bookmarks=true,%
            % pdftitle={\inserttitle},%
            % pdfauthor=\insertauthor,%
            % pdfsubject=\insertsubject%
        }% 
    }%
    % \pdfinfo{
    %    /Author (\insertauthor)
    %    /Title  (\inserttitle)
    %    % /CreationDate (D:20040502195600)
    %    % /Subject (PDFLaTeX)
    %    % /Keywords (PDF;LaTeX)
    % }
}%

\renewcommand\maketitle{%
    \setTitleFrameTemplates%
    \frame{\titlepage}%
    \setNavigationSymbolTemplate%
    \setDefaultFrameTemplates%
    \setDefaultBeamerFonts%
    %
    %table of contents
    \if@useTOCFrame
        \setStructureFrameFonts%
        \frame{
            \frametitle*{\tud@vocagenda}
            \tableofcontents[sectionstyle=show,subsectionstyle=hide]
        }
        \setDefaultBeamerFonts%
    \fi%
    %
    \if@usePartFrame%
        \AtBeginPart{%
            \setPartFrameTemplates%
            \frame{\partpage}%
            \setDefaultFrameTemplates%
            % part toc
            \if@usePartTOCFrame%
                \setStructureFrameFonts%
                \begin{frame}%
                    \@insertparttocframecontent%
                \end{frame}%
                \setDefaultBeamerFonts%
            \fi%
        }%
    \fi%
    \if@useSectionFrame%
         \AtBeginSection[]{%
            \setSectionFrameTemplates%
            \frame{\sectionpage}%
            \setDefaultFrameTemplates%
            %section toc
            \if@useSectionTOC\if@useSectionTOCFrame%
                \setStructureFrameFonts%
                \begin{frame}%
                    \@insertsectiontocframecontent%
                \end{frame}%
                \setDefaultBeamerFonts%
            \fi\fi%
         }%
    \fi%    
    % Kopf-/Fusszeilen fuer restliche Folien
    \setDefaultFrameTemplates%
}%

% frame title section prefix with alternate starred cmd
\gdef\frame@title@section{}%
\def\frametitle{\secdef\tud@frametitlea\tud@frametitles}%
\newcommand<>\tud@frametitlea{\gdef\frame@title@section{\ifnum\c@section>9\else0\fi\arabic{section}\,\,}\alt#1{\@dblarg\beamer@@frametitle}{\beamer@gobbleoptional}}%
\newcommand<>\tud@frametitles{\gdef\frame@title@section{}\alt#1{\@dblarg\beamer@@frametitle}{\beamer@gobbleoptional}}%

\newcommand{\restoreDefaultSettings}{%
    \setDefaultBeamerFonts%
    \setDefaultColors%
    \setAuxilliaryBeamerTemplates%
    \scriptsize%
    \setDefaultFrameTemplates%
}%

% set language
\AtBeginDocument{%
    \ifx\@undefined\if@german%        
        \newif\if@german                            % Nutzung des german-Packages ?
                    %                
        \ifx\@undefined\germanTeX\else\@germantrue\fi       % Wenn \(n)germanTeX definiert ist,
        \ifx\@undefined\ngermanTeX\else\@germantrue\fi      % ist das (n)german-Package eingebunden
        \ifx\@undefined\language\else                       %
            \ifnum0=\language\@germanfalse\else\fi          % \language=0  =>  english
        \fi%
                                                 %
        \if@useGerman\@germantrue\fi                        % Zur expliziten Nutzung der deutschen Texte (das ngerman-Package wurde automatisch eingebunden)
        \if@useNoGerman\@germanfalse\fi                     % Zur expliziten Nutzung der englischen Texte (auch bei vorheriger Einbindung des german-Packages)
        \if@german                                          %
%
            \ifx\@undefined\language\else                   %
                \ifnum2<\language\selectlanguage{german}\fi % deutsch gewuenscht, aber andere Sprache eingestellt ??  =>  deutsch
                \ifnum2>\language\selectlanguage{german}\fi %
            \fi                                             %
            \germanvocabulary                                    %
            \def\today{\number\day.\number\month.\number\year}  % Datum im Format DD.MM.YYYY
        \else                                               %
%
            \ifx\@undefined\language\else                   %
                \ifnum0<\language\selectlanguage{english}\fi% englisch gewuenscht, aber andere Sprache eingestellt ??  =>  englisch
            \fi                                             %
            \englishvocabulary                                   %
            \def\today{\number\year/\number\month/\number\day}  % Datum im Format YYYY/MM/DD
        \fi%       
                                          %
    \fi%   
    \setDefaultBeamerFonts%
    \setDefaultColors%
    \setAuxilliaryBeamerTemplates%
    \scriptsize%
    \makeatother%
    \pgfplotsset{%
        colormap={tudplot}{%
            color(0cm) = (hks41);%
            color(1cm) = (hks44) }%
    }%
}%

\AtEndDocument{%

    \clearpage
    %reset total frame counter in order to hide pages behind actual content.
    \newcounter{modifiedFrameNumber}
    \setcounter{modifiedFrameNumber}{\value{framenumber}}
    \addtocounter{modifiedFrameNumber}{-\value{backmatterframes}}
    \xdef\modifiedFrameNumberValue{\value{modifiedFrameNumber}}%
    \beamer@tempcount=\c@page\advance\beamer@tempcount by -1%
    \if@filesw
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\beamer@partpages{\the\beamer@partstartpage}{\the\beamer@tempcount}}}}%
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\beamer@subsectionpages{\the\beamer@subsectionstartpage}{\the\beamer@tempcount}}}}%
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\beamer@sectionpages{\the\beamer@sectionstartpage}{\the\beamer@tempcount}}}}%
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\beamer@documentpages{\the\beamer@tempcount}}}}
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\gdef\noexpand\inserteffectiveframenumber{\the\modifiedFrameNumberValue}}}}
        \addtocounter{page}{-1}
        \immediate\write\@auxout{\string\@writefile{nav}%
            {\noexpand\headcommand{\noexpand\gdef\noexpand\inserttotalpagenumber{\thepage}}}}
        \newwrite\tf@nav
        \immediate\openout\tf@nav\jobname.nav\relax
        \newwrite\tf@toc
        \immediate\openout\tf@toc\jobname.toc\relax
        \newwrite\tf@snm
        \immediate\openout\tf@snm\jobname.snm\relax
    \fi%
}%
