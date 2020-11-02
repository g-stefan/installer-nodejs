@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> make %PRODUCT_NAME%

if exist build\ rmdir /Q /S build
if exist release\ rmdir /Q /S release

mkdir build
mkdir release

7z x "vendor/node-v%PRODUCT_VERSION%-win-x64.zip" -aoa -obuild
move /Y "build\node-v%PRODUCT_VERSION%-win-x64" "release\nodejs"

pushd release\nodejs
set PATH=%CD%;%PATH%
popd

mkdir release\modules

pushd release\modules

cmd.exe /C npm.cmd config --global set prefix "%CD%"
cmd.exe /C npm.cmd install -g acorn
cmd.exe /C npm.cmd install -g javascript-obfuscator
cmd.exe /C npm.cmd install -g uglify-js
cmd.exe /C npm.cmd install -g sass
cmd.exe /C npm.cmd install -g css-purge

popd

rmdir /Q /S release\nodejs\etc
rmdir /Q /S build
