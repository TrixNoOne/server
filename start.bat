@echo off
echo ==========================================
echo  VULCAN SERVER - Python FastAPI Daemon
echo ==========================================
echo.
echo Starting Vulkan Server...

if exist "requirements.txt" (
    echo [OK] Requirements.txt found
) else (
    echo [ERROR] Requirements.txt not found!
    pause
    exit /b 1
)

echo.
echo Installing Python dependencies...
pip install -r requirements.txt

if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] Dependency installation may have issues
)

echo.
echo Checking Python daemon...
if exist "python\vulkan\node\main.py" (
    echo [OK] Python daemon found: python\vulkan\node\main.py
) else (
    echo [ERROR] Python daemon not found!
    pause
    exit /b 1
)

echo.
echo Testing Python import...
python -c "from vulkan.node.main import app; print('Import successful')" 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [WARNING] Import test may need dependencies installed
)

echo.
echo ==========================================
echo  Server setup complete!
echo ==========================================
pause