# Fish ::<>
set -l platform_os (uname -s | string lower)
# set -l platform_arch (uname -m | string lower)

set -g fish_greeting ""

if status is-interactive
    set -g fish_key_bindings fish_hybrid_key_bindings
end

if status is-interactive
    # https://github.com/jethrokuan/fzf/wiki/FZF-Tab-Completions
    set -gx FZF_COMPLETE 0
end

# Wildcard "do not track"
set -gx DO_NOT_TRACK 1

# Homebrew
set -l brew
for path in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew
    if test -x $path
        set brew $path
        break
    end
end

if test -n "$brew"
    # set -x HOMEBREW_BOTTLE_DOMAIN https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
    eval ($brew shellenv)
    set -gx HOMEBREW_NO_ANALYTICS 1
    set -gx HOMEBREW_NO_AUTO_UPDATE 1
    set -gx HOMEBREW_BUNDLE_FILE $HOME/.config/Brewfile
end

# Nix
fish_add_path -gm $HOME/.nix-profile/bin

# Abbreviations and aliases
if status is-interactive
    abbr -g cat bat
    abbr -g cloc tokei
    alias docker podman
    abbr -g du dust
    abbr -g e '$EDITOR'
    abbr -g gitui lazygit
    abbr -g la eza -a
    abbr -g less bat
    abbr -g ll eza -lah
    abbr -g ls eza
    abbr -g n yy
    abbr -g neofetch fastfetch
    abbr -g nnn yazi
    abbr -g obliviate history clear-session
    type -q pacman || abbr -g pacman pacaptr
    abbr -g proxychains proxychains4
    abbr -g tcping ting
    abbr -g tmux zellij
    abbr -g vim nvim
    abbr -g youtube-dl yt-dlp
end

# Helpers
function sorry
    history delete -C (history | grep --invert-match sorry | head --lines 1)
end

function loadenv
    bass "set -a; source $argv; set +a"
end

function fish_remove_path
    for path in $argv
        while set -l i (contains -i -- (path normalize $path) $PATH)
            set -e PATH[$i]
        end
    end
end

# Proxies
function set_proxies
    if test (count $argv) -ne 1
        echo "usage: set_proxies ENDPOINT"
        return 1
    end
    set -l endpoint $argv
    set -gx https_proxy http://$endpoint
    set -gx HTTPS_PROXY $https_proxy
    set -gx http_proxy http://$endpoint
    set -gx HTTP_PROXY $http_proxy
    set -gx all_proxy socks5://$endpoint
    set -gx ALL_PROXY $all_proxy
end

function unset_proxies
    set -e https_proxy HTTPS_PROXY http_proxy HTTP_PROXY all_proxy ALL_PROXY
end

# set_proxies 127.0.0.1:1087

# Neovim
set -gx EDITOR nvim
fish_add_path -gam $HOME/.local/share/nvim/mason/bin

# Bitwarden SSH Agent
if test $platform_os = darwin
    set -gx SSH_AUTH_SOCK $HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock
end

# Bat
set -gx BAT_THEME base16-256
set -gx MANPAGER less

# Haskell
set -gx GHCUP_USE_XDG_DIRS 1
fish_add_path -gam $HOME/.local/bin

# Rust
set -gx RUSTUP_AUTO_INSTALL 0
test -n "$brew" && fish_add_path -gam (brew --prefix rustup)/libexec/bin
fish_add_path -gam $HOME/.cargo/bin

# Go
set -gx GOPATH $HOME/.go
fish_add_path -gam $GOPATH/bin

# Java
if test $platform_os = darwin
    set -gx JAVA_HOME (/usr/libexec/java_home)
end

# Launch Starship
# See: <https://github.com/koekeishiya/yabai/issues/267#issuecomment-536159221>
if status is-interactive
    # Make `$fish_private_mode` visible to starship.
    test -n "$fish_private_mode" && set -x FISH_PRIVATE_MODE $fish_private_mode
    starship init fish | source
end
