@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build\build.config.cmd

echo -^> make %PRODUCT_NAME%

if exist temp\ rmdir /Q /S temp
if exist output\ rmdir /Q /S output

mkdir temp
mkdir output

7z x "vendor/node-v%PRODUCT_VERSION%-win-x64.zip" -aoa -otemp
move /Y "temp\node-v%PRODUCT_VERSION%-win-x64" "output\nodejs"

pushd output\nodejs
set PATH=%CD%;%PATH%
popd

mkdir output\modules

pushd output\modules

cmd.exe /C npm.cmd config --global set prefix "%CD%"
cmd.exe /C npm.cmd install -g acorn
cmd.exe /C npm.cmd install -g javascript-obfuscator
cmd.exe /C npm.cmd install -g uglify-js
cmd.exe /C npm.cmd install -g sass
cmd.exe /C npm.cmd install -g css-purge

popd

rmdir /Q /S output\nodejs\etc
rmdir /Q /S temp
