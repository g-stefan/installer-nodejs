@echo off
rem Public domain
rem http://unlicense.org/
rem Created by Grigore Stefan <g_stefan@yahoo.com>

if not exist vendor\ mkdir vendor

set WEB_LINK=https://nodejs.org/dist/v12.18.3/node-v12.18.3-win-x64.zip
if not exist vendor\node-v12.18.3-win-x64.zip curl --insecure --location %WEB_LINK% --output vendor\node-v12.18.3-win-x64.zip
