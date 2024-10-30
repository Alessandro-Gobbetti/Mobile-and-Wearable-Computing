\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usireport}


\LoadClass[a4paper,tikz,10pt,fleqn]{article}


\setlength{\parskip}{0.5\baselineskip}%
\usepackage[utf8]{inputenc}
\usepackage[margin=1in]{geometry}
\usepackage[titletoc,title]{appendix}
\usepackage{latexsym}
\usepackage{amssymb}
\usepackage{gensymb}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage[dvipsnames]{xcolor}
\usepackage{multicol}
\usepackage{graphicx}
\usepackage{fancyhdr}
\usepackage[linguistics]{forest}
\usepackage{colortbl}
\usepackage{pdfpages}
\usepackage{wrapfig}
\usepackage{cancel}
\usepackage{multirow}
\usepackage[export]{adjustbox}



% \makeatletter
% \newcommand{\currentfontsize}{\fontsize{\f@size}{\f@baselineskip}\selectfont}
% \makeatother

\usepackage{minted}
\definecolor{LightGray}{gray}{0.95}
\setminted{
    frame=lines,
    framesep=2mm,
    baselinestretch=1.2,
    bgcolor=LightGray,
    fontsize=\fontsize{8.5}{8.5}\selectfont,
    linenos,
    mathescape=true,
    % escapeinside=||,
}
% \setmintedinline{
%     fontsize=\fontsize{8.5}{8.5}\selectfont,
% }

\definecolor{darkblue}{rgb}{0.0, 0.0, 1}
\usepackage[pdftex,hyperfigures,hyperindex,bookmarksnumbered,colorlinks, bookmarks, breaklinks, linktocpage,citecolor=darkblue,urlcolor=darkblue,linkcolor=darkblue,pagebackref=true,linktoc=all]{hyperref}
\usepackage{cleveref}

% to fixme
\usepackage{xcolor} 
\definecolor{FIXMECOLOR}{rgb}{1,0,0}
\newcommand{\FIXME}[1]{{\color{FIXMECOLOR}{\textbf{FIXME: #1}}}} 

% to simplify math 

\newcommand{\bvec}[1]{
   \ensuremath{
   \begin{bmatrix}
       #1 \\
   \end{bmatrix}
}}

\newcommand{\bmat}[1]{
   \ensuremath{
   \begin{bmatrix}
       #1
   \end{bmatrix}
}}

\newcommand{\dotprod}[2]{\ensuremath{\left< #1, #2 \right>}}

%% For plotting
\usepackage{pgfplots}
\pgfplotsset{width=10cm,compat=1.9}
\usepgfplotslibrary{external}
\tikzexternalize
%%
\usepackage{dirtree}
\usepackage{subcaption}
\usepackage{xifthen}% provides \isempty test
\usepackage{glossaries}

\captionsetup[subfigure]{labelformat=empty}
\definecolor{color1}{HTML}{0B0C10}
\definecolor{color2}{HTML}{1F2833}
\definecolor{color3}{HTML}{C5C6C7}
\definecolor{color4}{HTML}{66FCF1}
\definecolor{color5}{HTML}{45A29E}

\pagestyle{fancy}   
\fancyhf{}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% VARIABLES
% \newcommand\namesurname{Alessandro Gobbetti}
% \newcommand\assignment{Assignment 1}
% \newcommand\assignmenttitle{}

% \newcommand\subject{Computational Fabrication}
% today's date
\newcommand\documentdate{\today}

% Title content
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\rhead{\assignment}
\lhead{\namesurname}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\rfoot{Page \thepage}
\setlength{\parindent}{0pt}

\newcommand\xdownarrow[1][2ex]{%
   \mathrel{\rotatebox{90}{$\xleftarrow{\rule{#1}{0pt}}$}}
}

\usepackage{etoolbox}

\def\mymacroA{}
\def\mymacroB{ }
\def\mymacroC{E}
\def\mymacroD{ E }


% define titlepage
\newcommand\maketitlepage{
    \begin{titlepage}
        \begin{center}
            \vspace*{1cm}
    
            \textbf{\Huge{\assignment{}\ifdefempty{\assignmenttitle}{}{: \assignmenttitle}}}\\[5mm]

            \textbf{\LARGE\subject}\\[3mm]
            % \assignment
    
    
            % \vspace{1.8cm}
    
            \Large\namesurname

            \normalsize\documentdate
            \vspace{1.8cm}
    
            { \hypersetup{hidelinks} \tableofcontents }
            \vspace*{\fill}
    
            \includegraphics[width=0.4\textwidth]{fig/logo}
    
            % \documentdate \\
            % Università della Svizzera italiana\\
            % Faculty of Informatics\\
            % Switzerland\\
    
        \end{center}
    \end{titlepage}
    
}

\newcommand\toc{
    \newpage
    { \hypersetup{hidelinks} \tableofcontents }
    \newpage
}
