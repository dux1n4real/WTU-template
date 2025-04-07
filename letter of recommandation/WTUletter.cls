%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   声明和基本信息
%            Statement and basic information
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% 作者：杜鑫// 机构：武汉纺织大学经济学院// 联系方式：hhkaaen@hotmail.com (欢迎联系！)
% WTUletter.cls -- 本文件适用于需要武汉纺织大学机构抬头的各种信件 (非官方)
% 本文件是一个 cls 文件，主要用于定义 class，而非直接编译.
% 此文件的目的是为了创建一个简单的信件模板，其中包含武汉纺织大学的机构抬头和页脚。
%
% Author: Xin Du// Institution: School of Economics, Wuhan Textile University// Email: hhkaaen@hotmail.com (open to suggestions!)
% This file is for creating letters with WTU logo at the header and department address at the footer (unofficial)
% This file is a `.cls' file, mainly used for defining class, not for direct compilation.
% The purpose of this file is to create a simple letter template with WTU logo at the header and department address at the footer.


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WTUletter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      基本宏包
%                 Necessary packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{letter}}
\ProcessOptions
\LoadClass[a4paper,12pt]{letter}

% 宏包// Packages
\RequirePackage{geometry}
\RequirePackage{graphicx}
\RequirePackage{ifthen}
\RequirePackage{epsfig}
\RequirePackage{xcolor}
\RequirePackage{tikz}
\RequirePackage{hyperref}
\RequirePackage{fancyhdr}
\RequirePackage{eso-pic}
\RequirePackage{lastpage}

\definecolor{wtublue}{RGB}{0, 32, 96}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   页面布局设置
%            	Page layout settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 页码布局// basic Layout
\geometry{
	paper=letterpaper,
	textwidth=6.875in,
	textheight=7in,
	top=1in,
	bottom=1in,
	headsep=0.5in,
	footskip=0.5in,
	left=1in,
	right=1in,
	marginpar=0in
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 						信头设置
%				 Head box Declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 定义// Definition
\def\logo#1{\def\@logo{#1}}
\def\department#1{\def\@department{#1}}
\def\university#1{\def\@university{#1}}
\def\addressone#1{\def\@addressone{#1}}
\def\addresstwo#1{\def\@addresstwo{#1}}
\def\addressthree#1{\def\@addressthree{#1}}
\def\phone#1{\def\@phone{#1}}
\def\email#1{\def\@email{#1}}
\def\web#1{\def\@web{#1}}
\def\recipient#1{\def\@recipient{#1}}
\def\date#1{\def\@date{#1}}

\logo{wtu-long.png}
\department{}
\university{}
\addressone{}
\addresstwo{}
\addressthree{}
\phone{}
\email{}
\web{}
\recipient{}
\date{}

\newcommand{\newaddress}{
  {\fontsize{10pt}{10pt}\selectfont
    \textcolor{wtublue}{\textbf{\@department,}}\\
    \textcolor{wtublue}{\textbf{\@university}}\\
    \@addressone\\
    \@addresstwo\\
    \textcolor{wtublue}{\textbf{Phone:}} \@phone\\
    \textcolor{wtublue}{\textbf{E-mail:}} \@email\\
    \textcolor{wtublue}{\textbf{URL:}} \href{\@web}{\@web}
  }
}

% 信头盒子定义// Head Box Definition
\newcommand{\maketitlehead}{
	\noindent
	\begin{minipage}{0.59\textwidth}
	  \includegraphics[width=0.95\textwidth]{\@logo}
	\end{minipage}
	\begin{minipage}{0.02\textwidth}
	  \rule{0.4pt}{4cm}
	\end{minipage}
	\begin{minipage}{0.38\textwidth}
	 \newaddress
	\end{minipage}
  
  \vspace*{2cm}
  \noindent
  \@date

  \vspace*{1cm}
  \noindent
  Dear \@recipient,
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   	结尾设置
%                  Ending Declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifsignature
\signaturefalse

\def\signature#1{
	\ifx&#1&
	\signaturefalse
	\else
	\def\@signature{#1}
	\signaturetrue
	\fi
}

\def\writer#1{\def\@writer{#1}}
\def\writertitle#1{\def\@writertitle{#1}}
\def\writeraffiliation#1{\def\@writeraffiliation{#1}}

\writer{}
\signature{}
\writertitle{}
\writeraffiliation{}

\renewcommand{\closing}{
	\vspace{1em}
	\noindent\hfill\begin{minipage}[0.4\textwidth]{0.4\textwidth}
		Sincerely,
		
		\ifsignature
		\vspace{1em}
		\includegraphics[height=2cm]{\@signature}

		\else
		\vspace{4em}
		\fi
		\@writer\\
		\@writertitle\\
		\@writeraffiliation

	\end{minipage}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%				          其他设置
%                  Other Declarations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 水印// Watermark
\newcommand{\watermark}[1]{
	\AddToShipoutPictureBG{
	  \begin{tikzpicture}[remember picture, overlay]
		\node[opacity=0.1, inner sep=0pt] at (current page.center) {
		  \includegraphics[width=0.6\paperwidth]{#1}
		};
	  \end{tikzpicture}
	}
  }

% 页码设置// Page Number Settings
\pagestyle{fancy}
\fancyhf{}
\fancyhead[R]{Page \thepage\ of \pageref{LastPage}}
\fancyfoot{}
\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{firstpage}{
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\AtBeginDocument{\thispagestyle{firstpage}}