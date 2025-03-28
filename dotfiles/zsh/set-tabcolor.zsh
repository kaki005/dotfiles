#!/bin/zsh
#### タブの色
if [ $TERM_PROGRAM="iTerm.app" ]; then
    # red, green, blue,yellow,lavender, Peach
    colors=("237 135 150" "166 218 149" "138 173 244" "238 212 159" "183 189 248", "245 169 127")
    tab_index=$(iterm_tab_index)
    tab_color  $=colors[$((tab_index))]
fi
