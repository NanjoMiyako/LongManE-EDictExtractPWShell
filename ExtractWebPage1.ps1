#保存したhtmlページのファイルのリストがあるフォルダに移動
cd C:\hogehoge\powerShellScript\htmlPages

$fNameList = Get-ChildItem -File -name

$fullPathName = ''

#htmlファイルからURLの一覧を抽出するためのファイルを作成する
Write-Output '' | Set-Content -Encoding UTF8 C:\hogehoge\powerShellScript\ExtractURLData1\URLList1.txt

foreach($fName in $fNameList){

    #ファイル名をフルパスに変更
    $fullPathName = 'C:\hogehoge\powerShellScript\htmlPages\'+$fName

   
    $f1 = (Get-Content -Encoding UTF8  $fullPathName) -as [string[]]

    $i = 1

    $searchStr1 = 'a href="/jp'
    $exceptStr1 = 'title='
    $exceptStr2 = 'topics.html'

    foreach ($l in $f1) {
        if($l.indexOf($searchStr1) -ne -1) {
            if($l.indexOf($exceptStr1) -eq -1){
                if($l.indexOf($exceptStr2) -eq -1){
                $l2 = $l
                $l2 = $l2 -replace '<a href="', ''
                $l2 = $l2 -replace '">', ''
                $l2 = "https://www.ldoceonline.com"+$l2
                $l2 = $l2 -replace ' ', ''

                #htmlファイルから抽出したURLをファイルに追記する
                Write-Output $l2 | Add-Content -Encoding UTF8 C:\hogehoge\Desktop\powerShellScript\ExtractURLData1\URLList1.txt
                
                }
            }
        }
        $i++
    }
}