#!/bin/sh
# base16-shell (https://github.com/chriskempson/base16-shell)
# Base16 Shell template by Chris Kempson (http://chriskempson.com)
# Horizon Dark scheme by Michaël Ball (http://github.com/michael-ball/)

color00="16/16/1C" # Base 00 - Black
color01="DA/10/3F" # Base 08 - Red
color02="09/F7/A0" # Base 0B - Green
color03="F7/7D/26" # Base 0A - Yellow
color04="1D/89/91" # Base 0D - Blue
color05="89/31/B9" # Base 0E - Magenta
color06="26/BB/D9" # Base 0C - Cyan
color07="F9/CB/BE" # Base 05 - White
color08="2E/30/3E" # Base 03 - Bright Black
color09="E9/56/78" # Base 08 - Bright Red
color10="07/DA/8C" # Base 0B - Bright Green
color11="FA/C2/9A" # Base 0A - Bright Yellow
color12="25/B2/BC" # Base 0D - Bright Blue
color13="B8/77/DB" # Base 0E - Bright Magenta
color14="59/E3/E3" # Base 0C - Bright Cyan
color15="FD/F9/ED" # Base 07 - Bright White
color16="F6/66/1E" # Base 09
color17="DC/33/18" # Base 0F
color18="1A/1C/23" # Base 01
color19="23/25/30" # Base 02
color20="F9/CE/C3" # Base 04
color21="FA/DA/D1" # Base 06
color_foreground="F9/CB/BE" # Base 05
color_background="16/16/1C" # Base 00

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
put_template 0  $color00
put_template 1  $color01
put_template 2  $color02
put_template 3  $color03
put_template 4  $color04
put_template 5  $color05
put_template 6  $color06
put_template 7  $color07
put_template 8  $color08
put_template 9  $color09
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
  put_template_custom Pg f9cbbe # foreground
  put_template_custom Ph 16161c # background
  put_template_custom Pi f9cbbe # bold color
  put_template_custom Pj 232530 # selection color
  put_template_custom Pk f9cbbe # selected text color
  put_template_custom Pl f9cbbe # cursor
  put_template_custom Pm 16161c # cursor text
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
