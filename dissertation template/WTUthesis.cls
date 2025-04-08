%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   声明和基本信息
%            Statement and basic information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 2025-3-20 v1.0
% 作者：杜鑫// 机构：武汉纺织大学经济学院// 联系方式：hhkaaen@hotmail.com (欢迎联系！)
% Author: Xin Du// Institution: School of Economics, Wuhan Textile University// Email: hhkaaen@hotmail.com (open to suggestions!)
%
% WTUthesis.cls -- 本文件适用于武汉纺织大学毕业论文格式 (非官方)
% 本文件是一个 cls 文件，主要用于定义 class，而非直接编译.
% WTUthesis.cls -- this document is used for graduate thesis template of Wuhan Textile University (non-official)
% this document is used for defining class, not for direct encode.
%
% 祝各位在毕业季都一路顺风! Bon voyage!
% may all the graduate have a good trip!


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WTUthesis}[2025/03/18 v1.0 WTUthesis class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   加载必要的宏包
%                 Necessary packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper,openany,twoside,12pt]{book}

\RequirePackage{ctex}       % 中文支持//Chinese support
\RequirePackage{geometry}   % 页面布局//page
\RequirePackage{fancyhdr}   % 页眉页脚//head and foot
\RequirePackage{titlesec}   % 标题格式//title
\RequirePackage{graphicx}   % 图像处理//graphics
\RequirePackage{xcolor}     % 颜色支持//color
\RequirePackage{setspace}   % 行距设置//line distances
\RequirePackage{ifthen}     % 条件判断//ifthen
\RequirePackage{array}	  % 表格处理//table
\RequirePackage{tabularx}   % 表格处理//table
\RequirePackage{hyperref}   % 超链接//hyperlink
\RequirePackage{titletoc}   % 目录格式//table of contents
\RequirePackage{titlesec}   % 标题格式//title
\RequirePackage{tocloft}
\RequirePackage{fancyhdr}   % 页眉页脚//head and foot
\RequirePackage{etoolbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     文档总体设置
%                 document total settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页边距//page layout
\geometry{
	top=35mm,
	bottom=30mm,
	left=25mm,
	right=25mm,
  headsep=5mm,
	headheight=15mm,
	footskip=15mm,
	bindingoffset=0mm
}

% 定义字体//font
\newcommand{\shuoshi}{\fontsize{26pt}{31.2pt}\selectfont\kaishu\bfseries}  % 开头字体//title font
\newcommand{\timu}{\fontsize{22pt}{28pt}\selectfont\fangsong\bfseries\centering}  % 标题字体//title font


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      封面页设置
%                 Title page settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 中文页面//Chinese title page
\def\classification#1{\def\@classification{#1}}
\def\UDC#1{\def\@UDC{#1}}
\def\schoolcode#1{\def\@schoolcode{#1}}
\def\secretlevel#1{\def\@secretlevel{#1}}
\def\title#1{\def\@title{#1}}
\def\subtitle#1{\def\@subtitle{#1}}
\def\author#1{\def\@author{#1}}
\def\studentid#1{\def\@studentid{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\major#1{\def\@major{#1}}
\def\department#1{\def\@department{#1}}
\def\direction#1{\def\@direction{#1}}
\def\completedate#1{\def\@completedate{#1}}

% 英文页面//English title page
\def\engtitle#1{\def\@engtitle{#1}}
\def\engsubtitle#1{\def\@engsubtitle{#1}}
\def\engauthor#1{\def\@engauthor{#1}}
\def\engadvisor#1{\def\@engadvisor{#1}}
\def\engdate#1{\def\@engdate{#1}}
\def\engdegree#1{\def\@engdegree{#1}}

% 设置默认值//default
\classification{}
\UDC{}
\schoolcode{}
\secretlevel{}
\title{}
\subtitle{}
\author{}
\studentid{}
\advisor{}
\major{}
\department{}
\direction{}
\completedate{}

\engdegree{}
\engtitle{}
\engsubtitle{}
\engauthor{}
\engadvisor{}
\engdate{}


% 中文封面页设置//Chinese title page
\renewcommand{\maketitle}{
	\begin{titlepage}
		\vspace*{-2cm}
		\begin{center}
			% 页面上部信息//upper area
			{\fontsize{14pt}{18pt}\selectfont
			\songti
			\begin{tabularx}{\textwidth}{l@{}c>{\hfill}Xr@{}c}
				\makebox[3em][s]{分类号}： & \underline{\makebox[8em]{\@classification}} & & 
				\makebox[4em][s]{学校代码}： & \underline{\makebox[8em]{\@schoolcode}} \\[6pt]
				\makebox[3em][s]{U\hspace{\fill}D\hspace{\fill}C}： & \underline{\makebox[8em]{\@UDC}} & & 
				\makebox[4em][s]{密级}： & \underline{\makebox[8em]{\@secretlevel}} \\
			\end{tabularx}
			}

			\vspace{2.5cm}
			
			% 学校名称//school name
			\includegraphics[width=0.6\textwidth]{headlogo.jpg}
			
			\vspace{0.5cm}
			
			% 论文类型//thesis type
			\makebox[0.6\textwidth][s]{\shuoshi 硕士学位论文\par}
			
			\vspace{2cm}
			
			% 论文题目与副标题（如果有）// thesis title and subtitle
			\begin{minipage}{\textwidth}
				\centering\timu\@title\par
			\end{minipage}
			\vspace{0.5cm}
			
			\ifthenelse{\equal{\@subtitle}{}}{}{
				\makebox[0.7\textwidth]{\timu\@subtitle}
			}
			
			\vspace{2.5cm}
			
			 % 作者信息//author information
			 {
			\fontsize{15pt}{18pt}\selectfont
			\kaishu\bfseries
			\begin{tabularx}{0.6\textwidth}{l@{}X}
				\makebox[4em][s]{作者姓名}： & \underline{\makebox[\linewidth]{\@author}} \\[12pt]
				\makebox[4em][s]{学\hspace{\fill}号}： & \underline{\makebox[\linewidth]{\@studentid}} \\[12pt]
				\makebox[4em][s]{指导教师}： & \underline{\makebox[\linewidth]{\@advisor}} \\[12pt]
				\makebox[4em][s]{学科门类}： & \underline{\makebox[\linewidth]{\@department}} \\[12pt]
				\makebox[4em][s]{专\hspace{\fill}业}： & \underline{\makebox[\linewidth]{\@major}} \\[12pt]
				\makebox[4em][s]{研究方向}： & \underline{\makebox[\linewidth]{\@direction}} \\[12pt]
				\makebox[4em][s]{完成日期}： & \underline{\makebox[\linewidth]{\@completedate}} \\
			\end{tabularx}
			}
			\end{center}
		\end{titlepage}
	}

% 英文封面页设置//English title page
\newcommand{\maketitletwo}{
	\begin{titlepage}
		\clearpage
		\begin{center}
			\vspace{2\baselineskip}
			
			\begin{minipage}{0.5\textwidth}
				\fontsize{18pt}{27pt}\selectfont
				\itshape
				Wuhan \hspace{\fill} Textile \hspace{\fill} University
			\end{minipage}
			
			{\fontsize{18pt}{27pt}\selectfont 
			\@engdegree \par
			}
			
			\vspace{4cm}
			
			% 英文题目//English title
			\begin{spacing}{1.25}
				\fontsize{18pt}{22.5pt}\selectfont\bfseries
				\@engtitle
			\end{spacing}
			
			% 副标题（如果有）//subtitle
			\ifthenelse{\equal{\@engsubtitle}{}}{}{
				\vspace{0.3cm}
				\begin{spacing}{1.25}
					\fontsize{18pt}{22.5pt}\selectfont\bfseries\@engsubtitle\par
				\end{spacing}
			}
			
			\vspace{8cm}
			
			% 作者信息//author information
			{
			\fontsize{15pt}{18pt}
			\selectfont\bfseries
			\begin{tabularx}{0.7\textwidth}{lX}
				Candidate: & \makebox[\linewidth]{\@engauthor} \\[6pt]
				Supervisor: & \makebox[\linewidth]{\@engadvisor} \\[6pt]
				Time: & \makebox[\linewidth]{\@engdate} \\
			\end{tabularx}
			}
		\end{center}
	\end{titlepage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      摘要页设置
%                 Abstract page settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 摘要页设置//abstract page
\def\abstract#1{\def\@abstract{#1}}
\def\keywords#1{\def\@keywords{#1}}
\def\researchtype#1{\def\@researchtype{#1}}
\def\engabstract#1{\def\@engabstract{#1}}
\def\engkeywords#1{\def\@engkeywords{#1}}
\def\engresearchtype#1{\def\@engresearchtype{#1}}

% 默认值//default
\abstract{}
\keywords{}
\researchtype{}
\engabstract{}
\engkeywords{}
\engresearchtype{}

% 中文摘要页设置//Chinese abstract page
\newcommand{\makeabstract}{
  \phantomsection

  % 标题//title
  {\centering\fontsize{16pt}{19.2pt}\selectfont\heiti 摘\quad 要\par}
  
  \vspace{1\baselineskip}
  
  % 内容//content
  \setlength{\parindent}{2em}
  {\fontsize{12pt}{18pt}\selectfont\songti
  \@abstract\par
	}
  
  \vspace{1\baselineskip}
  
  % 关键词和研究类型//keywords and research type
  {\noindent\fontsize{12pt}{14.4pt}\selectfont\bfseries 关键词：}
  {\fontsize{12pt}{14.4pt}\selectfont\@keywords}\par

  \vspace{0.5\baselineskip}

  {\noindent\fontsize{12pt}{14.4pt}\selectfont\bfseries 研究类型：}
  {\fontsize{12pt}{14.4pt}\selectfont\@researchtype}
  
  \clearpage
}


% 英文摘要页设置//English abstract page
\newcommand{\engmakeabstract}{
  \phantomsection
  {\centering\fontsize{16pt}{19.2pt}\selectfont\bfseries Abstract\par}
  
  \vspace{1\baselineskip}
  
  % content
  \setlength{\parindent}{2em}
  {\fontsize{12pt}{18pt}\selectfont\rmfamily
	\@engabstract\par
	}
  
  \vspace{1\baselineskip}
  
  % keywords and research type
  {\noindent\fontsize{12pt}{14.4pt}\selectfont\bfseries Keywords: }
  {\fontsize{12pt}{14.4pt}\selectfont\@engkeywords}\par

  \vspace{0.5\baselineskip}

  {\noindent\fontsize{12pt}{14.4pt}\selectfont\bfseries Thesis: }
  {\fontsize{12pt}{14.4pt}\selectfont\@engresearchtype}
  
  \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      目录页设置
%                 Table of contents settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 目录字体//table of contents font
\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\cfttoctitlefont}{\hfill\fontsize{16pt}{48pt}\selectfont\heiti}
\renewcommand{\cftaftertoctitle}{\hfill}

\renewcommand{\cftchapfont}{\fontsize{12}{15}\heiti}
\renewcommand{\cftchappagefont}{\fontsize{12}{15}\heiti}

\renewcommand{\cftsecfont}{\fontsize{12}{15}\songti}
\renewcommand{\cftsecpagefont}{\fontsize{12}{15}\songti}

\renewcommand{\cftsubsecfont}{\fontsize{12}{15}\songti}
\renewcommand{\cftsubsecpagefont}{\fontsize{12}{15}\songti}

%% 目录页码//table of contents page number
\AtBeginDocument{
  \pagestyle{empty}
}

\let\originalcontentsname\contentsname
\renewcommand{\tableofcontents}{
  \clearpage
  \pagenumbering{roman}
  \pagestyle{plain}
  {\centering
  \bfseries\fontsize{16pt}{48pt}\selectfont\contentsname\par}
  \vspace{1em}
  \@starttoc{toc}
  \clearpage
}

\let\originalchapter\chapter
\renewcommand{\chapter}{%
  \ifnum\value{chapter}=0
    \clearpage
    \pagestyle{plain}
    \pagenumbering{arabic}
  \fi
  \originalchapter
}

% 目录缩进//indent
\setlength{\cftchapindent}{0em}
\setlength{\cftsecindent}{0em}
\setlength{\cftsubsecindent}{0em}

\setlength{\cftaftertoctitleskip}{10pt}
\setlength{\cftbeforetoctitleskip}{10pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      正文格式设置
%                 Main body format settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 一级标题格式//First level title format
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

\titleformat{\chapter}[block]
  {\centering\fontsize{16pt}{24pt}\selectfont\heiti}
  {\thechapter}
  {0.5em}
  {}
  \titlespacing*{\chapter}
  {0pt}
  {-10pt}
  {0.5\baselineskip}

% 二级//Second level
\titleformat{\section}[hang]
  {\fontsize{14pt}{17.5pt}\selectfont\heiti}
  {\thesection}
  {0.5em}
  {}
\titlespacing*{\section}
  {0pt}
  {0.5\baselineskip}
  {0.5\baselineskip}

% 三级//Third level
\titleformat{\subsection}[hang]
  {\fontsize{12pt}{15pt}\selectfont\heiti}
  {\thesubsection}
  {0.5em}
  {}
\titlespacing*{\subsection}
  {0pt}
  {0.5\baselineskip}
  {0.5\baselineskip}


\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    页眉页脚
%                 Head and foot
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

% 页眉页脚设置//head and foot
\fancypagestyle{tocpage}{
  \fancyhf{}
  % 偶数页
  \fancyhead[CE]{\kaiti 武汉纺织大学硕士学位论文}
  % 奇数页
  \fancyhead[CO]{\kaiti 目录}
  % 页码
  \fancyfoot[C]{\thepage}
  % 双线
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\headrule}{
    {\hrule width\headwidth height\headrulewidth \vskip 1pt}
    {\hrule width\headwidth height\headrulewidth}
  }
}

\fancypagestyle{thesis}{
  \fancyhf{}
  % 偶数页
  \fancyhead[CE]{\CJKfamily{kai} 武汉纺织大学硕士学位论文}

  % 奇数页
  \fancyhead[CO]{\CJKfamily{kai}\leftmark}

  % 页码
  \fancyfoot[C]{\thepage}

  % 双线
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\headrule}{
    {\hrule width\headwidth height\headrulewidth \vskip 1pt}
    {\hrule width\headwidth height\headrulewidth}
  }
}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyhead[CE]{\itshape 武汉纺织大学硕士学位论文}
  \fancyhead[CO]{{\kaishu\leftmark}}
  \fancyfoot[C]{\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\headrule}{
    {\hrule width\headwidth height\headrulewidth \vskip 1pt}
    {\hrule width\headwidth height\headrulewidth}
  }
}

% 应用页面样式
\pagestyle{tocpage}
\pagestyle{thesis}
