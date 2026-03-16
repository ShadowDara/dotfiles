@echo off

rem Easy Folder Switcher

rem Set the Folders
set "FOL1=C:\Users\%USERNAME%\Downloads"
set "FOL2=%USERPROFILE%\Documents"
set "FOL3=%USERPROFILE%\Pictures"
set "FOL4="
set "FOL5="
set "FOL6="
set "FOL7="
set "FOL8="
set "FOL9="
set "FOL10="
set "FOL11="
set "FOL12="
set "FOL13="
set "FOL14="
set "FOL15="
set "FOL16="
set "FOL17="
set "FOL18="
set "FOL19="
set "FOL20="
set "FOL21="

rem Set the Foldernames
set "FOL1NAME=Downloads             "
set "FOL2NAME=Documents             "
set "FOL3NAME=Pictures              "
set "FOL4NAME=                      "
set "FOL5NAME=                      "
set "FOL6NAME=                      "
set "FOL7NAME=                      "
set "FOL8NAME=                      "
set "FOL9NAME=                      "
set "FOL10NAME=                      "
set "FOL11NAME=                      "
set "FOL12NAME=                      "
set "FOL13NAME=                      "
set "FOL14NAME=                      "
set "FOL15NAME=                      "
set "FOL16NAME=                      "
set "FOL17NAME=                      "
set "FOL18NAME=                      "
set "FOL19NAME=                      "
set "FOL20NAME=                      "
set "FOL21NAME=                      "

rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f4-name') do set FOL4NAME=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f5-name') do set FOL5NAME=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f6-name') do set FOL6NAME=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f7-name') do set FOL7NAME=%%a

:MENU
echo Folder Switcher
echo 0) Exit					11) %FOL11NAME%
echo 1) %FOL1NAME%				12) %FOL12NAME%
echo 2) %FOL2NAME%				13) %FOL13NAME%
echo 3) %FOL3NAME%				14) %FOL14NAME%
echo 4) %FOL4NAME%				15) %FOL15NAME%
echo 5) %FOL5NAME%				16) %FOL16NAME%
echo 6) %FOL6NAME%				17) %FOL17NAME%
echo 7) %FOL7NAME%				18) %FOL18NAME%
echo 8) %FOL8NAME%				19) %FOL19NAME%
echo 9) %FOL9NAME%				20) %FOL20NAME%
echo 10) %FOL10NAME%     			21) %FOL21NAME%
set /p choice=Your Choice ===^> 

rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f4') do set FOL4=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f5') do set FOL5=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f6') do set FOL6=%%a
rem for /f "delims=" %%a in ('sx.exe --windows-foldertool-batch-f7') do set FOL7=%%a

if "%choice%"=="0" goto END
if "%choice%"=="1" goto GO1
if "%choice%"=="2" goto GO2
if "%choice%"=="3" goto GO3
if "%choice%"=="4" goto GO4
if "%choice%"=="5" goto GO5
if "%choice%"=="6" goto GO6
if "%choice%"=="7" goto GO7
if "%choice%"=="8" goto GO8
if "%choice%"=="9" goto GO9
if "%choice%"=="10" goto GO10
if "%choice%"=="11" goto GO11
if "%choice%"=="12" goto GO12
if "%choice%"=="13" goto GO13
if "%choice%"=="14" goto GO14
if "%choice%"=="15" goto GO15
if "%choice%"=="16" goto GO16
if "%choice%"=="17" goto GO17
if "%choice%"=="18" goto GO18
if "%choice%"=="19" goto GO19
if "%choice%"=="20" goto GO20
if "%choice%"=="21" goto GO21

echo Ungültige Eingabe!
pause
goto MENU

:GO1
cd /d "%FOL1%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO2
cd /d "%FOL2%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO3
cd /d "%FOL3%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO4
cd /d "%FOL4%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO5
cd /d "%FOL5%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO6
cd /d "%FOL6%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO7
cd /d "%FOL7%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO8
cd /d "%FOL8%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO9
cd /d "%FOL9%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO10
cd /d "%FOL10%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO11
cd /d "%FOL11%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO12
cd /d "%FOL12%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO13
cd /d "%FOL13%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO14
cd /d "%FOL14%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO15
cd /d "%FOL15%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO16
cd /d "%FOL16%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO17
cd /d "%FOL17%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO18
cd /d "%FOL18%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO19
cd /d "%FOL19%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO20
cd /d "%FOL20%"
echo Aktuelles Verzeichnis: %CD%
goto END

:GO21
cd /d "%FOL21%"
echo Aktuelles Verzeichnis: %CD%
goto END

:END
