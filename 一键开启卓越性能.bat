@echo off
setlocal EnableExtensions
setlocal EnableDelayedExpansion
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
title=��Ӳ�����׿Խ���ܵ�Դ�ƻ�
powercfg /list | find "(׿Խ����������ר��)" > NUL
if %ERRORLEVEL% == 0 (
goto SetActive
) else (
goto DuplicateScheme
)

:DuplicateScheme
powercfg /DUPLICATESCHEME e9a42b02-d5df-448d-aa00-03f14749eb61 && echo ������ɡ� && goto SetActive

:SetActive
for /f "tokens=3,4" %%i in ('powercfg /list') do (
if "%%j" == "(׿Խ����������ר��)" powercfg /SETACTIVE %%i && echo ����ɹ��� && goto EOF
)

:EOF
pause
exit