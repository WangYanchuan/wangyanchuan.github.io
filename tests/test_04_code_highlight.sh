#!/usr/bin/env bash
# 验证代码块语法高亮
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Code syntax highlighting ==="

hugo > /dev/null 2>&1

highlight_found=false
for page in public/essays/*/index.html; do
  if [ ! -f "$page" ]; then continue; fi

  # Hugo chroma 高亮会输出带有 class 的 code 标签
  if grep -q '<code' "$page" && grep -qE '(chroma|highlight|hljs|code-block)' "$page" 2>/dev/null; then
    highlight_found=true
    echo "  OK: $page 包含代码高亮"
  elif grep -q '<code' "$page"; then
    echo "  WARN: $page 有代码块但无高亮 class"
  fi
done

if [ "$highlight_found" = true ]; then
  echo "=== PASS ==="
else
  echo "  FAIL: 未找到代码高亮"
  exit 1
fi
