# Guard ├───────────────────────────────────────────────────────────────────────

if not status --is-interactive
  exit
end

# https://github.com/fish-shell/fish-shell/issues/1301

# Basic options ├───────────────────────────────────────────────────────────────

# Remove
# "Welcome to fish, the friendly interactive shell" message.
set fish_greeting ''

if test $TERM = linux
  source ~/.tty/colors/solarized
end

# Environment ├─────────────────────────────────────────────────────────────────

# Path
set --global --export PATH .                     $PATH
set --global --export PATH $HOME/bin             $PATH
set --global --export PATH $HOME/local/bin       $PATH
set --global --export PATH $HOME/.gem/ruby/*/bin $PATH
set --global --export PATH $HOME/go/bin          $PATH
set --global --export PATH node_modules/.bin     $PATH

set --global --export GOPATH ~/go
set --global --export LUA_PATH \
(
  for lib in (ls ~/moon)
    printf ~/moon/$lib/lib/'?'.lua';'
  end
)
set --global --export RUBYLIB \
(
  for lib in (ls ~/ruby)
    printf ~/ruby/$lib/lib':'
  end
)

# XDG
set --global --export XDG_DATA_HOME   $HOME/.local/share
set --global --export XDG_CACHE_HOME  $HOME/.cache
set --global --export XDG_CONFIG_HOME $HOME/.config

# TMP
set --global --export TMP /tmp

set --global --export BROWSER         chromium
set --global --export MAILER          sup
set --global --export PAGER           less
set --global --export GREPER          ag
set --global --export EDITOR          kak
set --global --export EXPLORER        ranger
set --global --export MEDIA_PLAYER    mpv
set --global --export IMAGE_VIEWER    sxiv
set --global --export DOCUMENT_VIEWER zathura
set --global --export TERMINAL        termite

# GUI
set --global --export GUI

# OPAM (OCaml package manager) environment
eval (opam config env --shell fish)

# Colors ├──────────────────────────────────────────────────────────────────────

set normal  (set_color normal)
set magenta (set_color magenta)
set yellow  (set_color yellow)
set green   (set_color green)
set red     (set_color red)

set bold_red   (set_color --bold red)
set bold_white (set_color --bold white)

eval (dircolors --c-shell ~/repositories/dircolors-solarized/dircolors.ansi-dark)

# Prompt ├──────────────────────────────────────────────────────────────────────

# 1│
# 2│ alex at othala in ~/dotfiles on master
# 3│ ><((°>

function fish_prompt

  set last_status $status

  echo # aerate between each command

  printf "$magenta%s$normal at $yellow%s$normal in $green%s$normal" (whoami) (hostname) (pwd)

  if git root >/dev/null 2>&1
    printf " on $magenta%s$normal $green%s$normal" (git current-branch ^/dev/null) (git_prompt_status_signs)
  end

  printf ' '

  printf "$bold_red%s$normal" (switch $last_status
    case '0'                      ;;
    case '1'                      ;;
    case '2'                      ;; printf '%d → Syntax error'                $last_status
    case '126'                    ;; printf '%d → Cannot execute'              $last_status
    case '127'                    ;; printf '%d → Command not found'           $last_status
    case '128'                    ;; printf '%d → Invalid exit status'         $last_status
    case '130'                    ;; printf '%d → Killed by <c-c> (%d status)' $last_status (math $last_status - 128)
    case (seq 128 (math 128 + 9)) ;; printf '%d → Killed with %d status'       $last_status (math $last_status - 128)
    case '255'                    ;; printf '%d → Exit should be (0→255)'      $last_status
    case '*'                      ;; printf '%d → Exit status not handled'     $last_status
  end)

  echo

  switch $last_status
    case '0'; printf "$bold_white><((°>$normal"
    case '*'; printf "$bold_red><((ˣ>$normal"
  end

  printf ' '

end

#│
#├──────────────────────────────────────────────────────────────────────────────
#│ # On branch master
#│ nothing to commit, working directory clean
#├──────────────────────────────────────────────────────────────────────────────
#│ bashrc   dwb/         git/       Guardfile                           powerline/  ranger/                     xinitrc
#│ bin/     fish/        gitconfig  i3/                                 pryrc       redshift.conf               xkbrc
#│ config/  fontconfig/  gtk-3.0/   kak/       msmtprc                  quvirc      signature                   Xmodmap
#│          fonts/       gtkrc-2.0  mailcap                             Rakefile    test/
#│

# Comment hook section
# Reason: 'cd' completion uses 'cd', so pressing <tab> will trigger hook_cd
# https://github.com/fish-shell/fish-shell/blob/master/share/functions/__fish_complete_cd.fish

# function --on-variable PWD hook_cd
#
#   if test $PWD = (git root 2>/dev/null) 2>/dev/null
#
#     set_color green
#       printf ─%.0s (seq (tput cols))
#     set_color normal
#
#     git status
#
#     set_color green
#       printf ─%.0s (seq (tput cols))
#     set_color normal
#
#   end
#
#   ls
#
# end

# Useful functions ├────────────────────────────────────────────────────────────

function pwd
  printf $PWD | sed "s|$HOME|~|"
end

function path
  set PATH (pwd)/$argv $PATH
end

function redraw
  clear; fish_prompt
end

function fish_append_command_line
  set command $argv[1]

  if commandline --current-job | grep --invert-match $command'$' >/dev/null
    commandline --append --current-job $command
  end
end

function fish_menu_history
  fish --command "eval (history | unique | $argv)"
end

# Aliases ├─────────────────────────────────────────────────────────────────────

alias a attach
alias h man
alias H help
alias m $MAILER
alias v $EDITOR
alias V $EXPLORER
alias g git
alias G tig
alias L ag\ --nocolor
alias s periscope
alias b bulk\ edit

# Music player

alias mp  mpv\ --no-video
alias mps  mp\ --shuffle

# Hijack

alias cp clone
alias rm trash
alias ssh mosh
alias grep ag\ --smart-case
alias gist gist\ --open

# Do not forget to attach
# alias kak      attach\ kak
alias rtorrent attach\ rtorrent
alias weechat  attach\ weechat

# Directories

alias - cd\ -
alias .. cd\ ..
alias ... cd\ ../..
alias .... cd\ ../../..
alias ..... cd\ ../../../..

for i in (seq 1 6)
  alias  l$i "tree --dirsfirst -ChFL     $i" ;; alias  l  l1
  alias ll$i "tree --dirsfirst -ChFupDaL $i" ;; alias ll ll1
end

# Paludis

alias cave caverne

alias cr 'sudo cave resolve --execute'
alias cs 'cave show --complex-keys'
alias cP 'cave print-id-contents'
alias cl 'find-time /var/log/paludis -type f | eval $PAGER'

# REPLs
alias cl lein\ repl
alias hs ghci
alias js rhino
alias py bpython
alias rb pry
alias sc scala

# Convenience mappings ├────────────────────────────────────────────────────────

function fish_user_key_bindings

  # Completion
  bind \cn accept-autosuggestion

  # Piping
  bind \ep 'fish_append_command_line "|$PAGER;"'
  bind \eg 'fish_append_command_line "|$GREPER;"'
  bind ‐   'xdotool key ampersand Return Return'
end
