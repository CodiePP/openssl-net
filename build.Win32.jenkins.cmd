@echo off

rem set PLATFRM="x86"
set PLATFRM="Any CPU"

nuget restore -PackagesDirectory packages test\packages.config

sn -k ManagedOpenSsl\openssl-net.snk

msbuild /t:clean /p:Configuration="Debug" /p:Platform=%PLATFRM% openssl.net.Win32.sln
msbuild /p:Configuration="Debug" /p:Platform=%PLATFRM% openssl.net.Win32.sln

packages\NUnit.Runners.lite.2.6.4.20150512\nunit-console.exe bin\Debug\UnitTests.dll

rem NUnit test results in: TestResult.xml
