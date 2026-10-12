source ~/.zplug/init.zsh
zplug "zplug/zplug", hook-build:"zplug --self-manage"

# 非同期処理ができるプラグイン
# pureテーマで利用
zplug "mafredri/zsh-async"

# サブコマンドの補完
zplug "zsh-users/zsh-completions"
# 履歴を利用した入力時の補完
zplug "zsh-users/zsh-autosuggestions"

# テーマ
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# コマンドのシンタックス表示
zplug "zsh-users/zsh-syntax-highlighting"

# cdコマンドを使いやすくする
zplug "babarot/enhancd", use:init.sh

# インストールの確認
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load

# メモリに保存される履歴の件数
HISTSIZE=100000
# ファイルに保存される履歴の件数
SAVEHIST=100000

# cdコマンドを使わなくても移動可能にする
setopt auto_cd
# 補間候補を一覧表示
setopt auto_list
# Tabで補間候補を切り替える
setopt auto_menu
# pushdの自動実行
setopt auto_pushd
# ビープ音を消す
setopt nolistbeep
# 複数タブで履歴を教諭
setopt share_history
# 履歴に重複を表示しない
setopt hist_ignore_all_dups
# 履歴に重複するコマンドが保存されるときに古いものを削除
setopt hist_save_no_dups

# 補完の有効化
autoload -Uz compinit && compinit

export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# 補完の設定
# 補完の色設定
autoload colors
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi
# 対話的に補間結果を選択
# zstyle ':completion:*' menu select interactive
setopt menu_complete

# lsに色をつける
alias ls="ls -GF"
# pushdしたディレクトリに移動
alias cds='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'

# Ansibleの設定
export ANSIBLE_VAULT_PASSWORD_FILE="~/.vault_pass"

