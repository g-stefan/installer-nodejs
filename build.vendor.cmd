@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

call build.config.cmd

echo -^> vendor %PRODUCT_NAME%

if not exist vendor\ mkdir vendor

set WEB_LINK=https://nodejs.org/dist/v%PRODUCT_VERSION%/node-v%PRODUCT_VERSION%-win-x64.zip
if not exist vendor\node-v%PRODUCT_VERSION%-win-x64.zip curl --insecure --location %WEB_LINK% --output vendor\node-v%PRODUCT_VERSION%-win-x64.zip
