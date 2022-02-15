@ECHO off

if not exist "openssl-1.1.1m" (
   @echo Downloading OpenSSL...
   curl -L https://mirror.firedaemon.com/OpenSSL/openssl-1.1.1m.zip > openssl-1.1.1m.zip
   @echo Unpacking OpenSSL...
   mkdir .\openssl-1.1.1m
   tar -xf openssl-1.1.1m.zip -C .\openssl-1.1.1m --strip-components=1
   @echo Deleting openssl-1.1.1m.zip file
   del openssl-1.1.1m.zip
)

@echo Starting the build...
set OPENSSL_ROOT_DIR=%cd%\openssl-1.1.1m\x64
npm install
