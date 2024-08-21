# ====================
# config
# ====================
# 新しく作られたファイルのパーミッションを 644 に
umask 022
# リダイレクションによるファイルの上書きを禁止
set -o noclobber
# cdコマンドの補完ではディレクトリのみを対象にする
complete -d cd

# =====================
# alias
# =====================
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'
