\ExplSyntaxOn
\NewExpandableDocumentCommand{\tetrepeatb}{O{}mm}
 {
  \int_compare:nT { #2 > 0 }
   {
    #3 \prg_replicate:nn { #2 - 1 } { #1#3 }
   }
 }
\ExplSyntaxOff

\makeatletter
\newcommand{\tet@qty}{}
\newcommand{\tet@argument}{}
\newcommand{\tet@esses}{}

\ProvideDocumentCommand\qty{ m m }%
{%
  \renewcommand{\tet@qty}{#1}
  \renewcommand{\tet@argument}{#2}
  \IfNoValueF{#2}{%
  % v 
  \let\tmpqa\tet@qty
  \IfSubStr{\tet@argument}{v}{\renewcommand{\tet@qty}{\vec{\tmpqa}}}{}%
  % u 
  \let\tmpqb\tet@qty
  \IfSubStr{\tet@argument}{u}{\renewcommand{\tet@qty}{\underline{\tmpqb}}}{}%
  % s ss sss
  \let\tmpqc\tet@qty
  \IfSubStr{\tet@argument}{s}{%
    \StrCount{\tet@argument}{s}[\tmpa]%
   \edef\tmpb{\tetrepeatb{\tmpa}{'}}%
   \renewcommand{\tet@esses}{\tmpb}%
   \renewcommand{\tet@qty}{\tmpqc{\tet@esses}}%
  }{}}%
  \tet@qty
}
\makeatother 



% % % % % % % % % % % % % % % % % % %
% neue Befehle

% Fließtext

\newcommand{\zB}{\mbox{z.\,B.}\xspace}
\newcommand{\dht}{\mbox{d.\,h.}\xspace}
\newcommand{\oae}{\mbox{o.\,ä.}\xspace}
\newcommand{\oBdA}{\mbox{o.\,B.\,d.\,A.}\xspace}
\newcommand{\idR}{\mbox{i.\,d.\,R.}\xspace}
\newcommand{\RWA}{RWA\xspace}
\newcommand{\horizline}{\rule{1.0\linewidth}{0.4pt}}

% % % % % % % % % % % % % % % % % % %
% Mathemodus

\newcommand{\const}{\ensuremath{\mathrm{const.}}}
\newcommand{\pointspace}{\ensuremath{\,}}				    % Abstand hinter Gleichungen
\newcommand{\pointspacek}{\ensuremath{\,\textrm{,}}}       	% dito mit Komma 
\newcommand{\pointspacep}{\ensuremath{\,\textrm{.}}}       	% dito mit Punkt


\newcommand{\upd}{\ensuremath{\mathrm{d}}}					% aufrechtes d
\renewcommand{\d}{\partial\mspace{2mu}} 					% partielle Ableitung (delta)
\newcommand{\intnach}[1]{\, \upd #1}						% Integration nach ...
\newcommand{\komplex}{\ensuremath{\mathrm{j}}}				% imaginäre Einheit
\newcommand{\euler}{\ensuremath{\mathrm{e}}}				% eulersche Zahl

\newcommand{\normal}[1][ ]{\ensuremath{^{n_\mathrm{#1}}}}						% Normalkomponente
\newcommand{\tangential}[1][ ]{\ensuremath{^{t_\mathrm{#1}}}}					% Tangetialkomponente

% mathematische Operatoren

\newcommand{\divergenz}{\ensuremath{\mathrm{div}\,}}
\newcommand{\rotation}{\ensuremath{\mathrm{rot}\,}}
\newcommand{\gradient}{\ensuremath{\mathrm{grad}\,}}
\newcommand{\laplace}{\ensuremath{\Updelta}}

\newcommand{\ehoch}[1]{\ensuremath{\exp \left( #1 \right)}}
\newcommand{\imaginaer}[1]{\ensuremath{\mathfrak{Im} \left\{ #1 \right\}}}
\newcommand{\real}[1]{\ensuremath{\mathfrak{Re} \left\{ #1 \right\}}}

\newcommand{\istgleich}{\ensuremath{\stackrel{!}{=}\,}}
\newcommand{\entspricht}{\ensuremath{\hat{=}\,}}

\newcommand{\mittelwert}[1]{\ensuremath{\left\langle #1 \right\rangle}}
\newcommand{\abs}[1]{\ensuremath{\left| #1 \right|}}

\newcommand{\durchvierpie}[1][1]{\ensuremath{\dfrac{ #1 }{4 \uppi\: \varepsilon_0}}}
\newcommand{\durchzweipie}[1][1]{\ensuremath{\dfrac{ #1 }{2 \uppi\: \varepsilon_0}}}

% mathematische Zahlenbereiche

\newcommand{\IN}{\ensuremath{\mathbb{N}}}			% natürliche Zahlen
\newcommand{\IZ}{\ensuremath{\mathbb{Z}}}			% ganze Zahlen
\newcommand{\IQ}{\ensuremath{\mathbb{Q}}}			% rationale Zahlen
\newcommand{\IR}{\ensuremath{\mathbb{R}}}			% reelle Zahlen
\newcommand{\IC}{\ensuremath{\mathbb{C}}}			% komplexe Zahlen


% Farbbeispiel
\newcommand{\farbbeispiel}[1]{\tikz \filldraw [fill=#1] (0ex,0ex) rectangle (4ex,1.5ex); #1}



% % % % % % % % % % % % % % % % % % %
%	Zeichen



\newcommand{\ergo}{ %		Runder Ergo-Pfeil
	\tikz[baseline]{
		\draw[-latex] (0,0.5ex) .. controls (0.3em,1.4ex) and (0.6em,1.4ex) .. (1.1em,0.5ex);}\;\xspace%
}


\newcommand{\circled}[1]{%	Einkreisen von Zeichen
	\tikz[baseline=(char.base)]{
		\node[shape=circle,draw,inner sep=1.5pt] (char) {#1};} %
}

\newcommand{\transformation}{\mbox{\setlength{\unitlength}{0.1em}%	Transformation, z.B. Laplace
		\begin{picture}(20,10)%
		\put(3,3){\circle{4}}%
		\put(4.9,3){\line(1,0){10.3}}%
		\put(17,3){\circle*{4}}%
		\end{picture}%
	}%
}
\newcommand{\retransformation}{\mbox{\setlength{\unitlength}{0.1em}%	Rücktransformation, z.B. Laplace
		\begin{picture}(20,10)%
		\put(3,3){\circle*{4}}%
		\put(4.8,3){\line(1,0){10.3}}%
		\put(17,3){\circle{4}}%
		\end{picture}%
	}%
}

\newlength{\variableeins}
\newlength{\variablezwei}
\newlength{\zwischenvariable}
\newcommand{\kartkoordinatensystem}[4][1]{
	\setlength{\variableeins}{1mm*#1}
	\setlength{\variablezwei}{-0.35355mm*#1}
	\begin{tikzpicture}[line width = 1.2pt, line join=round,x={(\variablezwei,\variablezwei)},y={(\variableeins, 0cm)},z={(0cm,\variableeins)},>=stealth]
	% x-Richtung
	\draw [->] (0,0,0) -- (2,0,0) node[anchor=north east] {$#2$};
	% y-Richtung
	\draw [->] (0,0,0) -- (0,2,0) node[anchor=west] {$#3$};
	% z-Richtung
	\draw [->] (0,0,0) -- (0,0,2) node[anchor=south] {$#4$};
\end{tikzpicture}}




% % % % % % % % % % % %
% Formelzeichen
\ProvideDocumentCommand\EFeld{o}{\qty{E}{#1}}
\ProvideDocumentCommand\DFeld{o}{\qty{D}{#1}}
\ProvideDocumentCommand\BFeld{o}{\qty{B}{#1}}
\ProvideDocumentCommand\HFeld{o}{\qty{H}{#1}}
\ProvideDocumentCommand\Ortsr{o}{\qty{r}{#1}}
\ProvideDocumentCommand\SkalarPot{o}{\qty{\phi}{#1}}
\ProvideDocumentCommand\VektorPot{o}{\qty{A}{#1}}
\ProvideDocumentCommand\StromDichte{o}{\qty{J}{#1}}
\ProvideDocumentCommand\PoyntingVektor{o}{\qty{S}{#1}}
\ProvideDocumentCommand\Magnetisierung{o}{\qty{M}{#1}}
\ProvideDocumentCommand\Strom{o}{\qty{I}{#1}}
\ProvideDocumentCommand\Spannung{o}{\qty{U}{#1}}
\ProvideDocumentCommand\Widerstand{o}{\qty{R}{#1}}
\ProvideDocumentCommand\Impedanz{o}{\qty{Z}{#1}}
\ProvideDocumentCommand\Leistung{o}{\qty{P}{#1}}
\ProvideDocumentCommand\Dipolmoment{o}{\qty{p}{#1}}
\ProvideDocumentCommand\Dipoldichte{o}{\qty{m}{#1}}
\ProvideDocumentCommand\Flaeche{o}{\qty{A}{#1}}
\ProvideDocumentCommand\SpezialFlaeche{o}{\qty{F}{#1}}
\ProvideDocumentCommand\Weg{o}{\qty{s}{#1}}
\ProvideDocumentCommand\Geschwindigkeit{o}{\qty{v}{#1}}
\ProvideDocumentCommand\Abstand{o}{\qty{R}{#1}}
\ProvideDocumentCommand\Wellenzahl{o}{\qty{k}{#1}}


% magnetischer Fluss
\newcommand{\magfluss}[2][2 = normal, 1=n!n, usedefault]{
								\IfStrEq{#2}{normal}{\IfStrEq{#1}{n!n}
								{\ensuremath{\Phi_\mathrm{m}}}		% ohne Index
								{\ensuremath{\Phi_\mathrm{m,#1}}}}				% zusätzlicher Index
								{\IfStrEq{#2}{dot}{\IfStrEq{#1}{n!n}
								{\ensuremath{\dot{\Phi}_\mathrm{m}}}		% ohne Index
								{\ensuremath{\dot{\Phi}_\mathrm{m,#1}}}}				% zusätzlicher Index
								{\errmessage{Option nicht bekannt}}}}
							
% magnetisches Potential
\newcommand{\magpotential}[1][normal]{\IfStrEq{#1}{normal}{\ensuremath{\phi_\mathrm{m}}}		% ohne Index
								{\ensuremath{\phi_\mathrm{m,#1}}}					% zusätzlicher Index
								}


% elektrische Ladungsdichte
\newcommand{\laddichte}[2][ ]{\IfStrEq{#2}{V}{\ensuremath{\rho_\mathrm{V#1}}}		% Volumendichte
							{\IfStrEq{#2}{uV}{\ensuremath{\underline{\rho}_\mathrm{V#1}}}	% komplexe Volumenladungsdichte
							{\IfStrEq{#2}{F}{\ensuremath{\rho_\mathrm{F#1}}}	% Flächendichte
							{\IfStrEq{#2}{L}{\ensuremath{\rho_\mathrm{L#1}}}	% Liniendichte
							{\ensuremath{\rho_{#1}}}}}}}					% Dichte allgemein


% magnetische Ladungsdichte
\newcommand{\magladdichte}[1][V]{\IfStrEq{#1}{V}{\ensuremath{\rho_\mathrm{m}}}	% Volumen (default)
								{\IfStrEq{#1}{F}{\ensuremath{\rho_\mathrm{m,f}}}	% Fläche
								{\ensuremath{\rho_\mathrm{m}}}}}	% Volumen (default)

% elektrischer Ladung
\newcommand{\ladung}{\ensuremath{Q}}

% partielle Ladung
\newcommand{\partladung}{\ensuremath{q}}

% Arbeit
\newcommand{\arbeit}{\ensuremath{\Updelta A}}


% Leistungsdichte
\newcommand{\leistungsdichte}[1]{\IfStrEq{#1}{V}{\ensuremath{p_\mathrm{V}}}		% Volumendichte
						{\IfStrEq{#1}{F}{\ensuremath{p_\mathrm{F}}}		% Flächendichte
						{\IfStrEq{#1}{L}{\ensuremath{p_\mathrm{L}}}		% Liniendichte
						{\ensuremath{p}}}}}					% Dichte allgemein
						
% Impulsdichte
\newcommand{\impulsdichte}{\ensuremath{\vec{p}_V}}	% Vektor							

% Energie
\newcommand{\energie}{\ensuremath{W}}

% Energiedichte
\newcommand{\energiedichte}{\ensuremath{w}}

% elektrostatische Energie
\newcommand{\elenergie}{\ensuremath{W_\mathrm{e}}}

% elektrostatische Energiedichte
\newcommand{\elergiedichte}{\ensuremath{w_\mathrm{e}}}

% Induktivität
\newcommand{\sinduk}[1][normal]{\IfStrEq{#1}{normal}{\ensuremath{L}}				% normal
								{\IfStrEq{#1}{s}{\ensuremath{L'}}				% gestrichen
								{\errmessage{Option nicht bekannt}}}}			% Fehler

% Gegeninduktivität
\newcommand{\gginduk}{\ensuremath{M}}

% Kraft
\newcommand{\kraft}[1][normal]{\IfStrEq{#1}{v}{\ensuremath{\vec{F}}}	% Vektor
							{\ensuremath{F}}}		% Allgemein

% Kraftdichte
\newcommand{\kraftdichte}[1][normal]{\IfStrEq{#1}{v}{\ensuremath{\vec{f}}}	% Vektor
								{\ensuremath{f}}}		% Allgemein

% Kraftdichte
\newcommand{\drehmoment}[1][normal]{\IfStrEq{#1}{v}{\ensuremath{\vec{M}}}	% Vektor
										{\ensuremath{M}}}		% Allgemein

% Masse
\newcommand{\masse}{\ensuremath{m}}

% Punkt
\newcommand{\punkt}{\ensuremath{P}}

% absolute Temperatur
\newcommand{\tempabs}{\ensuremath{T}}	

% Celsius Temperatur
\newcommand{\tempcel}{\ensuremath{\vartheta}}


% allgemeines Vektorfeld
\newcommand{\allgvektor}{\ensuremath{\vec{G}}}

% allgemeiner Skalar
\newcommand{\allgskalar}{\ensuremath{\xi}}

%Brechungsindex
\newcommand{\brechind}{\ensuremath{n}}

\newcommand{\rand}{\ensuremath{C}}

\newcommand{\oberfl}{O}

\newcommand{\volumen}{V}

% Integral nach
\newcommand{\intweg}[1][normal]{\ensuremath{\, \upd \Weg[#1]}}

\newcommand{\intflaeche}[1][normal]{\ensuremath{\, \upd \Flaeche[#1]}}

\newcommand{\intvolumen}{\ensuremath{\, \upd \volumen}}

% Normalenvektor
\newcommand{\normalenvektor}[1][v]{\IfStrEq{#1}{b}{\ensuremath{n}}
							{\ensuremath{\vec{n}}}}

% Tangentialvektor
\newcommand{\tangentialvektor}[1][v]{\IfStrEq{#1}{b}{\ensuremath{t}}
							{\ensuremath{\vec{t}}}}
% Tensor
\newcommand{\tensor}{\ensuremath{\tau}}

% Einheitsvektor
\newcommand{\einheitsvek}[1]{\ensuremath{\vec{e}_\mathrm{#1}}}

% % % % % % % % % % % % % % % % %
% Konstanten
% Lichtgeschwindigkeit
\newcommand{\lichtgeschw}[1][allgemein]{\IfStrEq{#1}{vak}{\ensuremath{c_0}}	% im Vakuum
										{\ensuremath{c}}}	% Allgemein

\newcommand{\elladug}{\ensuremath{q_\mathrm{e}}}


\DeclareDocumentCommand\vectorunit{ s m }{\IfBooleanTF{#1}{\boldsymbol{\vec{e}_{#2}}}{\vec{e}_{#2}}} % Unit vector [star for Greek and italic Roman]
\DeclareDocumentCommand\vu{}{\vectorunit} % Shorthand for \vectorunit

% % % % % % % % % % % % % % % % % % % %
% Farben
\definecolor{darkgreen}{rgb}{0,0.6,0}
\definecolor{darkbrown}{rgb}{0.5,0.2,0.1}


