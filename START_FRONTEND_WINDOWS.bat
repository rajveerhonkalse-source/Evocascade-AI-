@echo off
cd /d %~dp0frontend
if not exist node_modules (
  echo Frontend dependencies not found. Run SETUP_WINDOWS.bat first.
  pause
  exit /b 1
)
npm run dev -- --host 127.0.0.1
