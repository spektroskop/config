if status is-interactive
  fish_config theme choose "Tomorrow Night Bright"
  set --global fish_pager_color_selected_background --background=4b454b
  set --global fish_greeting

  function install-lexical
    rm -rf ~/.local/share/lexical && mix package --path ~/.local/share/lexical
  end

  function lk
    set loc (walk $argv); and cd $loc;
  end

  eval (/opt/homebrew/bin/brew shellenv)
  eval (starship init fish)

  fish_add_path $HOME/.cabal/bin
  fish_add_path $HOME/.ghcup/bin
  fish_add_path $HOME/.cargo/bin
  fish_add_path $(go env GOPATH)/bin
  fish_add_path --prepend /opt/homebrew/opt/ruby/bin 
  fish_add_path --prepend /opt/homebrew/lib/ruby/gems/3.2.0/bin/
  fish_add_path --prepend /opt/homebrew/opt/postgresql@15/bin
  fish_add_path --prepend /opt/homebrew/opt/node@18/bin
  fish_add_path --prepend /opt/homebrew/opt/make/libexec/gnubin
  fish_add_path --prepend /opt/homebrew/opt/gnu-tar/libexec/gnubin
  fish_add_path --prepend $HOME/.local/share/lexical/bin
  fish_add_path --prepend $HOME/.local/bin --move

  set --export EDITOR hx
  set --export ERL_AFLAGS '-kernel shell_history enabled'
  set --export GOPATH $HOME/.local/share/go
  set --export KUBECONFIG admin.kubeconfig
  set --export XDG_CONFIG_HOME $HOME/.config
  set --export HOMEBREW_NO_ANALYTICS 1

  set --export NNN_COLORS '#50b0eeee;1234'
  set --export NNN_FCOLORS '000000000000000000000000'

  alias gf='gum filter --prompt="# " --indicator="+" --placeholder=""'
  alias k=kubecolor
  alias mv='mv -v'
  alias cp='cp -v'
  alias tailscale='/Applications/Tailscale.app/Contents/MacOS/Tailscale'
  alias gl='git log --graph --pretty=oneline --abbrev-commit'
  alias d='nnn -eAdHR'

  #source ~/.asdf/asdf.fish
  rtx activate fish | source
end
