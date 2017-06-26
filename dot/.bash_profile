#
# ~/.bash_profile
#

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
#export VDPAU_DRIVER=va_gl

sudo loadkeys ~/xkb/keymap/macbook78

[[ -f ~/.bashrc ]] && . ~/.bashrc
