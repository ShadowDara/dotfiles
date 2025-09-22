@echo off
echo Test Touch-Windows

.\x64\Release\touch-windows.exe

echo Starting Tests!
.\x64\Release\touch-windows.exe test/test1.txt "aa"
.\x64\Release\touch-windows.exe test/test2.txt "vv"
.\x64\Release\touch-windows.exe test/test3.txt dd
.\x64\Release\touch-windows.exe test/test4.txt dd
echo Tests finished!

rem Erste Eingabe abfragen
set /p input1=Filename: 

rem Zweite Eingabe abfragen
set /p input2=Filecontent: 

rem Programm mit den Eingaben als Parameter starten (optional)
.\x64\Release\touch-windows.exe %input1% %input2%

pause
