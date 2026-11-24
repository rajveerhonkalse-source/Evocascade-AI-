@echo off
title EvoCascade AI — Docker Launcher
echo.
echo ============================================================
echo   EvoCascade AI — Docker Compose Launcher
echo ============================================================
echo.
echo [1/3] Checking Docker daemon...
docker info >nul 2>&1
if errorlevel 1 (
    echo.
    echo  ERROR: Docker Desktop is not running!
    echo  Please start Docker Desktop and wait for it to show
    echo  "Docker Desktop is running" in the system tray,
    echo  then run this script again.
    echo.
    pause
    exit /b 1
)
echo        Docker is running.
echo.
echo [2/3] Building images and starting containers...
echo        (First run may take 2-5 minutes to build)
echo.
docker compose up --build -d
if errorlevel 1 (
    echo.
    echo  ERROR: docker compose failed. Check the output above.
    pause
    exit /b 1
)
echo.
echo [3/3] Waiting for health checks...
timeout /t 5 /nobreak >nul
docker compose ps
echo.
echo ============================================================
echo   Services are UP:
echo     Frontend  →  http://localhost:5173
echo     Backend   →  http://localhost:8000
echo     API Docs  →  http://localhost:8000/docs
echo ============================================================
echo.
echo   Press any key to open the app in your browser...
pause >nul
start http://localhost:5173
