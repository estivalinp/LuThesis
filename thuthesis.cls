%%
%% This is file `thuthesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% thuthesis.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2005-2017 by Ruini Xue <xueruini@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3a
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% and version 1.3a or later is part of all distributions of LaTeX
%% version 2004/10/01 or later.
%% 
%% To produce the documentation run the original source files ending with `.dtx'
%% through LaTeX.
%% 
%%%%%%%%%%      Luthesis v1.1      %%%%%%%%%%
%%% 该模板为兰州理工大学硕士学位论文模板  %%%
%%% 基于 ThuThesis LATEX Template 修改    %%%
%%% @Author Yang Guoqiang                 %%%
%%% Email estivalinp@163.com              %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{thuthesis}
[2017/03/26 5.3.2 Tsinghua University Thesis Template]
\hyphenation{Thu-Thesis}
\def\thuthesis{\textsc{ThuThesis}}
\def\version{5.3.2}

% estival新增
% 表格手动换行
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}
% 表格对齐
\newcommand{\tc}[1]{\multicolumn{1}{c}{#1}} %居中对齐
\newcommand{\tl}[1]{\multicolumn{1}{l}{#1}} %左对齐
\newcommand{\tr}[1]{\multicolumn{1}{r}{#1}} %右对齐
% 条款格式（接排）
%line251%\setenumerate{fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex}
% 脚注图标
%\RequirePackage{pifont}
%\RequirePackage{thuthesis}
%\usepackage{wasysym}   % 方框对号 line 132 避免重复，必须放入asmtex之后 estival 2018年4月8日09:47:30
\RequirePackage{changepage}   %整段缩进
% 表格行高
%\usepackage{array}  
%\usepackage{booktabs} %调整表格线与上下内容的间隔  
\RequirePackage{multirow}
% 算法
%\usepackage{algorithm}
%\usepackage{algorithmicx}
%\usepackage{algpseudocode}
\usepackage{eqparbox} % 对勾


\usepackage{amssymb}

% original
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=thu,
  prefix=thu@,
  setkeys=\kvsetkeys}
\newif\ifthu@bachelor
\newif\ifthu@master
\newif\ifthu@doctor
\newif\ifthu@postdoctor
\thu@mastertrue
\define@key{thu}{type}{%
  \thu@bachelorfalse
  \thu@masterfalse
  \thu@doctorfalse
  \thu@postdoctorfalse
  \expandafter\csname thu@#1true\endcsname}
\def\thu@deprecated@type@option{%
  \kvsetkeys{thu}{type=\CurrentOption} % for compatability.
  \ClassError{thuthesis}{Option '\CurrentOption' is deprecated, \MessageBreak
                         please use 'type=\CurrentOption' instead}{}}
\DeclareVoidOption{bachelor}{\thu@deprecated@type@option}
\DeclareVoidOption{master}{\thu@deprecated@type@option}
\DeclareVoidOption{doctor}{\thu@deprecated@type@option}
\DeclareVoidOption{postdoctor}{\thu@deprecated@type@option}
\DeclareBoolOption{secret}
\DeclareBoolOption{arialtoc}
\DeclareBoolOption{arialtitle}
\DeclareBoolOption{raggedbottom}
\DeclareBoolOption{pifootnote}
\DeclareBoolOption{mangshen}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\kvsetkeys{thu}{% set true
  raggedbottom,
  pifootnote}
\ProcessKeyvalOptions*
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\ifthu@bachelor\relax\else
  \ifthu@master\relax\else
    \ifthu@doctor\relax\else
      \ifthu@postdoctor\relax\else
        \ClassError{thuthesis}%
                   {Please specify thesis type in option: \MessageBreak
                    type=[bachelor | master | doctor | postdoctor]}{}
      \fi
    \fi
  \fi
\fi
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage[defaultsups]{newtxtext} % 正文使用Times New Roman字体
%\RequirePackage{newtxmath} % 公式使用Times New Roman字体
\RequirePackage{courier}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\ifthu@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifthu@pifootnote
  \RequirePackage{pifont}
\fi
\RequirePackage{CJKfntef}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage[numbers,super,sort&compress]{natbib}
\patchcmd{\@chapter}{\addtocontents{lof}{\protect\addvspace{10\p@}}}{}{}{} % lof
\patchcmd{\@chapter}{\addtocontents{lot}{\protect\addvspace{10\p@}}}{}{}{} % lot
\patchcmd{\@chapter}{\addtocontents{loa}{\protect\addvspace{10\p@}}}{}{}{} % loa
\RequirePackage{hyperref}
% 方框对号
\RequirePackage{wasysym}
% 公式
%\usepackage{unicode-math}
%\setmathfont{Latin Modern Math}
% 算法 必须放在这，不然缩进会出问题（折磨了一下午）2018年4月8日21:27:11
% 带标号、带章节编号
\usepackage[ruled,linesnumbered,resetcount,algochapter]{algorithm2e} %vlined
\usepackage{setspace} % 算法行距

\usepackage{tocbibind} % 算法索引
\usepackage{wasysym}   % 方框对号
\usepackage{changepage}   %整段缩进
% 表格行高
%\usepackage{array}  
%\usepackage{booktabs} %调整表格线与上下内容的间隔  
\usepackage{multirow} % 表格内换行

% 算法注释
\newlength\algowd
\def\savewd#1{\setbox0=\hbox{#1\hspace{.7in}}\algowd=\wd0\relax#1}
\newcommand\algolines[2]{\savewd{#1}%
  \tcp*{\parbox[t]{\dimexpr\algowidth-\algowd-30pt}{#2}}}
\SetNlSty{sihao}{}{:} % 行号
% 算法三线粗细
\setlength{\algoheightrule}{1.5pt} % thickness of the rules above and below
\setlength{\algotitleheightrule}{0.5pt} % thicknes of the rule below the title
% 表格宽度
\usepackage{tabularx}
% 步骤1 步骤2
\newlist{steps}{enumerate}{1}
\setlist[steps, 1]{label = {\heiti 步骤} \arabic*:}
% 事实1 事实2
\newlist{fact}{enumerate}{1}
\setlist[fact, 1]{label = {\heiti 事实} \arabic*:}
% 续排123
\newlist{xupai}{enumerate}{1}
\setlist[xupai, 1]{label = \arabic*.}

%列表环境首行缩进
\usepackage{indentfirst}

% 旋转内容
\usepackage{rotating}

% 特殊符号（笑脸😋）
\usepackage{fontspec}
\newfontfamily\DejaSans{DejaVu Sans}

%删除空白页中的页眉
\usepackage{emptypage}

% estival 删除图表目录章节分隔 2018年4月12日02:39:55 
%\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
%                       \if@mainmatter
%                         \refstepcounter{chapter}%
%                         \typeout{\@chapapp\space\thechapter.}%
%                         \addcontentsline{toc}{chapter}%
%                                   {\protect\numberline{\thechapter}#1}%
%                       \else
%                         \addcontentsline{toc}{chapter}{#1}%
%                       \fi
%                    \else
%                      \addcontentsline{toc}{chapter}{#1}%
%                    \fi
%                    \chaptermark{#1}%
%%                    \addtocontents{lof}{\protect\addvspace{10\p@}}% NEW
%%                    \addtocontents{lot}{\protect\addvspace{10\p@}}% NEW
%                    \if@twocolumn
%                      \@topnewpage[\@makechapterhead{#2}]%
%                    \else
%                      \@makechapterhead{#2}%
%                      \@afterheading
%                    \fi}


\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
\hypersetup{%
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0}
\urlstyle{same}

% 页面设置
\newlength{\alphabet}
\settowidth{\alphabet}{\normalfont abcdefghijklmnopqrstuvwxyz}
\RequirePackage{geometry}
\geometry{
  a4paper, % 210 * 297mm
  hcentering,
  ignoreall,
  nomarginpar}
\geometry{
	left=25mm,
	right=25mm,
	top=22mm,
	bottom=22mm,
	headheight=5mm,
	headsep=7mm,
	textheight=253mm,
	textwidth=155mm,
	footskip=11mm,
	textwidth=2.5\alphabet,
	hmarginratio={2:3}}
\RequirePackage{fancyhdr}
\let\thu@cleardoublepage\cleardoublepage
\newcommand{\thu@clearemptydoublepage}{%
  \clearpage{\pagestyle{thu@empty}\thu@cleardoublepage}}
\let\cleardoublepage\thu@clearemptydoublepage
\renewcommand\frontmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmatterfalse
  \pagenumbering{Roman}
  \pagestyle{thu@empty}}
\renewcommand\mainmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue
  \pagenumbering{arabic}
  \ifthu@bachelor\pagestyle{thu@plain}\else\pagestyle{thu@headings}\fi}
\renewcommand\backmatter{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \@mainmattertrue}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=10bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=10bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\thu@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\thu@def@fontsize{chuhao}{42bp}
\thu@def@fontsize{xiaochu}{36bp}
\thu@def@fontsize{yihao}{26bp}
\thu@def@fontsize{xiaoyi}{24bp}
\thu@def@fontsize{erhao}{22bp}
\thu@def@fontsize{xiaoer}{18bp}
\thu@def@fontsize{sanhao}{16bp}
\thu@def@fontsize{xiaosan}{15bp}
\thu@def@fontsize{sihao}{14bp}
\thu@def@fontsize{banxiaosi}{13bp}
\thu@def@fontsize{xiaosi}{12bp}
\thu@def@fontsize{dawu}{11bp}
\thu@def@fontsize{wuhao}{10.5bp}
\thu@def@fontsize{xiaowu}{9bp}
\thu@def@fontsize{liuhao}{7.5bp}
\thu@def@fontsize{xiaoliu}{6.5bp}
\thu@def@fontsize{qihao}{5.5bp}
\thu@def@fontsize{bahao}{5bp}
%页眉页脚
\fancypagestyle{thu@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{thu@plain}{%
  \fancyhead{}
  \fancyfoot[C]{\xiaowu\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{thu@headings}{%
  \fancyhead{}
  \fancyfoot{}
  \fancyhead[CO]{\wuhao \thu@apply} %奇数页眉中部
  \fancyhead[CE]{\wuhao \thu@ctitle} %偶数页眉中部
  \fancyfoot[C]{\wuhao \thepage}
  \def\headrule{{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi%
  \hrule\@height 3pt \@width\headwidth\vskip1pt %上面线为1pt粗
  \hrule\@height 0.75pt\@width\headwidth %下面0.5pt粗
  \vskip-2\headrulewidth\vskip-1pt} %两条线的距离1pt
  \vspace{5mm}}     %双线与下面正文之间的垂直间距
  \makeatother  }

\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\setlist{nosep}
\def\thu@textcircled#1{%
  \ifnum\value{#1} >9
    \ClassError{thuthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}
  \fi
  \ifthu@pifootnote%
    \ding{\the\numexpr\value{#1}+171\relax}%
  \else%
    %\textcircled{\xiaoliu\arabic{#1}}%
%    \tikz[baseline=(char.base)]
%    \node[shape=circle,draw,inner sep=0.5pt,minimum size=8pt] (char) {#1};
	\ding{\the\numexpr\value{#1}+171\relax}%
  \fi}
\renewcommand{\thefootnote}{\thu@textcircled{footnote}}
\renewcommand{\thempfootnote}{\thu@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip5\p@}
\let\thu@footnotesize\footnotesize
\renewcommand\footnotesize{\thu@footnotesize\wuhao[1.5]}
\footnotemargin1em\relax
\let\thu@makefnmark\@makefnmark
\def\thu@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\thu@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\thu@makefnmark}{}{}
\allowdisplaybreaks[4]
% 条款格式（缩进、接排）
\setenumerate{fullwidth,itemindent=\parindent,listparindent=\parindent,itemsep=0ex,partopsep=0pt,parsep=0ex,label=（\arabic*）,topsep=6bp,labelsep=0pt}
% 公式编号方式
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter.\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\thu@make@df@tag@@\make@df@tag@@@}
\def\thu@make@df@tag@@#1{\gdef\df@tag{\thu@maketag{#1}\def\@currentlabel{#1}}}
\iffalse
\ifthu@bachelor
  \def\thu@maketag#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)}}
  \def\tagform@#1{\maketag@@@{%
    (\ignorespaces\text{\equationname\hskip0.5em}#1\unskip\@@italiccorr)\equcaption{#1}}}
\fi
\fi
\def\thu@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
%定理
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
\setlength{\floatsep}{20bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{20bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{20bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\ifthu@bachelor
  \g@addto@macro\appendix{\renewcommand*{\thefigure}{\thechapter-\arabic{figure}}}
  \g@addto@macro\appendix{\renewcommand*{\thetable}{\thechapter-\arabic{table}}}
\fi
\let\old@tabular\@tabular
\def\thu@tabular{\wuhao[1.5]\old@tabular}
\DeclareCaptionLabelFormat{thu}{{\wuhao[1.5]\heiti #1~\rmfamily #2}}
\DeclareCaptionLabelSeparator{thu}{\hspace{0.5em}}
\DeclareCaptionFont{thu}{\heiti\wuhao[1.5]}
\captionsetup{labelformat=thu,labelsep=thu,font=thu}
\captionsetup[table]{position=top,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[figure]{position=bottom,belowskip={12bp-\intextsep},aboveskip=6bp}
\captionsetup[sub]{font=thu,skip=6bp}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\thu@LT@array\LT@array
\def\LT@array{\wuhao[1.5]\thu@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\def\thu@title@font{%
  %\ifthu@arialtitle\sffamily\else\relax\fi}
  \ifthu@arialtitle\rmfamily\else\relax\fi} % 标题罗马体 estival 2018年4月7日10:35:57
\AtBeginDocument{%
  \pagestyle{thu@empty}
  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\hskip\ccwd#1}{}}}
% 标题格式
\newcommand\thu@chapter@titleformat[1]{%
  \ifthu@bachelor #1\else%
    \ifthenelse%
      {\equal{#1}{\eabstractname}}%
      {\bfseries #1}%
      {#1}%
  \fi}
\ctexset{%
  chapter={
    afterindent=true,
    pagestyle={\ifthu@bachelor thu@plain\else thu@headings\fi},
    beforeskip={6bp},
    aftername=\hskip\ccwd,
    afterskip={18bp},
    format={\centering\thu@title@font\heiti\xiaoer[1]},
    nameformat=\relax,
    numberformat=\relax,
    titleformat=\thu@chapter@titleformat,
  },
  section={
    afterindent=true,
    beforeskip={12bp \@plus 1ex \@minus .2ex},
    afterskip={12bp \@plus .2ex},
    aftername=\hskip 0.5\ccwd,
    format={\thu@title@font\heiti\xiaosan[1.429]},
  },
  subsection={
    afterindent=true,
    beforeskip={6bp \@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    aftername=\hskip 0.5\ccwd,
    format={\thu@title@font\heiti\sihao[1.538]},
  },
  subsubsection={
    afterindent=true,
    beforeskip={6bp \@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\csname thu@title@font\endcsname\heiti\xiaosi[1.667] },
    name={,.},
    number=\arabic{subsubsection},
    indent={2em},
    aftername=\hskip 0.5\ccwd,
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcounter{thu@bookmark}
\NewDocumentCommand\thu@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \ClassError{thuthesis}{You have to use the star form: \string\thu@chapter*}{}
  }%
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \addtocounter{thu@bookmark}\@ne
      \pdfbookmark[0]{#3}{thuchapter.\thethu@bookmark}
    }{%
      \addcontentsline{toc}{chapter}{#3}
    }
  }{%
    \addcontentsline{toc}{chapter}{#3}
  }%
  \chapter*{#3}%
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}
    {\@mkboth{}{}}
    {\@mkboth{#4}{#4}}
  }{%
    \@mkboth{#3}{#3}
  }
}


\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
% 目录字体
\renewcommand\tableofcontents{%
  \pagenumbering{Roman} % 目录页码从1开始
  \thu@chapter*[]{\contentsname}
  \xiaosi[1.65]\@starttoc{toc}\normalsize}
\ifthu@arialtoc % 是否使用Aril体
  \def\thu@toc@font{\sffamily}
\fi
\def\@pnumwidth{2em}
\def\@tocrmarg{\@pnumwidth}
\def\@dotsep{1}
\patchcmd{\@dottedtocline}{#4}{\csname thu@toc@font\endcsname #4}{}{}
\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip 4bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      % numberline is called here, and it uses \@tempdima
      {\ifthu@bachelor\sffamily\else\csname thu@toc@font\endcsname\fi\heiti #1}
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill
      \nobreak{\normalfont\normalcolor #2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}
\renewcommand*\l@section{%
  \@dottedtocline{1}{\ccwd}{2.1em}}
\renewcommand*\l@subsection{%
  \@dottedtocline{2}{2\ccwd}{3em}}
\renewcommand*\l@subsubsection{%
  \@dottedtocline{3}{3.5em}{3.8em}}
\def\thu@def@term#1{%
  \define@key{thu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname thu@#1\endcsname{##1}}
  \csname #1\endcsname{}}
\thu@def@term{schoolcode}
\thu@def@term{classcode}
\thu@def@term{stunum}
\thu@def@term{secretlevel}
\thu@def@term{secretyear}
\thu@def@term{ctitle}
\thu@def@term{etitle}
\thu@def@term{cauthor}
\thu@def@term{csupervisor}
\thu@def@term{cassosupervisor}
\thu@def@term{ccosupervisor}
\thu@def@term{eauthor}
\thu@def@term{esupervisor}
\thu@def@term{eassosupervisor}
\thu@def@term{ecosupervisor}
\thu@def@term{cdegree}
\thu@def@term{edegree}
\thu@def@term{cdepartment}
\thu@def@term{submitdate}
\thu@def@term{replydate}
\thu@def@term{researchdirect}
\thu@def@term{chairman}
\thu@def@term{edepartment}
\thu@def@term{predegree}
\thu@def@term{ereplydate}
\def\caffil{% for compatibility
  \ClassWarning{thuthesis}
    {'\string\caffil' is deprecated, please use '\string\cdepartment' instead.}{}%
  \cdepartment}
\thu@def@term{edepartment}
\def\eaffil{% for compability
  \ClassWarning{thuthesis}
    {'\string\eaffil' is deprecated, please use '\string\edepartment' instead.}{}%
  \edepartment}
\thu@def@term{cmajor}
\def\csubject{% for compatibility
  \ClassWarning{thuthesis}
    {'\string\csubject' is deprecated, please use '\string\cmajor' instead.}{}%
  \cmajor}
\thu@def@term{emajor}
\def\esubject{%for compability
  \ClassWarning{thuthesis}
    {'\string\esubject' is deprecated, please use '\string\emajor' instead.}{}%
  \emajor}
\thu@def@term{cdate}
\thu@def@term{edate}
\thu@def@term{id}
\thu@def@term{udc}
\thu@def@term{catalognumber}
\thu@def@term{cfirstdiscipline}
\thu@def@term{cseconddiscipline}
\thu@def@term{postdoctordate}
\newcommand{\thu@@cabstract}[1]{\long\gdef\thu@cabstract{#1}}
\newenvironment{cabstract}{\Collect@Body\thu@@cabstract}{}
\newcommand{\thu@@eabstract}[1]{\long\gdef\thu@eabstract{#1}}
\newenvironment{eabstract}{\Collect@Body\thu@@eabstract}{}
% 关键词
\def\thu@parse@keywords#1{
  \define@key{thu}{#1}{\csname #1\endcsname{##1}}
  \expandafter\gdef\csname thu@#1\endcsname{}
  \expandafter\gdef\csname #1\endcsname##1{
    \@for\reserved@a:=##1\do{
      \expandafter\ifx\csname thu@#1\endcsname\@empty\else
        \expandafter\g@addto@macro\csname thu@#1\endcsname{%
          \ignorespaces\csname thu@#1@separator\endcsname}
      \fi
      \expandafter\expandafter\expandafter\g@addto@macro%
        \expandafter\csname thu@#1\expandafter\endcsname\expandafter{\reserved@a}}}}
\thu@parse@keywords{ckeywords}
\thu@parse@keywords{ekeywords}
\def\thusetup{\kvsetkeys{thu}}
\newcommand\thu@underline[2][6em]{\hskip0pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip0pt}
\newlength{\thu@title@width}
\newlength{\thu@title@contentwidth}
\newcommand{\thu@put@title}[2][\thu@title@width]{%
  \begin{CJKfilltwosides}[b]{#1}#2\end{CJKfilltwosides}}
\def\thu@first@titlepage{%
  \ifthu@postdoctor\thu@first@titlepage@postdoctor\else\thu@first@titlepage@other\fi}
% 硕士首页
\newcommand{\thu@first@titlepage@other}{
  \begin{center}
    \vspace*{-0.02cm}
	\parbox[t][1.8cm][t]{\paperwidth-6.34cm}{
		{\heiti\xiaosi 学校代号\thu@underline[79pt]{\thu@schoolcode}\hfill
			学\hspace{2em}号\thu@underline[79pt]{\thu@stunum}\\[3pt]
			{\ziju{0.5} 分类号}\thu@underline[79pt]{\thu@classcode}\hfill
			密\hspace{2em}级\thu@underline[79pt]{\thu@secretlevel}\\
		}
	}
    %\parbox[b][2.4cm][t]{\textwidth}{%
      %\ifthu@secret{\heiti\sanhao\thu@secretlevel\thu@%secret@content}\else\rule{1cm}{0cm}\fi} % 保密
    % 开始页面
	\vskip 0.0cm
	\parbox[t][393bp][t]{\paperwidth-6.34cm}{
	\renewcommand{\baselinestretch}{1.3}
	\begin{center}
	  \includegraphics[width=195bp]{lut_new_logo_black}\par
	  \vskip 22bp%
	  \erhao[1.5]\textrm{\heiti\thu@apply}\par % 副标题
	  \vskip 43bp%
	  \yihao[1.5]{\sffamily\heiti\thu@ctitle}\par % 标题
	\end{center}}
	% 信息
    \vskip 61pt
    \parbox[t][150bp][t]{\textwidth}{{\xiaosi[1.5]    		
     \begin{center}\fangsong
       \setlength{\thu@title@width}{85pt}
       \setlength{\thu@title@contentwidth}{190pt}
       \setlength{\extrarowheight}{5pt}
         %\begin{tabular}{p{84bp}@{}P@{\extracolsep{8pt}}l}
         \begin{tabular}[l]{p{\thu@title@width}@{}p{190pt}@{}} %单元格无边距
           \thu@put@title[\thu@title@width]{\heiti\thu@author@title} 	& {\thu@underline[\thu@title@contentwidth]{\songti\thu@cauthor}}\\
           \thu@put@title[\thu@title@width]{\heiti\thu@department@title}& {\thu@underline[\thu@title@contentwidth]{\songti\thu@cdepartment}}\\
           \thu@put@title[\thu@title@width]{\heiti\thu@supervisor@title}& {\thu@underline[\thu@title@contentwidth]{\songti\thu@csupervisor}}\\
           \thu@put@title[\thu@title@width]{\heiti\thu@major@title}		& {\thu@underline[\thu@title@contentwidth]{\songti\thu@cmajor}}\\
           \thu@put@title[\thu@title@width]{\heiti 研究方向}			& {\thu@underline[\thu@title@contentwidth]{\songti\thu@researchdirect}}\\
           \thu@put@title[\thu@title@width]{\heiti 论文提交日期}		  & {\thu@underline[\thu@title@contentwidth]{\songti\thu@submitdate}}\\
         \end{tabular}
     \end{center}}}
 % 日期
%     \begin{center}
%       {\ifthu@bachelor\vskip-1.0cm\hskip-1.2cm\xiaosi\else%
%         \vskip-0.5cm\sanhao\fi%
%         \songti\thu@cdate}
%     \end{center}
    \end{center}} % end of titlepage
% 第一页（盲审）
\newcommand{\thu@first@titlepage@mangshen}{
  \begin{center}
    % 开始页面
	\vskip 0.0cm
	\parbox[t][290bp][t]{\paperwidth-6.34cm}{
	\renewcommand{\baselinestretch}{1.3}
	\begin{center}
	  \vskip 22bp%
	  {\songti\erhao[1.5] \thu@apply\par} % 副标题
	  \vskip 43bp%
	  {\songti\yihao[1.5] \thu@ctitle\par} % 标题
	\end{center}}
	% 信息
    \parbox[t][150bp][t]{\textwidth}{{\xiaosi[1.5]    		
     \begin{center}
       \setlength{\thu@title@width}{85pt}
       \setlength{\thu@title@contentwidth}{190pt}
       \setlength{\extrarowheight}{5pt}
         %\begin{tabular}{p{84bp}@{}P@{\extracolsep{8pt}}l}
         \begin{tabular}[l]{p{\thu@title@width}@{}p{190pt}@{}} %单元格无边距
           \thu@put@title[\thu@title@width]{\songti\thu@major@title}		& {\thu@underline[\thu@title@contentwidth]{\songti\thu@cmajor}}\\
           \thu@put@title[\thu@title@width]{\songti 研究方向}			& {\thu@underline[\thu@title@contentwidth]{\songti\thu@researchdirect}}\\
         \end{tabular}
     \end{center}}}
 % 日期
%     \begin{center}
%       {\ifthu@bachelor\vskip-1.0cm\hskip-1.2cm\xiaosi\else%
%         \vskip-0.5cm\sanhao\fi%
%         \songti\thu@cdate}
%     \end{center}
    \end{center}} % end of titlepage

% 第二页
\newcommand{\thu@first@secondtitlepage@other}{	
	\begin{adjustwidth}{2.4cm}{0cm}					
%			\renewcommand{\baselinestretch}{1}
			{\heiti\xiaosi 学校代号：{\thu@schoolcode}\\[6pt]
				学\hspace{2em}号：{\thu@stunum}\\[6pt]
				密\hspace{2em}级：{\thu@secretlevel}\\[115pt]
			}
			{\renewcommand{\baselinestretch}{1.5} 
				\xiaoer[1.5] \songti 
				兰州理工大学硕士学位论文}\\[75pt]	
			\parbox[t][][t]{\textwidth-75pt}{
				\renewcommand{\baselinestretch}{1.4}
				\erhao[1.4] \heiti
				\thu@ctitle\\[120pt]}
			\parbox[t][][t]{\textwidth-75pt}{				
				\renewcommand\arraystretch{1.2}
				\setlength{\thu@title@width}{92pt}
				\setlength{\thu@title@contentwidth}{246pt}
				\setlength{\extrarowheight}{5pt}
				 \begin{tabular}[l]{@{}p{\thu@title@width}@{}p{\thu@title@contentwidth}<{\centering}@{}} %单元格无边距
				 	\xiaosi[12pt]
				 	\thu@put@title[\thu@title@width]{{\heiti\thu@author@title ：}}  	& {\songti\thu@cauthor} \\ 
				 	\specialrule{0.6pt}{-5.5pt}{0pt}  
				 	\thu@put@title[\thu@title@width]{{\heiti\thu@supervisor@title ：}}& {{\songti\thu@csupervisor}}\\
				 	\specialrule{0.6pt}{-5.5pt}{0pt} 
				 	\thu@put@title[\thu@title@width]{{\heiti\thu@department@title ：}}& {{\songti\thu@cdepartment}}\\
				 	\specialrule{0.6pt}{-5.5pt}{0pt} 
				 	\thu@put@title[\thu@title@width]{{\heiti 专业名称：}}			& {{\songti\thu@cmajor}}\\ 
				 	\specialrule{0.6pt}{-5.5pt}{0pt} 
				 	\thu@put@title[\thu@title@width]{{\heiti 论文提交日期：}}		  & {{\songti\thu@submitdate}}\\
				 	\specialrule{0.6pt}{-5.5pt}{0pt} 
				 	\thu@put@title[\thu@title@width]{{\heiti 论文答辩日期：}}		  & {{\songti\thu@replydate}}\\
				 	\specialrule{0.6pt}{-5.5pt}{0pt}  
				 	\thu@put@title[\thu@title@width]{{\heiti 答辩委员会主席：}}		  & {{\songti\thu@chairman }}\\
				 	\specialrule{0.6pt}{-5.5pt}{0pt}  			 	
				 \end{tabular}
			}
%	\parbox[t][1.8cm][t]{\paperwidth-6.34cm}{
%		{\heiti\xiaosi 学校代号\thu@underline[79pt]{10731}\hfill
%			学\hspace{2em}号\thu@underline[79pt]{152081201002}\\[3pt]
%			{\ziju{0.5} 分类号}\thu@underline[79pt]{TP391}\hfill
%			密\hspace{2em}级\thu@underline[79pt]{公\hspace{1em}开}\\
%		}
%	}	
	\end{adjustwidth}
}
% 英文封面
\newcommand{\thu@engcover}{%
  \newif\ifthu@professional\thu@professionalfalse
%  \ifthu@master
%    \ifthenelse{\equal{\thu@edegree}{\thu@master@art}}
%      {\relax}
%      {\ifthenelse{\equal{\thu@edegree}{\thu@master@sci}}
%        {\relax}
%        {\thu@professionaltrue}}
%  \fi
%  \ifthu@doctor
%    \ifthenelse{\equal{\thu@edegree}{\thu@doctor@phi}}
%      {\relax}
%      {\thu@professionaltrue}
%  \fi
  \begin{center}
    \vspace*{50pt}
    \parbox[t][][t]{\paperwidth-6.34cm}{
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
        \xiaosan[1.5]\thu@etitle%
      \end{center}}
      \renewcommand{\baselinestretch}{1.5}
      \begin{center}
	       \sihao[1.5]%
	       by \par
	       \thu@eauthor \par
	       \thu@predegree \par
	       A thesis submitted in partial satisfaction of the  \par
	       Requirements for the degree of \par
	       \thu@edegree \par
	       in \par
	       \thu@emajor \par
	       in the  \par
	       \thu@edepartment \par
	       Lanzhou University of Technology \par
	       Supervisor \par
	       \thu@esupervisor \par
	       \thu@ereplydate \par    
      \end{center}
%    \parbox[t][][t]{\paperwidth-6.34cm}{
%      \renewcommand{\baselinestretch}{1.5}
%      \begin{center}    
%        \ifthu@master Thesis \else Dissertation \par
%        Submitted to\\
%        {\bfseries Tsinghua University}\\
%        in partial fulfillment of the requirement\\
%        for the \ifthu@professional professional \fi
%        degree of\\
%        {\bfseries\sffamily\thu@edegree}%
%        \ifthu@professional\relax\else
%          \\in\\[3bp]
%          {\bfseries\sffamily\thu@emajor}%
%        \fi
%      \end{center}}
%    \parbox[t][][b]{\paperwidth-7.2cm}{
%      \renewcommand{\baselinestretch}{1.3}
%      \begin{center}
%        \sanhao\sffamily by\\[3bp]
%        \bfseries\thu@eauthor%
%        \ifthu@professional
%          \ifx\thu@emajor\empty\relax\else
%            \\(~\thu@emajor~)%
%        \fi\fi
%      \end{center}}
%    \par\vspace{0.9cm}
%    \parbox[t][2.1cm][t]{\paperwidth-7.2cm}{
%      \renewcommand{\baselinestretch}{1.2}
%      \xiaosan\centering
%      \begin{tabular}{rl}
%        \ifthu@master Thesis \else Dissertation \fi
%        Supervisor : & \thu@esupervisor\\
%        \ifx\thu@eassosupervisor\@empty
%          \else Associate Supervisor : & \thu@eassosupervisor\\\fi
%        \ifx\thu@ecosupervisor\@empty
%          \else Cooperate Supervisor : & \thu@ecosupervisor\\\fi
%      \end{tabular}}
%    \parbox[t][2cm][b]{\paperwidth-7.2cm}{
%    \begin{center}
%      \sanhao\bfseries\sffamily\thu@edate
%    \end{center}}
  \end{center}}
% 授权页
\newcommand{\thu@authorization@mk}{%
%  \vspace*{0.42cm} % shit code!  estival:？？？ 2018年4月6日16:02:47
%  \begin{center}\erhao\heiti\thu@authtitle\end{center}
%  \vskip40pt\sihao[2.03]\par
%  \thu@authorization\par
%  \textbf{\thu@authorizationaddon}\par
%  \vskip1.0cm
%  \begingroup
%    \parindent0pt\xiaosi
%    \hspace*{1.5cm}\thu@authorsig\thu@underline[7em]\relax\hfill%
%                   \thu@teachersig\thu@underline[7em]\relax\hspace*{1cm}\\[3pt]
%    \hspace*{1.5cm}\thu@frontdate\thu@underline[7em]\relax\hfill%
%                   \thu@frontdate\thu@underline[7em]\relax\hspace*{1cm}
%  \endgroup
%	\newpage
	\vspace*{13.5pt}
	\banxiaosi[24pt]
	\begin{center}
		{\heiti\xiaoer[24pt] {\ziju{0.5} 兰州理工大学}} \\
		%\vspace{12pt}
		\vskip 12pt
		{\heiti\xiaoer[24pt] 学位论文原创性声明}
		\vskip 12pt
	\end{center}
	\par 本人郑重声明：所呈交的论文是本人在导师的指导下独立进行研究所取得的研究成果。除了文中特别加以标注引用的内容外，本论文不包含任何其他个人或集体已经发表或撰写的成果作品。对本文的研究做出重要贡献的个人和集体，均已在文中以明确方式标明。本人完全意识到本声明的法律后果由本人承担。 \\[10pt]
%	\parbox[t][][t]{\paperwidth-6.34cm}{
	  \begingroup
		  \parindent0pt
		  \hspace*{1.5cm}作者签名：\hfill%
		  日期：\hspace{3em}年\hspace{2em}月\hspace{2em}日\hspace*{1.5cm}\\[3pt]
	  \endgroup
%	}
	\begin{center}
		{\heiti\xiaoer[1.5] 学位论文版权使用授权书}\par
	\end{center}
	\par 本学位论文作者完全了解学校有关保留、使用学位论文的规定，同意学校保留并向国家有关部门或机构送交论文的复印件和电子版，允许论文被查阅和借阅。本人授权兰州理工大学可以将本学位论文的全部或部分内容编入有关数据库进行检索，可以采用影印、缩印或扫描等复制手段保存和汇编本学位论文。\par 
	本学位论文属于\par 
	\begingroup
	\begin{adjustwidth}{4.3cm}{0cm}
		1、保密\Square ，在\thu@underline[3em]{}年解密后适用本授权书。\\ 
		2、不保密\CheckedBox 。\\
		（请在以上相应方框内打“\checkmark”）\\
	\end{adjustwidth}
	\endgroup
	 \begingroup
	 \parindent0pt
	 \hspace*{1.5cm}作者签名：\hfill%
	 日期：\hspace{3em}年\hspace{2em}月\hspace{2em}日\hspace*{1.5cm}\\[3pt]
	 \hspace*{1.5cm}导师签名：\hfill%
	 日期：\hspace{3em}年\hspace{2em}月\hspace{2em}日\hspace*{1.5cm}\\[3pt]
	 \endgroup
	
  }

% 生成封面
\def\makecover{%
  \thu@setup@pdfinfo\thu@makecover}
% 生成摘要
\def\makeabstract{%
	\thu@setup@pdfinfo\thu@makeabstract}
\def\thu@setup@pdfinfo{%
  \hypersetup{%
    pdftitle={\thu@ctitle},
    pdfauthor={\thu@cauthor},
    pdfsubject={\thu@cdegree},
    pdfkeywords={\thu@ckeywords},
    pdfcreator={\thuthesis-v\version}}}
\NewDocumentCommand{\thu@makecover}{o}{
  \phantomsection
  \pdfbookmark[-1]{\thu@ctitle}{ctitle}
  \normalsize%
  \begin{titlepage}
  	  \ifthu@mangshen
	  	\thu@first@titlepage@mangshen\clearpage
  	  \else
	    \thu@first@titlepage\clearpage
	    \thu@first@secondtitlepage@other\clearpage
	    \thu@engcover\clearpage
	    %\cleardoublepage\thu@engcover
	    \IfNoValueTF{#1}{%
	      \thu@authorization@mk
	    }{%
	      \includepdf{#1}%
	    }%
    \fi
  \end{titlepage}
  \normalsize
%  \thu@makeabstract
	\pagestyle{thu@headings}
  \let\@tabular\thu@tabular}

% 关键词
\newbox\thu@kw
\newcommand\thu@put@keywords[2]{%
  \begingroup
    \setbox\thu@kw=\hbox{#1}
    \ifthu@bachelor\indent\else\noindent\hangindent\wd\thu@kw\hangafter1\fi%
    \box\thu@kw#2\par
  \endgroup}
% 摘要
\newcommand{\thu@makeabstract}{%
  \clearpage
  % 中文
  \thu@chapter*{\cabstractname} % no tocline
  \ifthu@bachelor
    \pagestyle{thu@plain}
  \else
    \pagestyle{thu@headings}
  \fi
  \pagenumbering{Roman} % 摘要页码从1开始
  \thu@cabstract
  \vskip12bp
  \thu@put@keywords{\heiti\thu@ckeywords@title\thu@ckeywords}{}
  \clearpage
  % 英文
  \thu@chapter*{\eabstractname} % no tocline
  \thu@eabstract
  \vskip12bp
  \thu@put@keywords{%
    \textbf{Key Words:\enskip}}{\thu@ekeywords}}
\newenvironment{denotation}[1][2.5cm]{%
  \thu@chapter*{\thu@denotation@name} % no tocline
  \vskip-30bp\xiaosi[1.6]\begin{thu@denotation}[labelwidth=#1]
}{%
  \end{thu@denotation}
}
\newlist{thu@denotation}{description}{1}
\setlist[thu@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
% 参考文献
\NewDocumentEnvironment{references}{o}{%
    \thu@chapter*{参考文献}
  }{}
% 总结与展望
\NewDocumentEnvironment{conclusion}{o}{%
    \thu@chapter*{总结与展望}
  }{}
% 缩略词注释表
\NewDocumentEnvironment{abbreviation}{o}{%
  \thu@chapter*{缩略词注释表}
}{}
% 致谢
\NewDocumentEnvironment{acknowledgment}{o}{%
    \thu@chapter*{\thu@ackname}
  }
  {
%    \ifthu@postdoctor\relax\else%
%      \IfNoValueTF{#1}{%
%        \thu@chapter*{\thu@declarename}
%        \par{\xiaosi\parindent2em\thu@declaretext}\vskip2cm
%        {\xiaosi\hfill\thu@signature\thu@underline[2.5cm]\relax%
%         \thu@backdate\thu@underline[2.5cm]\relax}%
%      }{%
%        \includepdf[pagecommand={\thispagestyle{thu@empty}%
%          \phantomsection\addcontentsline{toc}{chapter}{\thu@declarename}%
%        }]{#1}%
%      }%
%    \fi
  }
\let\ack\acknowledgement
\let\endack\endacknowledgement

\def\thu@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\thu@listof#1{% #1: float type
  \@ifstar
    {\thu@chapter*{\csname list#1name\endcsname}
	    \setlength{\cfttabindent}{0pt}
	    \setlength\cftbeforechapskip{0pt}
	    \setlength\cftbeforetabskip{0pt}
    \thu@starttoc{#1}    }
    {\thu@chapter*{\csname list#1name\endcsname}\thu@starttoc{#1}}}
\renewcommand\listoffigures{\thu@listof{figure}}
\renewcommand*\l@figure{\addvspace{2bp}\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\thu@listof{table}}
\let\l@table\l@figure
% 定义公式列表
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\thu@listof{equation}}
\let\l@equation\l@figure % 列表格式
% 定义算法列表
\def\ext@algocf{loa} % 必不可少！！ estival 深夜 2018年4月9日01:46:19
% 下面三行删除，使用自带公式列表，algorithm2e中关键字为algocf
%\def\algocf#1{%
%  \addcontentsline{\ext@algocf}{algocf}%
%                  {\protect\numberline{#1}}}
\renewcommand\listofalgorithms{\thu@listof{algocf}} 
\let\l@algocf\l@figure % 列表格式
%\renewcommand{\listofalgorithms}{\tocfile{算法索引}{loa}}
%\let\oldlistofalgorithms\listofalgorithms
%\renewcommand{\listofalgorithms}{%
%  \begingroup%
%  \let\oldnumberline\numberline%
%  \renewcommand{\numberline}{算法~\oldnumberline}%
%  \oldlistofalgorithms%
%  \endgroup}
%\let\l@algorithm\l@figure
% 算法编号方式
%\floatname{algorithm}{算法} 
%\renewcommand{\algorithmicrequire}{\kaishu{输入:}} 
%\renewcommand{\algorithmicensure}{\kaishu{输出:}}
% 算法注释
%\renewcommand\algorithmiccomment[1]{%
%  \hfill\ // \ \eqparbox{COMMENT}{#1}%
%}
%\newcommand\LONGCOMMENT[2]{%
%  \hfill\ // \ \begin{minipage}[t]{#2}#1\strut\end{minipage}%
%}
% 算法标题字号
\renewcommand{\AlCapFnt}{\heiti\wuhao}
\renewcommand{\AlCapNameFnt}{\AlCapFnt}
\SetAlFnt{\small}
\newenvironment{myAlgorithm}[1][htb]
	{\renewcommand{\algorithmcfname}{算法}
	\begin{algorithm}[#1]}
	{\end{algorithm}}

\bibpunct{[}{]}{,}{s}{}{,}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa%
  \unskip\kern\p@\textsuperscript{\NAT@@open #1\NAT@@close}%
  \if*#3*\else\ (#3)\fi\else #1\fi\endgroup}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\def\thudot{\ifthu@bachelor\else\unskip.\fi}
\renewenvironment{thebibliography}[1]{%
   \thu@chapter*{\bibname}%
   \wuhao[1.5]
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\renewcommand{\makelabel}[1]{##1\hfill}
         \settowidth\labelwidth{1.1cm}
         \setlength{\labelsep}{0.4em}
         \setlength{\itemindent}{0pt}
         \setlength{\leftmargin}{\labelwidth+\labelsep}
         \addtolength{\itemsep}{-0.7em}
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \sloppy\frenchspacing
    \clubpenalty4000
    \@clubpenalty \clubpenalty
    \widowpenalty4000%
    \interlinepenalty4000%
    \sfcode`\.\@m}
   {\def\@noitemerr
     {\@latex@warning{Empty `thebibliography' environment}}%
    \endlist\frenchspacing}
\let\thu@appendix\appendix
\renewenvironment{appendix}{%
  \let\title\thu@appendix@title
  \thu@appendix}{%
  \let\title\@gobble}
\let\title\@gobble
\newcommand{\thu@appendix@title}[1]{%
  \begin{center}
    \bfseries\xiaosi #1
  \end{center}}
\newlist{translationbib}{enumerate}{1}
\setlist[translationbib]{label=[\arabic*],align=left,nosep,itemsep=6bp,
  leftmargin=9.5mm,labelsep=!,before=\vspace{0.5\baselineskip}\wuhao[1.3]}
\newenvironment{resume}[1][\thu@resume@title]{%
  \thu@chapter*{#1}}{}
\newcommand{\resumeitem}[1]{%
  \vspace{24bp}{\sihao\heiti\centerline{#1}}\par\vspace{6bp}}
\newcommand{\researchitem}[1]{%
  \vspace{32bp}{\sihao\heiti\centerline{#1}}\par\vspace{14bp}}
\newlist{publications}{enumerate}{1}
\setlist[publications]{label=[\arabic*],align=left,nosep,itemsep=5bp,
  leftmargin=9.5mm,labelsep=!,before=\xiaosi[1.26],resume}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{label=[\arabic*],align=left,nosep,itemsep=8bp,
  leftmargin=10mm,labelsep=!,before=\xiaosi[1.26]}
\def\publicationskip{\bigskip\bigskip}
\NewDocumentCommand{\shuji}{O{\thu@ctitle} O{\thu@cauthor}}{%
  \newpage\thispagestyle{empty}\fangsong\xiaosan\ziju{0.4}%
  \noindent\hfill\rotatebox[origin=lt]{-90}{\makebox[\textheight]{#1\hfill#2}}}
\AtEndOfClass{\input{thuthesis.cfg}}
\AtEndOfClass{\sloppy}
\endinput


%%
%% End of file `thuthesis.cls'.
