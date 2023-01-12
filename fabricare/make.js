// Created by Grigore Stefan <g_stefan@yahoo.com>
// Public domain (Unlicense) <http://unlicense.org>
// SPDX-FileCopyrightText: 2022 Grigore Stefan <g_stefan@yahoo.com>
// SPDX-License-Identifier: Unlicense

Fabricare.include("vendor");

// ---

messageAction("make");

if (Shell.fileExists("temp/build.done.flag")) {
	return;
};

Shell.removeDirRecursivelyForce("output");
Shell.removeDirRecursivelyForce("temp");

Shell.mkdirRecursivelyIfNotExists("output");
Shell.mkdirRecursivelyIfNotExists("temp");

Shell.system("7z x \"vendor/node-v" + Project.version + "-win-x64.zip\" -aoa -otemp");
Shell.rename("temp/node-v" + Project.version + "-win-x64","output/nodejs");

Shell.setenv("PATH", Shell.getcwd() + "\\output\\nodejs;" + Shell.getenv("PATH"));

Shell.mkdirRecursivelyIfNotExists("output/modules");

runInPath("output/modules", function() {

	Shell.system("cmd.exe /C npm.cmd config --global set prefix \"" + Shell.getcwd() + "\"");
	Shell.system("cmd.exe /C npm.cmd install -g acorn");
	Shell.system("cmd.exe /C npm.cmd install -g javascript-obfuscator");
	Shell.system("cmd.exe /C npm.cmd install -g uglify-js");
	Shell.system("cmd.exe /C npm.cmd install -g sass");
	Shell.system("cmd.exe /C npm.cmd install -g css-purge");

});

Shell.removeDirRecursivelyForce("output/nodejs/etc");
Shell.removeDirRecursivelyForce("temp");

Shell.mkdirRecursivelyIfNotExists("temp");
Shell.filePutContents("temp/build.done.flag", "done");
