curl -L http://download.forest.impress.co.jp/pub/library/c/clibor/10713/clibor.zip -o clibor.zip
curl -L http://download.sysinternals.com/files/Ctrl2Cap.zip -o Ctrl2Cap.zip
curl -L https://files.gyazo.com/setup/Gyazo-3.1.6.exe -o gyazo.exe

powershell expand-archive clibor.zip
powershell expand-archive Ctrl2Cap.zip

curl -L https://download.jetbrains.com/idea/ideaIC-15.0.1.exe -o ideaIC-15.0.1.exe

