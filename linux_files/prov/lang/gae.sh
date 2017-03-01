#! /bin/sh

cd /tmp
wget https://storage.googleapis.com/appengine-sdks/featured/go_appengine_sdk_linux_amd64-1.9.48.zip
unzip go_appengine_sdk_linux_amd64-1.9.48.zip > /dev/null
mv go_appengine ~/.go_appengine

echo >> ~/.bashconf
echo 'export PATH="$HOME/.go_appengine:$PATH"' >> ~/.bashconf
