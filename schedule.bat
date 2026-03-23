@echo off
echo 1. Register / 등록 / 登録
echo 2. Unregister / 해제 / 解除
echo.
set /p choice="> "
if "%choice%"=="1" python "%~dp0scripts\_schedule.py"
if "%choice%"=="2" python "%~dp0scripts\_schedule.py" delete
pause
