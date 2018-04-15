
@echo off

REM ÍË³öUnity±àÒëÆ÷
tasklist |find /i "Unity.exe" 
if %errorlevel%==0 (
taskkill /f /t /IM "Unity.exe"
) 

exit