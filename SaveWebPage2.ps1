#URLリストが書かれているファイルがあるフォルダに移動
cd C:\hogehoge\ExtractURLData1
$f = (Get-Content -Encoding UTF8  URLList1.txt) -as [string[]]

$saveFileName = ''

#htmlファイルを保存するためのフォルダに移動
cd C:\hogehoge\powerShellScript\htmlPages2

$i = 1
foreach ($l in $f) {
    $saveFileName = 'page'+$i+'.html'
    Invoke-WebRequest $l -OutFile $saveFileName
    $i++
}

