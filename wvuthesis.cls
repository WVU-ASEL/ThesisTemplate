%
% LaTeX format for theses at WVU
% Based on 'Formatting ETDs', 'Submission Information Packet for 
% Dissertations and Theses', and 'mitthesis.cls'.
%
%
%%% Document Options:
% The following options are available
%   10-12pt -  specifies the font size for the document
%
% %%%%%%% The following two options may not work. %%%%%%%%%%
% I haven't tested the following two.  They may be broken by
% use of the geometry package.
%   twoside - specifies that the document is to be generated 
%             for printing on both sides of the page
%   oneside - specifies that the document is to be generated
%             for printing on one side of the page
%
% %%%%%%%%%%%% Back to working options %%%%%%%%%%%%%%%%%%%%
%   times - use times new roman as the document font
%   arial - use arial as the document font
%   

%%% Parameters to initialize for frontmatter page:
%
%	\title{Return of the King}  %The title of the work
% 	\author{J. R. R. Tolkien}  %The author of the work
%   \submissiontype{Thesis} %The type of the submission (Thesis or Dissertation)
%   \collegename{Benjamin M. Statler College of Engineering And Mineral Resources} %The name of your college within WVU
% 	\department{Mechanincal and Aerospace Engineering}  %The name of the department conferring the degree
% 	\degreetype{Master of Science}  %The type of degree (MS or Ph.D. spelled out)
%   \degreediscipline{Aerospace Engineering}  %The discipline you are receiveing the degree in 
%   \dateyear{2016}  %The year of the document
%   \keywords{Covariance, Eigenvalues, Eigenvectors, Parameter Estimation}  %Keywords pertaining to the information in the document
% 	\copyrightholder{Andrew J. Liounis}  %Usually this is just your name unless you are giving copyright permission to the university
% 	\chair{John A. Christian}{Ph.D.}  %The chair of your defense board.  Usually your advisor.  Note their degree level
%% List each committee member individually.  Be sure to include degree.
%   \committee{Jason Gross}{Ph.D.}  %the committee members and their degree level
%   \committee{Alfred Lynam}{Ph.D.}
%
%
% To create your title page simply put \maketitle at the beginning of 
% your document.  Do not enclose this in a titlepage environment as
% I have not messed with that environment so it is likely to mess
% up the results.
%
%% The abstractpage environment sets up everything on the page except
%% the text itself.  The title and other header material are put at the
%% top of the page.  
%% A new page is begun both before and after.  Of course, an abstract may
%% be more than one page itself.  
% 	\begin{abstractpage}
%	    Abstract goes here.
%	\end{abstractpage}
%
%% The dedication page (if used) should follow the abstract page.  
%% You can use the dedication environment to create a dedication
%% page
%   \begin{dedication}
%       Dedication begins here
%   \end{dedication}
%
%% The acknowledgements page should follow the abstract page.
%% you can use the acknowledgements environment to create an
%% acknowledgements page
%   \begin{Acknowledgements}
%       Acknowledgements begin here
%   \end{Acknowledgements}
%
%% The acronyms and nomenclature tables have been turned into environments 
%% That are just wrappers around the basic tabular environment and set up
%% the tabular environment with the proper columns and sizes
%% The nomenclature environment includes 3 columns, the first for the
%% nomenclature, the second for the units, and the third for the 
%% description.  It also contains a header row
%% The acronyms environment has two columns, one for the acronym 
%% and one for the description.
%   \begin{acronyms}
%       ASEL & Applied Space Exploration Laboratory \\
%       NASA & National Acronym Slinging Society \\
%   \end{acronyms}
%
%   \begin{nomenclature}
%       $\textbf{x}$ && Lowercase bold indicates a column vector. \\
%       $\textbf{r}$ &\textit{km}& The spacecraft position vector. \\
%   \end{nomenclature}
%
%% This concludes the environments defined in this class. To input
%% A TOC, LOF, or LOT use the standard LaTeX commands as these have not 
%% been editted.  For the rest of the setup see the example .tex document
%% that is included.
%
% WVU version
%   Copyright (c) 2016 by Andrew Liounis
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that 
% the copyright notice and this notice are retained.
%
% Original MIT version
%	 Copyright (c) 1987 by Stephen Gildea
% Permission to copy all or part of this work is granted, provided
% that the copies are not made or distributed for resale, and that
% the copyright notice and this notice are retained.
% 
% THIS WORK IS PROVIDED ON AN "AS IS" BASIS.  THE AUTHOR PROVIDES NO
% WARRANTY WHATSOEVER, EITHER EXPRESS OR IMPLIED, REGARDING THE WORK,
% INCLUDING WARRANTIES WITH RESPECT TO ITS MERCHANTABILITY OR FITNESS
% FOR ANY PARTICULAR PURPOSE.
%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{wvuthesis}[2016/01/29 WVU Thesis]

%% report options
% Font Sizes
\DeclareOption{10pt}{
    \PassOptionsToClass{\CurrentOption}{report}
}
\DeclareOption{11pt}{
    \PassOptionsToClass{\CurrentOption}{report}
}   
\DeclareOption{12pt}{
    \PassOptionsToClass{\CurrentOption}{report}
}
%1/2 sided options
\DeclareOption{twoside}{
    \PassOptionsToClass{\CurrentOption}{report}
}
\DeclareOption{oneside}{
    \PassOptionsToClass{\CurrentOption}{report}
}

%% WVU options
% spacing options
\DeclareOption{single}{
    \PassOptionsToPackage{singlespacing}{setspace}
}
\DeclareOption{onehalf}{
    \PassOptionsToPackage{onehalfspacing}{setspace}
}
\DeclareOption{double}{
    \PassOptionsToPackage{doublespacing}{setspace}
}
% Font options
\DeclareOption{times}{
    \def\@fontseries{times}
}
\DeclareOption{arial}{
    \def\@fontseries{uarial}
}
%Hyperlink options
\DeclareOption{colorlinks}{
    %setup the hyperlinks to look nice
    \PassOptionsToPackage{
        colorlinks,
        linkcolor={red!50!black},
        citecolor={blue!50!black},
        urlcolor={blue!80!black}
    }{hyperref}
}
\DeclareOption{highlightlinks}{
    %Do nothing since this is the default for hyperref
}
    
%% Fallback -- pass everything else to report
\DeclareOption*{
    %\ClassWarning{wvuthesis}{Unknown option '\CurrentOption'}
    \PassOptionsToClass{\CurrentOption}{report}
}

%% Create Default Options
\ExecuteOptions{10pt,oneside,onehalf,arial,colorlinks}

%% Process given options and end options stage of class
\ProcessOptions\relax

%% Load the report class as the base
\LoadClass{report}

%% Additional packages
% this is to set the spacing of the document
\RequirePackage{setspace}
\RequirePackage{geometry}
% set the font for the document
\RequirePackage{\@fontseries}
% use to adjust the justification
\RequirePackage{ragged2e}
% use to provide advanced options for tabular
\RequirePackage{array}
%Use to adjust hyperlinking
\RequirePackage{hyperref}
%Use to get colors for hyperref
\RequirePackage{xcolor}


%%%%%%%  Set up margins and formatting params %%%

\geometry{
    letterpaper,
    left=1.5in,
    right=1in,
    top=1in,
    bottom=1in,
}
%%%%%%%  End of margins and formatting params %%%

%%%%%%%  Prepare the title page %%%%%%%%%%%%%%%%%

%% Define all the pieces that go on the title page and the abstract.

% \title and \author already exist

%create variable to store submission type (Thesis or Dissertation
\def\submissiontype#1{\gdef\@submissiontype{#1}}
\def\@submissiontype{}

\def\collegename#1{\gdef\@collegename{#1}}
\def\@collegename{}

\def\department#1{\gdef\@department{#1}}
\def\@department{}

\def\degreetype#1{\gdef\@degreetype{#1}}
\def\@degreetype{}

\def\degreediscipline#1{\gdef\@degreediscipline{#1}}
\def\@degreedicipline{}

\def\dateyear#1{\gdef\@dateyear{#1}}
\def\@dateyear{}

\def\keywords#1{\gdef\@keywords{#1}}
\def\@keywords{}

\def\copyrightholder#1{\gdef\@copyrightholder{#1}}
\def\@copyrightholder{}

\def\chair#1#2{\gdef\@chairname{#1}\gdef\@chairdegree{#2}}
\def\@chairname{}\def\@chairdegree{}

% We need to allow for multiple calls to committee
% Therefore start building the committee section of the title page

\newcommand\committeemembers{}% This will store committee members
\newcommand\committee[2]{% Add another committee member to the list
  \g@addto@macro\committeemembers{\nextcommitteemember #1, #2}%
}
\newcommand{\nextcommitteemember}{}% Just a placeholder
\newcommand{\printcommittee}[1][c]{{% Print the list of committee members
  % http://tex.stackexchange.com/a/89187/5764
  \renewcommand{\nextcommitteemember}{\gdef\nextcommitteemember{\tabularnewline}}%
  \bfseries% Committee member formatting
  \begin{tabular}{#1}
    \committeemembers
  \end{tabular}
}}


% define environments and commands for the frontmatter

\def\maketitle{
    \clearpage 
    \pagenumbering{roman}
    \thispagestyle{empty}
    \begin{singlespace}
        \begin{center}
            %set the default font style to bold face for the title page
            \bfseries
            \vfill
            \huge \expandafter\MakeUppercase\expandafter{\@title}\\
            \vspace{15 mm}
            \Large \@author\\%
            \vspace{15 mm}
            \normalsize
            Thesis submitted to the\\%
            \@collegename \\%
            {at West Virginia University \\%
             [\medskipamount]}
            {in partial fullfillment of the requirements for the degree of \\%
             [\medskipamount]}
            {\@degreetype \\ %
            in \\ %
            \@degreediscipline}
            \vfill
            \@chairname, Chair \@chairdegree\\%
            {\printcommittee\\%
             [\medskipamount]}
            {Department of }\@department \\%
            \vfill
            Morgantown, West Virginia \\%
            \@dateyear \\%
            \vfill
            {Keywords: \@keywords \\%
            [\bigskipamount] }
            Copyright \copyright \, \@dateyear \copyrightholder \\%
            \vfill
            \normalfont
        \end{center}
    \end{singlespace}
    \clearpage
}

\newenvironment{abstractpage}
 {%
  \clearpage
  \addcontentsline{toc}{chapter}{\abstractname}
  \pagestyle{empty}
  \begin{center}
  %set the default font style to bold face for the abstract page
  \bfseries
  {\Large \MakeUppercase{\abstractname} \\%
  [\bigskipamount]}
  {\large \@title\\%
  [\bigskipamount]}
  \@author
  \end{center}
  \begin{singlespace}
      \begin{justify}
          \noindent\ignorespaces
 }
 {%
       \end{justify}
  \end{singlespace}
  \clearpage
  \pagestyle{plain}
 }

 \newenvironment{acknowledgements}
 {%
     \clearpage
     \vspace*{\stretch{2}}
     \centering{\section*{Acknowledgments}}
     \addcontentsline{toc}{chapter}{Acknowledgments}
     \justify
 }
 {% 
     \vspace{\stretch{3}}
     \clearpage
 }
 
 \newenvironment{dedication}
 {%
     \clearpage
     \pagestyle{plain}
     \vspace*{\stretch{2}}
     \begin{center}
     \itshape
 }
 {%
     \end{center}
     \vspace{\stretch{3}}
     \clearpage
 }

 \newenvironment{acronyms}
 {%
     \pagestyle{plain}
     \section*{Acronyms}
     \begin{tabular}{b{0.15\textwidth} b{0.85\textwidth}}
 }
 {%
     \end{tabular}
 }

 \newenvironment{nomenclature}
 {%
     \pagestyle{plain}
     \section*{Nomenclature}
     \begin{tabular}{c c b{0.85\textwidth}}
         Symbol & Units & Description \\
 }
 {%
     \end{tabular}
 }

% update the chapter command so that it sets up the proper numbering the first time it is called
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter.}%
    \addcontentsline{toc}{chapter}%
        {\protect\numberline{\thechapter}#1}%
    \else
      \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \addtocontents{lof}{\protect\addvspace{10\p@}}%
    \addtocontents{lot}{\protect\addvspace{10\p@}}%
    \if@twocolumn
      \@topnewpage[\@makechapterhead{#2}]%
    \else
      \@makechapterhead{#2}%
      \@afterheading
    \fi
    \ifnum\value{chapter}=1
        \pagenumbering{arabic}
        \pagestyle{plain}
    \fi}

%Make the table of contents links in black
\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}
       }%
        {%
            \hypersetup{hidelinks}%
            \@starttoc{toc}%
        }%
        \if@restonecol\twocolumn\fi
    }
\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
    \addcontentsline{toc}{chapter}{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
    {%
        \hypersetup{hidelinks}%
        \@starttoc{lof}%
    }%
    \if@restonecol\twocolumn\fi
}

\renewcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
    \addcontentsline{toc}{chapter}{\listtablename}%
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
    {%
        \hypersetup{hidelinks}%
        \@starttoc{lot}%
    }%
    \if@restonecol\twocolumn\fi
}

