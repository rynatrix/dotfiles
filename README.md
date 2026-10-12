# dotfiles
設定をまとめたファイル群。

## インストール方法
リポジトリをダウンロードする。

```sh
$ git clone https://github.com/rynatrix/dotfiles.git
```

## Zshの設定
zplugをインストールした環境で、`~/.zshrc`に次の設定を追加する。

```sh
source ~/dotfiles/init.zsh
```

SSH鍵、SSH設定、個人用のGit設定は、このリポジトリに含めず別途管理する。
