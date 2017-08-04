#!/bin/sh

set PLATFRM="Any CPU"

nuget restore -PackagesDirectory packages test/packages.config

sn -k ManagedOpenSsl/openssl-net.snk

xbuild /t:clean /p:Configuration="Debug" /p:Platform=${PLATFRM} openssl.net.Linux.sln
xbuild /p:Configuration="Debug" /p:Platform=${PLATFRM} openssl.net.Linux.sln

packages/NUnit.Runners.lite.2.6.4.20150512/nunit-console.exe -labels bin/Debug/UnitTests.dll

# NUnit test results in: TestResult.xml
