\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2025/06/22 git cv template]

\LoadClass[a4paper,10pt]{article}

% ===== Packages ===== 

% Layout and Spacing
\RequirePackage[a4paper, margin=1.8cm]{geometry}
\RequirePackage{graphicx, enumitem, hyperref, titlesec, float, tikz}
\RequirePackage{pgfplots, pgfplotstable}
\RequirePackage{xparse}

% Font
\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault,light]{inter}
\renewcommand*\familydefault{\sfdefault}
\linespread{1.1}

% Section formatting
\newcommand{\sectionSpace}{0.6em}
\newcommand{\paragraphGap}{\noalign{\vskip 0.5em}}
\newcommand{\leftColumnWidth}{0.25\textwidth}
\newcommand{\rightColumnWidth}{0.725\textwidth}

\titleformat{\section}{\large\bfseries}{}{0em}{}
\titleformat{\subsection}{\normalsize\bfseries}{}{0em}{}
\titlespacing*{\section}{0pt}{\sectionSpace}{\sectionSpace}
\titlespacing*{\subsection}{0pt}{\sectionSpace}{\sectionSpace}

\pagestyle{empty} % remove page number
\setlength{\arrayrulewidth}{0.4pt}
% URL Style
\hypersetup{colorlinks=true, urlcolor=black}
\urlstyle{same}


% ===== Commands =====

\newcommand{\@location}{}
\newcommand{\@docDate}{\today}
\newcommand{\@docTitle}{Curriculum Vitae}

\newcommand{\setLocation}[1]{\def\@location{#1}}
\newcommand{\setDate}[1]{\def\@docDate{#1}}
\newcommand{\setTitle}[1]{\def\@docTitle{#1}}

% Section Blocks
\newcommand{\sectionStart}[1]{%
  \vspace{\sectionSpace}%
  \section*{#1}%
  \begin{tabular}{@{}p{\leftColumnWidth} p{\rightColumnWidth}@{}}%
}

\newcommand{\sectionEnd}{%
  \end{tabular}%
}

% Helper functions
\newcommand{\entry}[2]{#1 & \parbox[t]{\rightColumnWidth}{#2} \\}
\renewcommand{\item}[1]{- $\:$ & #1 \\}

% Paragraph with plain text
\newcommand{\entryParagraph}[4]{%
  #1 & \textbf{#2}%
  \ifstrempty{#3}{}{ - #3}\\
      & \parbox[t]{\rightColumnWidth}{#4}\\
  \paragraphGap
}

% Paragraph with bulletpoints
\newcommand{\entryList}[4]{%
  #1 & \textbf{#2}%
  \ifstrempty{#3}{}{ - #3}\\
     & \begin{tabular}[t]{@{}l@{\hspace{0.5em}}p{0.6\textwidth}@{}}#4\end{tabular}\\
  \paragraphGap
}

% Two paragraphs next to each other
\NewDocumentCommand{\splitParagraph}{O{0.40}mmmm}{%
  \vspace{\sectionSpace}
  \noindent
  \begin{minipage}[t]{#1\textwidth}
    \section*{#2}
    \begin{tabular}{@{}p{0.35\textwidth} p{0.63\textwidth}@{}}
      #4
    \end{tabular}
  \end{minipage}\hfill
  \begin{minipage}[t]{\dimexpr\textwidth - #1\textwidth\relax}
    \section*{#3}
    \begin{tabular}{@{}p{0.2\textwidth} p{0.755\textwidth}@{}}
      #5
    \end{tabular}
  \end{minipage}
}

% Picture
\newcommand{\addPhoto}[0]{%
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=north east, xshift=-1.8cm, yshift=-1.8cm]
      at (current page.north east)
      {\includegraphics[width=4.5cm]{picture.png}};
  \end{tikzpicture}
}

% Date
\newcommand{\addDate}[0]{%
  \begin{tikzpicture}[remember picture, overlay]
    \node[anchor=south east, xshift=-1.8cm, yshift=1.8cm]
      at (current page.south east)
      {\ifstrempty{\@location}{\@docDate}{\@location, \@docDate}};
  \end{tikzpicture}
}

% Default Header
\AtBeginDocument{%
  \noindent
  {\Large \textbf{\@docTitle}}%
}