@echo off
echo ========================================
echo    GitHub Push Script for Evoka'2k25
echo ========================================
echo.

REM Check if git is available
git --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Git not found in PATH!
    echo.
    echo Please ensure Git is properly installed:
    echo 1. Git should be installed and added to PATH
    echo 2. Restart Command Prompt or PowerShell
    echo 3. Run this script again
    echo.
    echo If Git is installed but not in PATH:
    echo - Check: C:\Program Files\Git\bin\git.exe
    echo - Add to PATH or use full path in commands
    echo.
    pause
    exit /b 1
)

echo Git found! Executing your commands...

REM Execute the exact commands the user provided
echo Creating README.md...
echo "# evoka-2025" > README.md

echo Initializing git repository...
git init

echo Adding README.md...
git add README.md

echo Committing changes...
git commit -m "first commit"

echo Renaming branch to main...
git branch -M main

echo Adding remote origin...
git remote add origin https://github.com/sanju-babu123/evoka-2025.git

echo Adding all project files...
git add .

echo Committing all files...
git commit -m "Complete INTER-SCHOOL FEST Evoke'2k25 website - Registration system, admin panel, rules page, and all events"

echo Pushing to GitHub...
git push -u origin main

if errorlevel 1 (
    echo.
    echo PUSH FAILED!
    echo.
    echo Possible issues:
    echo 1. Repository 'sanju-babu123/evoka-2025' doesn't exist on GitHub
    echo 2. Authentication required (use Personal Access Token)
    echo 3. No push access to the repository
    echo.
    echo Solutions:
    echo - Create repository at: https://github.com/sanju-babu123/evoka-2025
    echo - Use Personal Access Token instead of password
    echo - Ensure you have write access to the repository
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo SUCCESS! Repository pushed to GitHub
echo ========================================
echo.
echo Your INTER-SCHOOL FEST website is now live at:
echo https://github.com/sanju-babu123/evoka-2025
echo.
echo What's included in the repository:
echo - Complete website with registration system
echo - Admin panel for managing 10th class registrations
echo - Rules page with all 16 events
echo - Firebase integration and security rules
echo - Mobile-responsive design
echo - Updated branding to Evoke'2k25
echo.
pause
