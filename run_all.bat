@echo off
echo =======================================================
echo   ⚡ Starting ReelMind AI Recommender System ⚡
echo =======================================================
echo.

echo [1/2] Running Recommender Engine Verification Tests...
py backend/test_pipeline.py
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Backend tests failed!
    pause
    exit /b %ERRORLEVEL%
)

echo.
echo [2/2] Launching FastAPI Web Application...
echo Open your browser at: http://localhost:8000
echo API Documentation:    http://localhost:8000/docs
echo.
py backend/run_backend.py
pause
