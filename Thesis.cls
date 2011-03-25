\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{Thesis}
  [2002/05/16 Master's and Ph.D thesis format]

\RequirePackage[french, english]{babel}


% == M.Sc. Thesis options ======================================================

\DeclareOption{MSc}{\AtEndOfClass{\RequirePackage{MSc}}}


% == Ph.D. Thesis options ======================================================

\DeclareOption{PhD}{\AtEndOfClass{\RequirePackage{PhD}}}


% == Other Global Options ======================================================

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ExecuteOptions{} % no default options
\ProcessOptions

\LoadClass[12pt,twoside]{report} %10-12 characters per inch => 12pt


% -- Page Layout ---------------------------------------------------------------

% 1" margins except on the binding edge, where it is 1 1/2"
 \setlength{\topmargin}{0in}       % top   = 1" + \voffset [default 0]
% \setlength{\oddsidemargin}{0.5in} % left  = 1" + \hoffset [default 0] + 0.5"
% \setlength{\evensidemargin}{0in}  % right = 8.5" - (1" + \hoffset) -
% \textwidth
 \setlength{\textwidth}{6in}
 \setlength{\textheight}{8in}
% 
 \setlength{\marginparsep}{10pt}
 \setlength{\marginparwidth}{50pt}
 \setlength{\headheight}{15pt}

\setlength{\evensidemargin}{\paperwidth}

\addtolength{\evensidemargin}{-\textwidth}
\addtolength{\evensidemargin}{-2.0in}
\addtolength{\evensidemargin}{-\oddsidemargin} 

% -- Global Settings -----------------------------------------------------------

% Disallow page breaks at hyphens (this will give some underfull vbox's,
% so an alternative is to use \brokenpenalty=100 and manually search
% for and fix such page breaks)
\brokenpenalty=10000

% Use 1.3 times the normal baseline-to-baseline skip
\renewcommand{\baselinestretch}{1.2}

% Format footnotes as single space
\newcommand{\footnotespacing}%
{
  \let\CS=\@currsize\renewcommand{\baselinestretch}{1}\small\CS
}
\renewcommand{\@makefntext}[1]%
{
  \footnotespacing
  \makebox[1.8em][r]{\@makefnmark}#1
}

% Figures and tables are to be numbered sequentially throughout the
% thesis, rather than within chapters; for style consistency, do
% equations the same.  The following \def of \cl@chapter is a kludge:
% really there should be a \removefromreset, to stop figure numbers, etc.,
% from being reset at chapter beginnings
\def\cl@chapter{\@elt{section}\@elt{footnote}\@elt{figure}\@elt{table}\@elt{equation}}


% == Common Commands/Environments ==============================================

\newcommand{\@CopyrightMessage}{Copyright \copyright\ \the\year\ by \@author}
\newcommand{\CopyrightMessage}[1]{\renewcommand{\@CopyrightMessage}{#1}}

\newcommand{\@SubmitDate}{\the\month \the\year}
\newcommand{\SubmitDate}[1]{\renewcommand{\@SubmitDate}{#1}}

\newcommand{\Department}[1]{\def\@Department{#1}}

\newcommand{\Institution}[1]{\def\@Institution{#1}}

\newcommand{\Location}[1]{\def\@Location{#1}}

\newcommand{\PartTitleFont}{\Huge \sffamily \bfseries}
\newcommand{\ChapterTitleFont}{\LARGE \sffamily \bfseries}
\newcommand{\SectionTitleFont}{\Large \sffamily \bfseries}
\newcommand{\SubSectionTitleFont}{\large \sffamily \bfseries}
\newcommand{\SubSubSectionTitleFont}{\sffamily \bfseries}
\newcommand{\ParagraphTitleFont}{\large \sffamily \bfseries}
\newcommand{\SubParagraphTitleFont}{\sffamily \bfseries}

\renewcommand{\part}
{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{empty}%
  \null\vfil
  \secdef \Part \sPart
}
\newcommand{\Part}[2][?]
{
  \refstepcounter{part}
  \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}
  \markboth{}{}
  {
    \centering \normalfont
    \interlinepenalty \@M
    {\bfseries \Huge \partname \nobreakspace \thepart \par}
    \vskip 20\p@
    \PartTitleFont #2 \par
  }
  \EndPart
}
\newcommand{\sPart}[1]
{
  {
    \centering \normalfont \PartTitleFont
    \interlinepenalty \@M
    #1 \par
  }
  \EndPart
}
\newcommand{\EndPart}
{
  \vfil\newpage
  \if@twoside
    \if@openright
      \null
      \thispagestyle{empty}
      \newpage
    \fi
  \fi
}

\newcommand{\PrefaceChapter}[2][?]
{
  \typeout{#1}
  \addcontentsline{toc}{chapter}{\protect#1}
  \markboth{#1}{}
  \MakePrefaceHead{#2}
}
\newcommand{\sPrefaceChapter}[1]
{
  \PrefaceChapter[#1]{#1}
}
\newcommand{\MakePrefaceHead}[1]
{
  \vspace*{50\p@}
  {
    \centering \normalfont \ChapterTitleFont
    \interlinepenalty \@M
    #1 \par \nobreak
    \vskip 40\p@
  }
}

\renewcommand{\chapter}
{
  \StartChapter
  \secdef \Chapter \sChapter
}
\newcommand{\StartChapter}
{
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}
}
\newcommand{\Chapter}[2][?]
{
  \refstepcounter{chapter}
  \typeout{\chaptername \thechapter.}
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
  \markboth{#1}{}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \MakeChapterHead{#2}
}
\newcommand{\MakeChapterHead}[1]
{
\selectlanguage{english} %%%% MAJA edit
  \vspace*{40\p@}
  {
    {
      \flushright \normalfont \ChapterTitleFont
      \interlinepenalty\@M
      \chaptername \nobreakspace \thechapter \par
      #1 \par
      \hrulefill \par
    }
    \vskip 40\p@
  }
}
%%%%%%% New Maja Commands to make Appendix say Appendix A instead of Chapter A
\newcommand{\MakeAppChapterHead}[1]
{
\selectlanguage{english} %%%% MAJA edit
  \vspace*{40\p@}
  {
    {
      \flushright \normalfont \ChapterTitleFont
      \interlinepenalty\@M
      Appendix \nobreakspace \thechapter \par
      #1 \par
      \hrulefill \par
    }
    \vskip 40\p@
  }
}
\newcommand{\ChapterApp}[2][?]
{
  \refstepcounter{chapter}
  \typeout{\chaptername \thechapter.}
  \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
  \markboth{#1}{}
  \addtocontents{lof}{\protect\addvspace{10\p@}}
  \addtocontents{lot}{\protect\addvspace{10\p@}}
  \MakeAppChapterHead{#2}
}
%%%%%%%% End Maja COmmands
\newcommand{\sChapter}[1]
{
  \MakesChapterHead{#1}
}
\newcommand{\MakesChapterHead}[1]
{
  \vspace*{40\p@}
  {
    {
      \flushright \normalfont \ChapterTitleFont
      \interlinepenalty\@M
      #1 \par
      \hrulefill \par
    }
    \vskip 40\p@
  }
}

\newcommand{\Appendix}[2][?]
{
  \ChapterApp[#1]{#2}
}
\newcommand{\sAppendix}[1]
{
  \typeout{#1}
  \addcontentsline{toc}{chapter}{\protect#1}
  \markboth{#1}{}
  \MakesChapterHead{#1}
}

\newenvironment{Preface}
{
  \pagenumbering{roman}
  \pagestyle{plain}
  \renewcommand{\chapter}
  {
    \StartChapter
    \secdef \PrefaceChapter \sPrefaceChapter
  }
}
{
  \clearpage
  \pagenumbering{arabic}
}

\newenvironment{Abstract}
{
 \selectlanguage{english}
  \chapter*{\abstractname}
}
{}
\newenvironment{Resume}
{
  \selectlanguage{french}
  \chapter*{\abstractname}
}
{}

\renewcommand{\appendix}
{
  % reset chapter commands
  \renewcommand{\chapter}
  {
    \StartChapter
    \secdef \Appendix \sAppendix
  }

  \setcounter{chapter}{0}
  \renewcommand{\thechapter}{\Alph{chapter}}
  \renewcommand{\chaptername}{\appendixname}
}

\renewcommand{\section}{\@startsection {section}{1}{\z@}%
             {-3.5ex \@plus -1ex \@minus -.2ex}%
             {2.3ex \@plus.2ex}%
             {\SectionTitleFont}}

\renewcommand{\subsection}{\@startsection{subsection}{2}{\z@}%
             {-3.25ex\@plus -1ex \@minus -.2ex}%
             {1.5ex \@plus .2ex}%
             {\SubSectionTitleFont}}

\renewcommand{\subsubsection}{\@startsection{subsubsection}{3}{\z@}%
             {-3.25ex\@plus -1ex \@minus -.2ex}%
             {1.5ex \@plus .2ex}%
             {\SubSubSectionTitleFont}}

\renewcommand{\paragraph}{\@startsection{paragraph}{4}{\z@}%
             {3.25ex \@plus1ex \@minus.2ex}%
             {-1em}%
             {\ParagraphTitleFont}}

\renewcommand{\subparagraph}{\@startsection{subparagraph}{5}{\parindent}%
             {3.25ex \@plus1ex \@minus .2ex}%
             {-1em}%
             {\SubParagraphTitleFont}}
