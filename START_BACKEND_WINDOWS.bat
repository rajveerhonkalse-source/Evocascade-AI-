@echo off
cd /d %~dp0backend
if not exist .venv\Scripts\python.exe (
  echo Backend environment not found. Run SETUP_WINDOWS.bat first.
  pause
  exit /b 1
)
call .venv\Scripts\activate.bat
uvicorn app.main:app --reload --host 127.0.0.1 --port 8000
