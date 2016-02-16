powershell Invoke-RestMethod http://download.forest.impress.co.jp/pub/library/c/clibor/10713/clibor.zip -OutFile clibor.zip
powershell Invoke-RestMethod http://download.sysinternals.com/files/Ctrl2Cap.zip -OutFile Ctrl2Cap.zip

powershell expand-archive clibor.zip
powershell expand-archive Ctrl2Cap.zip

del clibor.zip
del Ctrl2Cap.zip

mkdir c:\tools
move clibor\clibor c:\tools
