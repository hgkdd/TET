\def\my@real@class{tudbeamer}

% Copied from the TeX FAQ entry 'comparing the ``jobname'''.

\def\be@mertypeis#1{FF\fi
	\edef\my@predicate{#1}%
	\edef\my@predicate{\expandafter\strip@prefix\meaning\my@predicate}%
	\edef\my@job{\be@mertype}%
	\ifx\be@mertype\my@predicate
}

\def\be@mertwo#1.#2\relax{#2}
\def\be@merone#1.#2\relax{#1}

% Find out how many components jobname has.  Format is
% name[.type[.date]] where name has not dots, type is the type of
% output (default ``beamer'') and date is the date of the lecture to
% be produced, in ISO format of YYYYMMDD.

\let\be@merdate\@empty

\edef\be@mertest{\expandafter\be@merone\jobname.j\relax}
\edef\my@jobname{\jobname}

\ifx\be@mertest\my@jobname

% Only one component

\def\be@mertype{beamer}
\def\be@merfile{\jobname}
\else
\edef\be@mertest{\expandafter\be@merone\jobname\relax.\expandafter\expandafter\expandafter\be@merone\expandafter\be@mertwo\jobname.j\relax\relax}

\ifx\be@mertest\my@jobname

% Only two components

\edef\be@mertype{\expandafter\be@mertwo\jobname\relax}
\edef\be@merfile{\expandafter\be@merone\jobname\relax}
\else

% Three components

\edef\be@merdate{\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\expandafter\be@merone\expandafter\expandafter\expandafter\be@mertwo\expandafter\be@mertwo\jobname\relax\relax.j\relax}
\edef\be@mertype{\expandafter\expandafter\expandafter\be@merone\expandafter\be@mertwo\jobname\relax\relax}
\edef\be@merfile{\expandafter\be@merone\jobname\relax}

\g@addto@macro{\my@afterpackages}{%
	\expandafter\includeonlylecture\expandafter{\be@merdate}
	
}

\fi
\fi

\edef\be@merdefopts{german,notoc,nopartframe,nosectionframe,noframetitlesectionnum,aspectratio=43,titlestyle=tud}

\if\be@mertypeis{article}
\def\my@real@class{article}
\PassOptionsToPackage{envcountsect}{beamerarticle}
\PassOptionsToClass{a4paper,10pt}
\fi

\if\be@mertypeis{handout}
\PassOptionsToClass{handout,german,notoc,nopartframe,nosectionframe,noframetitlesectionnum,aspectratio=43,titlestyle=tud}{tudbeamer}
\fi

\if\be@mertypeis{trans}
\PassOptionsToClass{trans,german,notoc,nopartframe,nosectionframe,noframetitlesectionnum,aspectratio=43,titlestyle=tud}{tudbeamer}
\fi

\if\be@mertypeis{beamer}
\PassOptionsToClass{beamer,german,notoc,nopartframe,nosectionframe,noframetitlesectionnum,aspectratio=43,titlestyle=tud}{tudbeamer}
\fi

\LoadClass{\my@real@class}
\if\be@mertypeis{article}
\RequirePackage[envcountsect]{beamerarticle}
\setjobnamebeamerversion{\be@merfile.beamer}
\fi
