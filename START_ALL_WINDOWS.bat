@echo off
cd /d %~dp0
start "EvoCascade Backend" cmd /k "%~dp0START_BACKEND_WINDOWS.bat"
timeout /t 2 /nobreak >nul
start "EvoCascade Frontend" cmd /k "%~dp0START_FRONTEND_WINDOWS.bat"
echo EvoCascade AI starting...
echo Frontend: http://127.0.0.1:5173
echo Backend:  http://127.0.0.1:8000
echo API Docs: http://127.0.0.1:8000/docs
