#!/usr/bin/env bash
# 验证导航栏当前页面高亮
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Navigation active state ==="

hugo > /dev/null 2>&1

# 检查文章页的导航是否有高亮标识
if grep -q 'active\|current\|aria-current' public/essays/first-post/index.html 2>/dev/null; then
  echo "  OK: 导航栏有当前页高亮标识"
else
  echo "  FAIL: 导航栏缺少当前页高亮"
  exit 1
fi

echo "=== PASS ==="
