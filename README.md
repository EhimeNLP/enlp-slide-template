# スライドテンプレート (Beamer Theme)

愛媛大学自然言語処理研究室のスライドテンプレートをBeamerで再現するテーマです.

## インストール

### macOS / Linux

```sh
curl -fsSL https://raw.githubusercontent.com/EhimeNLP/enlp-slide-template/main/scripts/install.sh | sh
```

システム全体にインストールする場合は, 末尾を `| sh -s -- --texmflocal` に変えてください.

### Windows

PowerShellで以下を実行してください.

```powershell
$installer = curl.exe -fsSL https://raw.githubusercontent.com/EhimeNLP/enlp-slide-template/main/scripts/install.ps1 | Out-String
if ($LASTEXITCODE -ne 0) { throw 'Could not download the installer.' }
& ([scriptblock]::Create($installer))
```

システム全体にインストールする場合は, 管理者権限で起動したPowerShellで最後の行に `-System` を付けてください.

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

## License

See [LICENSE](LICENSE) for the BSD 2-Clause license and [Third-Party Notices](THIRD_PARTY_NOTICES.md) for third-party attribution and license terms.
