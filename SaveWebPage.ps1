#URLリストが書かれているファイルがあるフォルダに移動
cd C:\hogehoge\powerShellScript\input
$f = (Get-Content -Encoding UTF8  URLList1.html) -as [string[]]

$saveFileName = ''

#htmlファイルを保存するためのフォルダに移動
cd C:\hogehoge\powerShellScript\htmlPages

$i = 1
foreach ($l in $f) {
    $saveFileName = 'page'+$i+'.html'
    Invoke-WebRequest $l -OutFile $saveFileName
    $i++
}

