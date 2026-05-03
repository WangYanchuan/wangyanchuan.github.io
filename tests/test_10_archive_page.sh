#!/usr/bin/env bash
# 验证 /archive 页面按时间线归档
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Archive page ==="

hugo > /dev/null 2>&1

if [ -f public/archive/index.html ]; then
  echo "  OK: /archive 页面存在"
else
  echo "  FAIL: /archive 页面不存在"
  exit 1
fi

# 包含日期
if grep -E '202[0-9]' public/archive/index.html > /dev/null; then
  echo "  OK: 包含年份信息"
else
  echo "  FAIL: 缺少年份信息"
  exit 1
fi

echo "=== PASS ==="
