#│                                                                 coding: utf-8
#│ Solarized – http://ethanschoonover.com/solarized
#│
#│ Based on default.py
#│ git.savannah.gnu.org/cgit/ranger.git/tree/ranger/colorschemes/default.py
#│

from ranger.gui.color       import *
from ranger.gui.colorscheme import ColorScheme

class Default(ColorScheme):
    progress_bar_color = blue

    def use(self, context):
        fg, bg, attr = default_colors

        if context.reset:
            return default_colors

        elif context.in_browser:
            if context.selected:
                attr = reverse
            else:
                attr = normal
            if context.empty or context.error:
                bg = red
            if context.border:
                fg = default
            if context.media:
                if context.image:
                    fg = yellow
                else:
                    fg = magenta
            if context.container:
                fg = red
            if context.directory:
                fg = blue
            elif context.executable and not any((context.media, context.container, context.fifo, context.socket)):
                fg = green
            if context.socket:
                fg = magenta
            if context.fifo or context.device:
                fg = yellow
            if context.link:
                fg = context.good and cyan or magenta
            if context.tag_marker and not context.selected:
                if fg in (red, magenta):
                    fg = white
                else:
                    fg = red
            if not context.selected and (context.cut or context.copied):
                fg = black
            if context.main_column:
                if context.selected:
                    fg = yellow
                if context.marked:
                    fg = yellow
            if context.badinfo:
                if attr & reverse:
                    bg = magenta
                else:
                    fg = magenta

        elif context.in_titlebar:
            if context.hostname:
                fg = context.bad and red or green
            elif context.directory:
                fg = blue
            elif context.tab:
                if context.good:
                    bg = green
            elif context.link:
                fg = cyan

        elif context.in_statusbar:
            if context.permissions:
                if context.good:
                    fg = cyan
                elif context.bad:
                    fg = magenta
            if context.marked:
                attr |= reverse
                fg = yellow
            if context.message:
                if context.bad:
                    fg = red
            if context.loaded:
                bg = self.progress_bar_color
            if context.vcsinfo:
                fg = blue
            if context.vcscommit:
                fg = yellow

        if context.text:
            if context.highlight:
                attr |= reverse

        if context.in_taskview:
            if context.title:
                fg = blue

            if context.selected:
                attr |= reverse

            if context.loaded:
                if context.selected:
                    fg = self.progress_bar_color
                else:
                    bg = self.progress_bar_color

        if context.vcsfile and not context.selected:
            if context.vcsconflict:
                fg = magenta
            elif context.vcschanged:
                fg = red
            elif context.vcsunknown:
                fg = red
            elif context.vcsstaged:
                fg = green
            elif context.vcssync:
                fg = green
            elif context.vcsignored:
                fg = default

        elif context.vcsremote and not context.selected:
            if context.vcssync:
                fg = green
            elif context.vcsbehind:
                fg = red
            elif context.vcsahead:
                fg = blue
            elif context.vcsdiverged:
                fg = magenta
            elif context.vcsunknown:
                fg = red

        return fg, bg, attr
