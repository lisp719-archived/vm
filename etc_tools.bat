curl -L http://download.forest.impress.co.jp/pub/library/c/clibor/10713/clibor.zip -o clibor.zip
curl -L http://download.sysinternals.com/files/Ctrl2Cap.zip -o Ctrl2Cap.zip

powershell expand-archive clibor.zip
powershell expand-archive Ctrl2Cap.zip
