# m2h
簡易Markdown → HTML変換ツール

## 使い方
install.shを実行するとm2hコマンドが使えるようになります。

e.g.  
hoge.mdをHTMLに変換して画面に表示し、ブラウザでも確認する。

`$ m2h hoge.md`

HTMLへの変換のみ（ブラウザは起動しない）

`$ m2h (-s|--silent) hoge.md`

## 良いところ
エディタなどの外部環境に依存しません

## 注意！
Text::Markdown::Discountをインストールする際は**以下の手順**に従ってください。

`$ tar zxvf Text-Markdown-Discount-0.11.tar.gz`

`$ cd Text-Markdown-Discount-0.11`

Makefile.PLの中の

>qq{( cd $extdir; CC='cc -fPIC' sh configure.sh; make )\n}

を

>qq{( cd $extdir; CC='cc -fPIC' sh configure.sh --with-fenced-code; make )\n} 

に変更。

`$ cpanm .`

## 環境
今のところMacのみ対応
