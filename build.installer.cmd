@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

echo -^> installer nodejs

if exist installer\ rmdir /Q /S installer
mkdir installer

if exist build\ rmdir /Q /S build
mkdir build

makensis.exe /NOCD "util\nodejs-installer.nsi"

call grigore-stefan.sign "NodeJS" "installer\nodejs-12.18.3-installer.exe"

if exist build\ rmdir /Q /S build
