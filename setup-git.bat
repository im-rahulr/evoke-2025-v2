@echo off
echo ========================================
echo    Git Setup for Evoke'2k25
echo ========================================
echo.

REM Check if git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo Git not found. Please install Git for Windows:
    echo 1. Download from: https://git-scm.com/download/win
    echo 2. Run the installer
    echo 3. Restart Command Prompt
    echo 4. Run this script again
    pause
    exit /b 1
)

echo Git found! Proceeding with repository setup...

REM Initialize git repository
git init
if errorlevel 1 (
    echo Failed to initialize git repository
    pause
    exit /b 1
)

REM Add remote origin
git remote add origin https://github.com/sanju-babu123/evoka-2025.git
if errorlevel 1 (
    echo Failed to add remote origin. Please check if the repository exists.
    pause
    exit /b 1
)

REM Add all files
git add .
if errorlevel 1 (
    echo Failed to add files to git
    pause
    exit /b 1
)

REM Commit changes
git commit -m "Initial commit: INTER-SCHOOL FEST Evoke'2k25 - Complete website with registration, admin panel, and rules"
if errorlevel 1 (
    echo Failed to commit changes
    pause
    exit /b 1
)

REM Push to remote repository
echo.
echo Pushing to GitHub repository: sanju-babu123/evoka-2025
echo Make sure you have push access to this repository.
echo.
git push -u origin master
if errorlevel 1 (
    echo.
    echo Push failed. This might be because:
    echo 1. The repository doesn't exist yet
    echo 2. You don't have push access
    echo 3. Authentication is required
    echo.
    echo To create the repository:
    echo 1. Go to https://github.com/sanju-babu123
    echo 2. Click "New repository"
    echo 3. Name it "evoka-2025"
    echo 4. Don't initialize with README (since we have code)
    echo 5. Create repository
    echo 6. Run this script again
    echo.
    echo For authentication, you may need to:
    echo - Use SSH key, or
    echo - Use a Personal Access Token instead of password
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Repository pushed to GitHub
echo ========================================
echo.
echo Your project is now available at:
echo https://github.com/sanju-babu123/evoka-2025
echo.
pause
