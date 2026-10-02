@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

echo ============================================
echo    地球智能 SKILL 一键安装
echo ============================================
echo.

set "SRC=%~dp0skills"
if not exist "%SRC%" (
  echo [错误] 没找到 skills 文件夹。
  echo 请确认"安装.bat"和 skills 文件夹在同一个目录下再双击。
  echo.
  pause
  exit /b 1
)

set INSTALLED=0

echo 正在检测已安装的 AI 工具...
echo.

REM === 1. 豆包：遍历所有 Profile ===
for /d %%D in ("%LOCALAPPDATA%\Doubao\User Data\Profile *") do (
  set "TARGET=%%D\.doubao\agent_mode\workspace\.user_skills"
  echo [豆包] 安装到: !TARGET!
  if not exist "!TARGET!" mkdir "!TARGET!"
  xcopy "%SRC%\*" "!TARGET!\" /E /I /Y /Q >nul
  set /a INSTALLED+=1
)

REM === 2. 豆包：Default profile（老版本可能用这个）===
if exist "%LOCALAPPDATA%\Doubao\User Data\Default" (
  set "TARGET=%LOCALAPPDATA%\Doubao\User Data\Default\.doubao\agent_mode\workspace\.user_skills"
  echo [豆包-Default] 安装到: !TARGET!
  if not exist "!TARGET!" mkdir "!TARGET!"
  xcopy "%SRC%\*" "!TARGET!\" /E /I /Y /Q >nul
  set /a INSTALLED+=1
)

REM === 3. Claude Code ===
if exist "%USERPROFILE%\.claude" (
  set "TARGET=%USERPROFILE%\.claude\skills"
  echo [Claude Code] 安装到: !TARGET!
  if not exist "!TARGET!" mkdir "!TARGET!"
  xcopy "%SRC%\*" "!TARGET!\" /E /I /Y /Q >nul
  set /a INSTALLED+=1
)

REM === 4. Cursor ===
if exist "%USERPROFILE%\.cursor" (
  set "TARGET=%USERPROFILE%\.cursor\skills"
  echo [Cursor] 安装到: !TARGET!
  if not exist "!TARGET!" mkdir "!TARGET!"
  xcopy "%SRC%\*" "!TARGET!\" /E /I /Y /Q >nul
  set /a INSTALLED+=1
)

echo.
if %INSTALLED% GTR 0 (
  echo ============================================
  echo   安装完成！共写入 %INSTALLED% 个位置。
  echo.
  echo   下一步：
  echo   1. 完全关闭并重启豆包 / Claude / Cursor
  echo   2. 直接对它说你要做的事，比如：
  echo      "帮我看看这个口播稿顺不顺"
  echo      "这个小红书标题帮我起几个"
  echo ============================================
) else (
  echo [提示] 没检测到已安装的 AI 工具。
  echo 请先安装并打开过一次豆包 / Claude / Cursor，再回来双击本脚本。
)
echo.
pause
