#!/usr/bin/env bash
# 验证导航栏包含首页、归档、标签、关于
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Navigation menu ==="

hugo > /dev/null 2>&1

for target in "/" "/books/" "/essays/" "/about/" "/contact/"; do
  if grep -q 'href=".*'"$target"'"' public/index.html 2>/dev/null; then
    echo "  OK: 导航包含 $target"
  else
    echo "  FAIL: 导航缺少 $target"
    exit 1
  fi
done

echo "=== PASS ==="
