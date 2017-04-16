%% Start of file `awesome-cv.cls'.
% Cheat Sheet Class File
%
% This class has been downloaded from:
% https://github.com/eyedol/tex-cheat-sheet
%
% Author:
% Henry Addo <henry@addhen.org>
% http://www.addhen.org
%
% Notes:
% 1) This class file defines the structure and layout of the template file (cv.tex, resume.tex).
% 2) It has been written in such a way that under most circumstances you 
% should not need to edit it.
%
% Class license:
% LPPL v1.3c (http://www.latex-project.org/lppl)
%

%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------
\ProvidesClass{cheat-sheet}[2017/04/14 v1.0 Cheat Sheet Class]
\NeedsTeXFormat{LaTeX2e}
\LoadClass{scrartcl}
%-------------------------------------------------------------------------------
%                3rd party packages
%-------------------------------------------------------------------------------
% Needed to make fixed length table
\RequirePackage{array}
% Needed to manage colors
\RequirePackage[table]{xcolor}
% Needed to load custom fonts
\RequirePackage{fontspec}
% Needed to provide fontawesome icons
\RequirePackage{fontawesome}
\RequirePackage[os=mac]{menukeys}
% Needed to make header & footer effeciently
\RequirePackage{fancyhdr}
%-------------------------------------------------------------------------------
%                Configuration for font directory locations
%-------------------------------------------------------------------------------
% Configure a directory location for fonts(default: 'fonts/')
\newcommand*{\fontdir}[1][fonts/]{\def\@fontdir{#1}}
\fontdir
%-------------------------------------------------------------------------------
%                Configuration for layout
%-------------------------------------------------------------------------------
%% Page Layout

%% Header & Footer
% Set offset to each header and footer
\fancyhfoffset{0em}
% Remove head rule
\renewcommand{\headrulewidth}{0pt}
% Clear all header & footer fields
\fancyhf{}
% Enable if you want to make header or footer using fancyhdr
\pagestyle{fancy}
%-------------------------------------------------------------------------------
%                Configuration for fonts & Colors
%-------------------------------------------------------------------------------
% Set main font
\setmainfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{Roboto}
% Set sans font
\setsansfont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{RobotoMono}
% Set mono font
\setmonofont[
  Path=\@fontdir,
  UprightFont=*-Regular,
  ItalicFont=*-Italic,
  BoldFont=*-Bold,
  BoldItalicFont=*-BoldItalic
]{RobotoMono}
% Set colors
\definecolor{grey}{HTML}{DDDDDD}
\definecolor{darkgreen}{HTML}{7AAD45}
\definecolor{lightgreen}{HTML}{90C653}
\definecolor{lightgrey}{HTML}{999999}
% Text colors
\colorlet{lighttext}{lightgrey}
%-------------------------------------------------------------------------------
%                Commands for altering table's looks & feel
%-------------------------------------------------------------------------------
% Set column headers row color as dark green
\newcommand{\headerrowcolor}{\rowcolor{darkgreen}}
% Set sub header's row color as light green
\newcommand{\subheaderrowcolor}{\rowcolor{lightgreen}}
% Set keyboard key styles
% Credit: Paul Gaborit from http://tex.stackexchange.com/a/236891/226
\def\setmenukeyswin{\def\tw@mk@os{win}}
\def\setmenukeysmac{\def\tw@mk@os{mac}}
\renewmenumacro{\keys}[+]{roundedkeys}
\renewmenumacro{\menu}[>]{angularmenus}
\newcommand*{\footerstyle}[1]{{\fontsize{10pt}{1em}\scshape\color{lighttext} #1}}
% Define a footer
% Usage: \makefooter{<left>}{<center>}{<right>}
\newcommand*{\makefooter}[3]{%
  \fancyfoot{}
  \fancyfoot[L]{\footerstyle{#1}}
  \fancyfoot[C]{\footerstyle{#2}}
  \fancyfoot[R]{\footerstyle{#3}} 
}

