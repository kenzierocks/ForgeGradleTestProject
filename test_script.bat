@echo off
SETLOCAL

if "%~1"=="" (
	echo You must supply the memory to use ^(first arg^)
	exit /B 1
)
set mem=%~1
if "%~2"=="" (
	echo You must supply the OS you are on ^(second arg^)
	exit /B 1
)
set os=%~2

:: Clean current version from caches
set "caches=%UserProfile%\.gradle\caches\minecraft\net\minecraftforge\forge\1.11-13.19.1.2199"
if exist %caches% (
	del /S /F /Q %caches% >nul
)
set "file=%os%_memory_%mem%G.txt"
echo ^>set "GRADLE_OPTS=-Xmx%mem%G" > %file%
echo ^>set "GRADLE_OPTS=-Xmx%mem%G"
set "GRADLE_OPTS=-Xmx%mem%G"
set "cmd=gradlew setupDecompWorkspace --info --no-daemon"
echo ^>%cmd% > %file%
echo ^>%cmd%
:: No good way to tee here...
%cmd% >> %file%
ENDLOCAL
