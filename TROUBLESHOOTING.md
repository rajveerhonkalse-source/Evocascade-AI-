# EvoCascade AI Troubleshooting

## `python` is not recognized
Reinstall Python and select **Add Python to PATH**, or use the Python Launcher (`py`).

## `npm` is not recognized
Install Node.js 20+ from the official Node.js installer and reopen Command Prompt.

## PowerShell blocks scripts
Use the included `.bat` files from Command Prompt. They do not require changing PowerShell execution policy.

## Port 8000 or 5173 is already in use
Close the other program using that port. Alternatively, manually start:

```bat
cd backend
.venv\Scripts\activate
uvicorn app.main:app --reload --port 8001
```

Then update `BASE` in `frontend/src/services/api.ts` to use port 8001.

## Backend starts but frontend says repository not loaded
Open **Repository Analyzer** and press **Load Demo Repository** first.

## `npm install` errors
Delete `frontend\node_modules` and `frontend\package-lock.json` if present, then run `npm install` again with an internet connection.

## Python package install errors
Delete `backend\.venv`, run `SETUP_WINDOWS.bat` again, and use Python 3.11 or 3.12 if a third-party package does not yet support your newest Python version.

## Why the ZIP does not contain `node_modules` or a Python virtual environment
Those folders are OS/platform-specific and make the ZIP very large. The setup script recreates them correctly on the new laptop.
