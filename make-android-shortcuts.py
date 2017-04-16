#!/usr/bin/env python
# -*- coding: utf-8 -*-
from bs4 import BeautifulSoup
from urllib import urlopen
import re

def set_keys(text):
  # Probably there is a cleaner way to achieve this
  return (
      text
      .replace('Control', '\ctrl')
      .replace('Command', '\cmd')
      .replace('Option', '\Alt')
      .replace('Shift','\shift')
      .replace('Tab', '\\tab')
      .replace('\n','')
      .replace('` (backquote)','`')
      .replace(', (comma)',',')
      .replace('; (semicolon)', ';')
      .replace('Space','\SPACE')
      .replace('Enter','\\return')
      .replace('Down Arrow', '\\arrowkeydown')
      .replace('Right','\\arrowkeyright')
      .replace('Alt','\Alt')
      .replace('Left','\\arrowkeyleft')
      .replace('Backspace','\\backspace')
      .replace('Esc', '\esc')
      .replace('Delete','\del')
      .rstrip()
    )

KEYBOARD_SHORTCUTS_URL = 'https://developer.android.com/studio/intro/keyboard-shortcuts.html'
OUTPUT_FILE = 'android-studio.tex'
OUTPUT_HEADER = r'''
%-------------------------------------------------------------------------------
% CONFIGURATIONS
%-------------------------------------------------------------------------------
{\renewcommand{\arraystretch}{2}%
  \rowcolors{0}{grey}{white}
  \begin{longtable}{|>{\setmenukeyswin}c |>{\setmenukeysmac}c |X|}
  \caption{Default keyboard shortcuts for Windows/Linux and Mac operating systems.} \\
  \hline
  \headerrowcolor
  \multicolumn{1}{|c|}{\sffamily{\textbf{Windows}} \faWindows\textsc{ /} \sffamily{\textbf{Linux}} \faLinux} & 
      \multicolumn{1}{c|}{\sffamily{\textbf{Mac}} \faApple} & 
      \multicolumn{1}{c|}{\sffamily{\textbf{Description}} \faComment} \\
  \hline
  \endfirsthead

  \multicolumn{3}{l}{\footnotesize \faChevronCircleLeft\ (from previous page)}\\[1em]
  \hline
  \headerrowcolor
  \multicolumn{1}{|c|}{\sffamily{\textbf{Windows}} \faWindows\textsc{ /} \sffamily{\textbf{Linux}} \faLinux} & 
      \multicolumn{1}{c|}{\sffamily{\textbf{Mac}} \faApple} & 
      \multicolumn{1}{c|}{\sffamily{\textbf{Description}} \faComment} \\
  \endhead
  \multicolumn{3}{r}{\footnotesize (continued next page) \faChevronCircleRight} 
  \endfoot
  \hline
  \endlastfoot
'''.lstrip()
SUB_HEADER = '  \subheaderrowcolor '
SUB_HEADER += '''\multicolumn{3}{|l|}{%(header)s} \\\\\n'''
SUB_HEADER += '  \hline\n'

SHORTCUT = '  \keys{%(winkey)s} & '
SHORTCUT += '\keys{%(mackey)s} & '
SHORTCUT += '%(description)s \\\\\n'
SHORTCUT += '  \hline\n'
try:
  u = urlopen(KEYBOARD_SHORTCUTS_URL)
  bs = BeautifulSoup(u.read(), 'html.parser')

  table = bs.find(lambda tag: tag.name=='table')
  rows = table.findAll(lambda tag: tag.name=='tr')
except:
  import sys
  sys.exit(0)

with open(OUTPUT_FILE, 'w') as w:
  w.write(OUTPUT_HEADER)
  for line in rows[1:]:
    sub_header = line.find(lambda tag: tag.name == 'th' and tag.has_attr('colspan') 
                and tag['colspan'] == '3')
    data = line.findAll(lambda tag: tag.name == 'td')
    # Format sub section
    if sub_header:
      w.write(
        SUB_HEADER % {'header': sub_header.text}
      )
    else:
      winkey = set_keys(data[1].text)
      mackey = set_keys(data[2].text)
      description = set_keys(data[0].text)
      w.write(
        SHORTCUT % {'winkey': winkey, 'mackey': mackey, 'description': description}
      )
  w.write(r'\end{longtable}')
  w.write(r'}')
  w.write(r'\quad')
