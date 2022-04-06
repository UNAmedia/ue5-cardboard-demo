:: Copyright 2021 UNAmedia. All rights reserved.
::
:: Setup the local project to use a source distribution of the
:: "Cardboard VR" plugin.
@echo off

set PrjRoot=%~dp0

if [%1] == [] (
	ECHO Error: missing argument
	ECHO %0 ^<CARDBOARDVR_PLUGIN_SRC_DIR^>
	pause
	exit /b 1
)

set UPluginDir=%~f1
:: Remove any trailing slash.
:: IF %UPluginDir:~-1%==\ SET UPluginDir=%UPluginDir:~0,-1%

if not exist "%UPluginDir%\UNACardboardVR.uplugin" (
	echo ERROR: plugin descriptor not found in directory "%~1".
	exit /b 1
)

mkdir "%PrjRoot%\CardboardVRDemo\Plugins"
mklink /J "%PrjRoot%\CardboardVRDemo\Plugins\UNACardboardVR" "%UPluginDir%"

exit /b 0
