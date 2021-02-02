#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Terminal Sexy 24 scheme by Laurent Granié based on default terminal.sexy (https://terminal.sexy)

color00="1D/1F/21" # Base 00 - Black
color01="A5/42/42" # Base 08 - Red
color02="8C/94/40" # Base 0B - Green
color03="DE/93/5F" # Base 0A - Yellow
color04="5F/81/9D" # Base 0D - Blue
color05="85/67/8F" # Base 0E - Magenta
color06="5E/8D/87" # Base 0C - Cyan
color07="D5/D8/D6" # Base 05 - White
color08="C5/C8/C6" # Base 03 - Bright Black
color09="CC/66/66" # Base 10 - Bright Red
color10="B5/BD/68" # Base 12 - Bright Green
color11="F0/C6/74" # Base 11 - Bright Yellow
color12="81/A2/BE" # Base 14 - Bright Blue
color13="B2/94/BB" # Base 15 - Bright Magenta
color14="8A/BE/B7" # Base 13 - Bright Cyan
color15="B5/B8/B6" # Base 07 - Bright White
color16="C5/C8/C6" # Base 09 - Bright orange
color17="70/78/80" # Base 0F - orange
color18="28/2A/2E" # Base 01
color19="37/3B/41" # Base 02
color20="37/3B/41" # Base 04
color21="E5/E8/E6" # Base 06
color_foreground="D5/D8/D6" # Base 05
color_background="1D/1F/21" # Base 00

if [ -n "$TMUX" ]; then
  # Tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  put_template() { printf '\033Ptmux;\033\033]4;%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_var() { printf '\033Ptmux;\033\033]%d;rgb:%s\033\033\\\033\\' $@; }
  put_template_custom() { printf '\033Ptmux;\033\033]%s%s\033\033\\\033\\' $@; }
elif [ "${TERM%%[-.]*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  put_template() { printf '\033P\033]4;%d;rgb:%s\007\033\\' $@; }
  put_template_var() { printf '\033P\033]%d;rgb:%s\007\033\\' $@; }
  put_template_custom() { printf '\033P\033]%s%s\007\033\\' $@; }
elif [ "${TERM%%-*}" = "linux" ]; then
  put_template() { [ $1 -lt 16 ] && printf "\e]P%x%s" $1 $(echo $2 | sed 's/\///g'); }
  put_template_var() { true; }
  put_template_custom() { true; }
else
  put_template() { printf '\033]4;%d;rgb:%s\033\\' $@; }
  put_template_var() { printf '\033]%d;rgb:%s\033\\' $@; }
  put_template_custom() { printf '\033]%s%s\033\\' $@; }
fi

# 16 color space
put_template 0 $color00
put_template 1 $color01
put_template 2 $color02
put_template 3 $color03
put_template 4 $color04
put_template 5 $color05
put_template 6 $color06
put_template 7 $color07
put_template 8 $color08
put_template 9 $color09
put_template 10 $color10
put_template 11 $color11
put_template 12 $color12
put_template 13 $color13
put_template 14 $color14
put_template 15 $color15

# 256 color space
put_template 16 $color16
put_template 17 $color17
put_template 18 $color18
put_template 19 $color19
put_template 20 $color20
put_template 21 $color21

# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  put_template_custom Pg d5d8d6 # foreground
  put_template_custom Ph 1d1f21 # background
  put_template_custom Pi d5d8d6 # bold color
  put_template_custom Pj 373b41 # selection color
  put_template_custom Pk d5d8d6 # selected text color
  put_template_custom Pl d5d8d6 # cursor
  put_template_custom Pm 1d1f21 # cursor text
else
  put_template_var 10 $color_foreground
  if [ "$BASE16_SHELL_SET_BACKGROUND" != false ]; then
    put_template_var 11 $color_background
    if [ "${TERM%%-*}" = "rxvt" ]; then
      put_template_var 708 $color_background # internal border (rxvt)
    fi
  fi
  put_template_custom 12 ";7" # cursor (reverse video)
fi

# clean up
unset -f put_template
unset -f put_template_var
unset -f put_template_custom
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color16
unset color17
unset color18
unset color19
unset color20
unset color21
unset color_foreground
unset color_background
