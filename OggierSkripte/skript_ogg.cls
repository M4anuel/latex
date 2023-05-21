%%
%% This is file `skript_ogg.cls',
%% generated  and written by Theo Oggier.

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{skript_ogg}[2019/08/27 v0.1 LaTeX document class]
\DeclareOption{10pt}{\def\@schrift{0}}
\DeclareOption{11pt}{\def\@schrift{1}}
\DeclareOption{12pt}{\def\@schrift{2}}
\DeclareOption{deu}{\def\@sprache{0}}
\DeclareOption{eng}{\def\@sprache{1}}

\ExecuteOptions{11pt} \ProcessOptions

\LoadClass[1\@schrift pt,		% Schriftgrösse
		twoside,          			% zweiseitiges Dokument
		titlepage,        			% es wird eine Titelseite verwendet
		parskip=half,     			% Abstand zwischen Absätzen (halbe Zeile)
    index=totoc       			% Index im Inhaltsverzeichnis aufführen
]{scrartcl}[1997/04/16]
\ifnum\@sprache=0
	\RequirePackage[ngerman]{babel}									% Deutsche Überschriften
\fi
\RequirePackage[ansinew]{inputenc}								% Dokumentcodierung
\RequirePackage{lmodern}													% bessere Fonts
\RequirePackage[pdftex]{graphicx}									% Bilder einbinden
\RequirePackage{url}															% url's darstellen
\RequirePackage{amsmath,amssymb,amsthm,amsfonts}	% mathematische Symbole
\RequirePackage{rotating}													% Objekte drehen
\RequirePackage{cancel,wasysym}										% Durchstreichen, Symbole
\RequirePackage[framemethod=tikz]{mdframed}				% Rahmenumgebungen (Theoreme, Definitionen)
\RequirePackage{ifthen}														% Für Lückentext
\RequirePackage{subfigure}												% mehrere Teilbilder in der figure-Umgebung
\RequirePackage{pgf,tikz}													% Tikz Bilder
\usetikzlibrary{arrows}
\usetikzlibrary{shadows}
\RequirePackage{setspace}													% Einfache Definition der Zeilenabstände und Seitenränder etc.
\RequirePackage{geometry}
\RequirePackage[
automark,                         % Kapitelangaben in Kopfzeile automatisch erstellen
headsepline,                      % Trennlinie unter Kopfzeile
ilines                            % Trennlinie linksbündig ausrichten
]{scrlayer-scrpage}
\RequirePackage{multirow}                 % mehrere Zeilen in Tabelle
\RequirePackage{enumerate}                % Labels ändern
\RequirePackage{calc}                     % Berechnungen

\ifnum\@sprache=0
	\def\@satz{Satz}
	\def\@bemerkung{Bemerkung:}
	\def\@proof{Beweis:}
	\def\@beispiel{Beispiel:}
	\def\@aufgaben{Aufgaben.}
	\def\@uebung{\"Ubung.}
\else
	\def\@satz{Theorem}
	\def\@bemerkung{Remark:}
	\def\@proof{Proof:}
	\def\@beispiel{Example:}
	\def\@aufgaben{Exercises.}
	\def\@uebung{Problem.}
\fi

\relax



% Seitenstil ----------------------------------------------------------
\setlength{\parindent}{0em}           % Einrückung erste Zeile aufheben
%\renewcommand{\familydefault}{\sfdefault} % Falls sans-serif Schriften verwendet werden sollen
%\onehalfspacing                      % Zeilenabstand 1,5 Zeilen
\setlength{\topskip}{\ht\strutbox}    % behebt Warnung von geometry
\geometry{paper=a4paper,left=20mm,right=20mm,top=25mm,height=228mm} % Seitenränder

% Kopf- und Fusszeilen ----------------------------------------------------------
\pagestyle{scrheadings}              % Schriftform der Kopfzeile
\renewcommand{\headfont}{\normalfont}% Kopfzeile

\ihead{\large{\textsc{GYM\StufesName}}\\ \small{\ThemenName}\\[2ex] \textit{\leftmark}}
\chead{}
\ohead{\includegraphics[width=4cm]{SkriptLogo.jpg}\\ $\mbox{ }$\\ $\mbox{ }$}

\setlength{\headheight}{20mm}        % Höhe der Kopfzeile
% Kopfzeile über den Text hinaus verbreitern
\setheadwidth[0pt]{text}
%\setheadwidth[0pt]{textwithmarginpar}
\KOMAoptions{												% Trennlinie unter Kopfzeile
   headsepline = true,
}

% Fusszeile
\ifoot{}
\cfoot{}
\ofoot{\pagemark}

% Mathematische Dinge
%--------------------------------------------------------

\mdfdefinestyle{defstyle}{
linecolor=blue,
frametitlerule=true,
frametitlebackgroundcolor=blue!20,}
\mdtheorem[style=defstyle]{defn}{Definition}[section]

\newtheoremstyle{bfnote}
{\topsep}   % ABOVESPACE
{\topsep}   % BELOWSPACE
{\itshape}  % BODYFONT
{0pt}       % INDENT (empty value is the same as 0pt)
{\bfseries} % HEADFONT
{.}         % HEADPUNCT
{5pt plus 1pt minus 1pt} % HEADSPACE
{\thmname{#1}\thmnumber{ #2}\thmnote{ (#3)}} % CUSTOM-HEAD-SPEC

\theoremstyle{bfnote}
\newmdtheoremenv[               %
linecolor=red                  ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
innertopmargin = 0.3em         ,%
splittopskip = 0               ,%
]{satz}{\@satz}[section]

\newmdenv[                      %
linecolor=red                  ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
%frametitle=leer               ,%
%backgroundcolor=red!20        ,%
]{wichtig}

\newmdenv[                      %
linecolor=black                ,%
linewidth = 1                  ,%
roundcorner = 10pt             ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
frametitle=\@bemerkung         ,%
%backgroundcolor=red!20        ,%
]{bemerkung}

\newmdenv[                      %
linecolor=olive                ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
frametitle=\@proof             ,%
%backgroundcolor=red!20        ,%
]{beweis}

\newmdenv[                      %
linecolor=black                ,%
linewidth = 1                  ,%
%roundcorner = 10pt            ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
frametitle=\@beispiel          ,%
frametitlebelowskip = 0        ,%
splittopskip = 0               ,%
%backgroundcolor=yellow!40     ,%
topline=false                  ,%
bottomline=false
]{beispiel}

\newmdenv[                      %
linecolor=blue                 ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin = 0                ,%
%frametitle=leer               ,%
%backgroundcolor=blue!20       ,%
]{vocab}

\newmdenv[                      %
linecolor=black                ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
shadow=true                    ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin =  0               ,%
frametitle=\@aufgaben          ,%
]{aufgaben}

\newmdenv[                      %
linecolor=black                ,%
linewidth = 2                  ,%
roundcorner = 10pt             ,%
%shadow=true                   ,%
leftmargin = 0                 ,%
rightmargin =  0               ,%
frametitle=\@uebung            ,%
]{uebung}

\newcommand{\N}{\mathbb{N}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\ffrac}[2]{\frac{\displaystyle #1}{\displaystyle #2}}
\renewcommand{\deg}{\ensuremath{^{\circ}}}
\renewcommand{\Re}{\mathrm{Re}}
\renewcommand{\Im}{\mathrm{Im}}
\newcommand{\cis}{\mathrm{cis\,}}

% Gitter für Beweise
\definecolor{cqcqcq}{rgb}{0.75,0.75,0.75}
\newcommand{\prooof}[1]{\textbf{\@proof}\newline
\begin{tikzpicture}[x=1.0cm,y=1.0cm]
\draw [color=cqcqcq,, xstep=0.5cm,ystep=0.5cm] (0,0) grid (17,#1);
\clip(0,0) rectangle (17,#1);
\end{tikzpicture}}


\def\stufe#1{\renewcommand{\StufesName}{#1}}
\def\thema#1{\renewcommand{\ThemenName}{#1}}




	
\def\StufesName{}
\def\ThemenName{$\mbox{ }$}


\typeout{Document class 'skript_ogg' for scripts 01.09.2019}

