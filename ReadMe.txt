■ これは何?
和暦西暦変換 PowerShell です

■ どう使うの?
・西暦 -> 和暦
(ad2[TAB] で補完され AD2JapaneseCalendar が表示されます)

AD2JapaneseCalendar 9999/99/99

例) AD2JapaneseCalendar 1995/8/25

引数無しで今日の和暦を表示します


・和暦 -> 西暦
(jap[TAB] で補完され JapaneseCalendar2AD が表示されます)

JapaneseCalendar2AD 元号99/99/99
JapaneseCalendar2AD 元号99年99月99日

元号 : M/T/S/H/R/明治/大正/昭和/平成/令和

例) JapaneseCalendar2AD M34/4/29


■ Online Install 方法
以下コマンドを PowerShell プロンプトにコピペして下さい

$ScriptName = "ConvertCalendar"
$Module = $ScriptName + ".psm1"
$Installer =  "Install" + $ScriptName + ".ps1"
$UnInstaller = "UnInstall" + $ScriptName + ".ps1"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MuraAtVwnet/$ScriptName/master/$Module -OutFile ~/$Module
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MuraAtVwnet/$ScriptName/master/install.ps1 -OutFile ~/$Installer
Invoke-WebRequest -Uri https://raw.githubusercontent.com/MuraAtVwnet/$ScriptName/master/uninstall.ps1 -OutFile ~/$UnInstaller
& ~/$Installer
Remove-Item ~/$Module
Remove-Item ~/$Installer


■ リポジトリから Pull した場合の Install 方法
install.ps1 を実行してください

■ Uninstall 方法
Online でインストールした場合は ~/UnInstallTSV2MarkdownTable.ps1 を実行して下さい

リポジトリから Pull した場合は uninstall.ps1 を実行して下さい
(問い合わせが来たら Enter)


■ 動作確認環境
PowerShell 5.1
PowerShell 7.4.1


■ Web サイト
PowerShell で和暦/西暦変換
http://www.vwnet.jp/windows/PowerShell/2018122702/ConvJC.htm


■ リポジトリ
GitHub で公開しているので、最新版が欲しい方はこちらから Clone してください。

https://github.com/MuraAtVwnet/ConvertCalendar
git@github.com:MuraAtVwnet/ConvertCalendar.git



