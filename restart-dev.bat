@echo off
echo Restarting Convex and Next.js dev servers...
echo.

REM Kill any existing node processes
taskkill /F /IM node.exe /T 2>nul

echo Waiting 2 seconds...
timeout /t 2 /nobreak >nul

echo Starting Convex dev server...
start "Convex Dev" cmd /k "npx convex dev"

echo Waiting 5 seconds for Convex to sync...
timeout /t 5 /nobreak >nul

echo Starting Next.js dev server...
start "Next.js Dev" cmd /k "npm run dev"

echo.
echo ✓ Both dev servers should now be running!
echo ✓ Check the opened terminal windows for status
echo ✓ Wait for Convex to finish syncing, then refresh your browser
echo.
pause

