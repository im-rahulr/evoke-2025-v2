@echo off
echo ========================================
echo    Automatic Git Push for Evoke'2k25
echo ========================================
echo.

REM Check if git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git is not installed!
    echo.
    echo Please install Git for Windows first:
    echo 1. Go to: https://git-scm.com/download/win
    echo 2. Download and install Git
    echo 3. Restart Command Prompt
    echo 4. Run this script again
    echo.
    pause
    exit /b 1
)

echo Git found! Setting up repository...

REM Initialize git repository
echo Initializing git repository...
git init
if errorlevel 1 (
    echo ERROR: Failed to initialize git repository
    pause
    exit /b 1
)

REM Add remote origin
echo Adding remote origin...
git remote add origin https://github.com/sanju-babu123/evoka-2025.git 2>nul
if errorlevel 1 (
    echo Warning: Remote origin might already exist or repository may not be created yet
)

REM Add all files
echo Adding all files to git...
git add .
if errorlevel 1 (
    echo ERROR: Failed to add files
    pause
    exit /b 1
)

REM Commit changes
echo Committing changes...
git commit -m "Initial commit: INTER-SCHOOL FEST Evoke'2k25 - Complete website with registration, admin panel, and rules"
if errorlevel 1 (
    echo ERROR: Failed to commit
    pause
    exit /b 1
)

REM Push to remote repository
echo.
echo Pushing to GitHub...
echo Note: You may be asked for GitHub credentials
echo Username: sanju-babu123
echo For password, use a Personal Access Token from GitHub Settings
echo.
git push -u origin master

if errorlevel 1 (
    echo.
    echo PUSH FAILED!
    echo.
    echo Possible solutions:
    echo 1. Make sure the repository 'evoka-2025' exists on GitHub
    echo 2. Check if you have push access to sanju-babu123/evoka-2025
    echo 3. Use a Personal Access Token instead of password
    echo 4. Create the repository at: https://github.com/sanju-babu123/evoka-2025
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Your project is now on GitHub
echo ========================================
echo.
echo Repository URL: https://github.com/sanju-babu123/evoka-2025
echo.
echo What's included:
echo - Complete INTER-SCHOOL FEST website
echo - Registration system for 10th class students
echo - Admin panel with real-time data
echo - All 16 events with detailed rules
echo - Firebase integration
echo - Mobile-responsive design
echo.
pause
