@echo off
setlocal
cd /d %~dp0

echo ============================================
echo EvoCascade AI - One Time Setup
echo ============================================

where python >nul 2>nul || (echo Python not found. Install Python 3.10+ and add it to PATH.& pause & exit /b 1)
where npm >nul 2>nul || (echo npm not found. Install Node.js 20+.& pause & exit /b 1)

cd backend
if not exist .venv (
  echo Creating Python virtual environment...
  python -m venv .venv
)
call .venv\Scripts\activate.bat
python -m pip install --upgrade pip
pip install -r requirements.txt
if errorlevel 1 (echo Backend install failed.& pause & exit /b 1)

cd ..\frontend
call npm install
if errorlevel 1 (echo Frontend install failed.& pause & exit /b 1)

cd ..
echo.
echo Setup complete. Run START_ALL_WINDOWS.bat
echo.
pause
