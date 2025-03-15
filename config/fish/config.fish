if status is-interactive
    # Commands to run in interactive sessions can go here
end


# 自动启动ssh-agent if尚未启动
if not set -q SSH_AUTH_SOCK
    set -l pid (ssh-agent -s | grep -oP 'SSH_AGENT_PID=\K\d+')
    set -l sock (ssh-agent -s | grep -oP 'SSH_AUTH_SOCK=\K[^;]+')

    set -gx SSH_AGENT_PID $pid
    set -gx SSH_AUTH_SOCK $sock
end
# turn off fish shell welcome
function fish_greeting
end

# Set up fzf key bindings
fzf --fish | source

# Open in tmux popup if on tmux, otherwise use --height mode
set -gx FZF_DEFAULT_OPTS (test -n "$TMUX" && echo "--tmux bottom,40%" || echo "--height 40%")" --layout reverse --border top"

# starship
starship init fish | source

# lazygit alias
alias lg='lazygit'

# RsProxy ====> Rust CN
set -x RUSTUP_UPDATE_ROOT https://rsproxy.cn/rustup
set -x RUSTUP_DIST_SERVER https://rsproxy.cn

# eza alias ls
# ---- Eza (better ls) -----
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"

# zoxide && cd
zoxide init fish | source
alias cd="z"

# set default editor
set -x EDITOR nvim

# yazi
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# 使用 fd 和 fzf 查找文件并用 neovim 打开
function find_file
    set -l file (fd --type f | fzf --preview 'bat --color=always {}')
    if test -n "$file"
        nvim "$file"
    end
end

# 绑定快捷键
bind \cf find_file

