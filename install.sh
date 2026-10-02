#!/bin/bash
# 地球智能 SKILL 一键安装 (Mac / Linux)
set -u

echo "=========================================="
echo "   地球智能 SKILL 一键安装"
echo "=========================================="
echo

SRC="$(cd "$(dirname "$0")" && pwd)/skills"
if [ ! -d "$SRC" ]; then
  echo "[错误] 没找到 skills 文件夹，请确认 install.sh 和 skills 在同一目录。"
  exit 1
fi

INSTALLED=0

echo "正在检测已安装的 AI 工具..."
echo

# Claude Code
if [ -d "$HOME/.claude" ]; then
  TARGET="$HOME/.claude/skills"
  echo "[Claude Code] -> $TARGET"
  mkdir -p "$TARGET"
  cp -R "$SRC/"* "$TARGET/"
  INSTALLED=$((INSTALLED+1))
fi

# Cursor
if [ -d "$HOME/.cursor" ]; then
  TARGET="$HOME/.cursor/skills"
  echo "[Cursor] -> $TARGET"
  mkdir -p "$TARGET"
  cp -R "$SRC/"* "$TARGET/"
  INSTALLED=$((INSTALLED+1))
fi

# 豆包 Mac 版（如存在）
if [ -d "$HOME/Library/Application Support/Doubao" ]; then
  echo "[豆包-Mac] 请手动把 skills/ 文件夹里的内容复制到豆包的 skills 目录。"
fi

echo
if [ "$INSTALLED" -gt 0 ]; then
  echo "=========================================="
  echo "  安装完成！共写入 $INSTALLED 个位置。"
  echo "  重启 AI 工具后直接说需求即可。"
  echo "=========================================="
else
  echo "[提示] 没检测到已安装的 AI 工具。"
fi
echo
