# スライドテンプレート (Beamer Theme)

愛媛大学自然言語処理研究室のスライドテンプレートをBeamerで再現するテーマです.

## インストール

### Local

まず, 本リポジトリをローカル環境にクローンしてください.

```bash
git clone https://github.com/EhimeNLP/enlp-slide-template.git
cd enlp-slide-template
```

#### Windows / macOS / Linux

`l3build` を使用して, `TEXMFHOME` に追加してください.

```bash
l3build install
```

### Overleaf

[Releases](https://github.com/EhimeNLP/enlp-slide-template/releases)から最新バージョンの `enlp-slide-template-v*.zip` を取得して, Overleafのプロジェクトに配置してください.

## 使用方法

使用方法については, [documentation.pdf](docs/documentation.pdf)を参照してください.

### LuaLaTeX でフォントが変わらない場合

このテーマはスライド本文を sans-serif / gothic 系で組むので, `ltjsarticle` と違って `\setmainfont` / `\setmainjfont` だけでは見た目があまり変わりません. 本文の和欧混植をまとめて変えたい場合は, `\usetheme{enlp}` の後で `\setsansfont` と `\setsansjfont` を使ってください.

```tex
\usetheme{enlp}
\setsansfont[BoldFont=*Bold,FakeBold=2.5]{LINE Seed JP}
\setsansjfont[BoldFont=*Bold,FakeBold=2.5]{LINE Seed JP}
```

` \setmainfont[...] ` のあとにもう一度 ` \setmainfont{...} ` を書くと, 後ろの指定で前のオプションが上書きされる点にも注意してください.
