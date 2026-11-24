# EvoCascade AI — Full Portable Project

**EvoCascade AI: An Explainable Multi-Evidence Digital Twin for Predictive Software Change Impact Analysis**

This ZIP is designed to be copied to another Windows/Linux/macOS laptop and run locally. It contains:

- React + TypeScript + Vite frontend
- FastAPI Python backend
- Python AST repository analyzer
- Git history / co-change miner
- NetworkX dependency graph
- Transparent multi-evidence impact scoring
- WhyChain explanations
- Test recommendation + TestGap analysis
- Demo model-evaluation screen (clearly labelled demo values)
- Sample Python e-commerce repository
- Backend unit tests
- Windows `.bat` scripts and cross-platform shell scripts

> Important: the default impact score is a transparent heuristic score, **not a calibrated probability**. The model-evaluation values shown in the UI are demo placeholders until you run real experiments.

## Quick start on Windows

### 1) Install prerequisites
Install:
- Python 3.10–3.13 (recommended: 3.11 or 3.12)
- Node.js 20+
- Git

During Python setup, tick **Add Python to PATH**.

### 2) Extract the ZIP
Extract it to a simple path, for example:

`C:\EvoCascadeAI`

### 3) One-time setup
Double-click:

`SETUP_WINDOWS.bat`

This creates a Python virtual environment, installs backend packages, and installs frontend npm packages.

### 4) Run the project
Double-click:

`START_ALL_WINDOWS.bat`

Two terminal windows will open:
- Backend: http://127.0.0.1:8000
- Frontend: http://127.0.0.1:5173
- Swagger API docs: http://127.0.0.1:8000/docs

Open **http://127.0.0.1:5173** in the browser.

## Manual run

### Backend
```bash
cd backend
python -m venv .venv
# Windows: .venv\Scripts\activate
# macOS/Linux: source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload --port 8000
```

### Frontend
```bash
cd frontend
npm install
npm run dev
```

## Demo workflow

1. Open **Repository Analyzer**.
2. The sample repository path is pre-filled when running locally.
3. Click **Load Demo Repository** or enter an absolute local repository path.
4. Click **Analyze Repository**.
5. Go to **Impact Analysis** and select `process_payment`.
6. Expected demo propagation includes:
   - Direct: `generate_invoice`, `issue_refund`
   - Indirect: `checkout`, `update_points`, `place_order`
7. Open **WhyChain** to see a dependency path.
8. Open **Test Intelligence** and **TestGap** to inspect mapped tests and uncovered impacted functions.

## Project structure

```text
EvoCascadeAI_Full_Project/
├── backend/
│   ├── app/
│   │   ├── main.py
│   │   ├── schemas.py
│   │   ├── store.py
│   │   └── services/
│   │       ├── ast_analyzer.py
│   │       ├── git_analyzer.py
│   │       ├── impact_engine.py
│   │       └── test_mapper.py
│   ├── tests/
│   └── requirements.txt
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   ├── pages/
│   │   ├── services/
│   │   └── data/
│   └── package.json
├── sample_repository/
├── SETUP_WINDOWS.bat
├── START_ALL_WINDOWS.bat
└── README.md
```

## API endpoints

- `GET /api/health`
- `POST /api/demo/load`
- `POST /api/repositories/analyze`
- `POST /api/repositories/upload`
- `GET /api/repositories/{id}/graph`
- `GET /api/repositories/{id}/commits`
- `POST /api/changes/compare`
- `POST /api/impact/analyze`
- `GET /api/impact/{analysis_id}/graph`
- `GET /api/impact/{analysis_id}/why/{entity_id}`
- `GET /api/impact/{analysis_id}/tests`
- `GET /api/impact/{analysis_id}/test-gaps`
- `GET /api/model/metrics`

## Optional ML extension

The project is intentionally runnable without a trained model. To add XGBoost later, install:

```bash
pip install -r backend/requirements-ml.txt
```

Then replace the heuristic ranker in `backend/app/services/impact_engine.py` with a trained model using validated historical labels. Preserve the evidence breakdown and do not display uncalibrated model output as probability.

## Running tests

```bash
cd backend
pytest -q
```

## Security note

Repository ZIP uploads are extracted into a temporary folder. The sample implementation protects against ZIP path traversal and does **not execute untrusted repository code**. It statically parses `.py` files using `ast`.
