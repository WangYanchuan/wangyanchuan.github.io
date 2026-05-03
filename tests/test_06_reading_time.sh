#!/usr/bin/env bash
# 验证文章页显示阅读时间估算
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Reading time estimate ==="

hugo > /dev/null 2>&1

found=false
for page in public/essays/*/index.html; do
  if [ ! -f "$page" ]; then continue; fi

  if grep -qiE '(分钟|分钟阅读|reading.time|阅读时间|read.time)' "$page" 2>/dev/null; then
    found=true
    echo "  OK: $page 包含阅读时间"
    break
  fi
done

if [ "$found" = true ]; then
  echo "=== PASS ==="
else
  echo "  FAIL: 未找到阅读时间"
  exit 1
fi
