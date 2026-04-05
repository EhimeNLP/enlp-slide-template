# ENLP Beamer Theme

ENLP スライドテンプレートを Beamer で再現するテーマです。

## 対応エンジン

- LuaLaTeX
- XeLaTeX
- pLaTeX
- upLaTeX

和欧混植が崩れないことを重視し、既定で以下のフォント構成を使います。

- 欧文サンセリフ: TeX Gyre Heros
- 欧文等幅: Latin Modern Mono
- 和文ゴシック: HaranoAji Gothic

## 使い方

Unicode 系エンジンでは通常どおりコンパイルできます。

```tex
\documentclass{beamer}
\usetheme{enlp}
```

pLaTeX / upLaTeX では `dvipdfmx` を必ず付けてください。

```tex
\documentclass[dvipdfmx]{beamer}
\usetheme{enlp}
```

## カスタムフォント

既存のエンジン標準コマンドを、そのまま `\usetheme{enlp}` の後で使えます。

- LuaLaTeX: `\setmainfont`, `\setsansfont`, `\setmonofont`, `\setmainjfont`, `\setsansjfont`
- XeLaTeX: `\setmainfont`, `\setsansfont`, `\setmonofont`, `\setCJKmainfont`, `\setCJKsansfont`
- pLaTeX / upLaTeX: `\rmdefault`, `\sfdefault`, `\ttdefault` の変更に加え、`pxchfon` の `\setminchofont`, `\setgothicfont` など

詳細な設定例は [docs/documentation.tex](/Users/yoneyama/workspace/github/enlp-slide-template/docs/documentation.tex) にあります。

## メモ

- タイトル・見出し・本文用の背景 PDF はテーマに同梱されています。
- 参考文献は `biblatex + biber` と BibTeX の両方を利用できます。
- `frame` 内で使った citation key は既定で自動収集され、footer に full citation が表示されます。
- 自動 footer citation を止めたい場合は `\usetheme[autocitefooter=false]{enlp}` を使います。
- footer の文献一覧を手動で固定したい場合は `\framefullcite{...}` を使います。
- 詳しい使い方は [docs/documentation.tex](/Users/yoneyama/workspace/github/enlp-slide-template/docs/documentation.tex) を参照してください。
