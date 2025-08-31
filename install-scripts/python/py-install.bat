@echo off

REM Script to install Python requirements automatically

REM Script written by Shadowdara

call python -m venv venv
call venv\Scripts\activate.bat
call pip install -r requirements.txt
