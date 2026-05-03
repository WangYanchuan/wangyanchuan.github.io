#!/usr/bin/env bash
# 验证导航栏移动端适配（汉堡菜单、固定定位）
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Navigation mobile & sticky ==="

hugo > /dev/null 2>&1

# 1. 检查是否有 CSS 媒体查询或移动端样式
if grep -qi 'media\|@media\|hamburger\|menu-toggle\|nav-toggle\|navbar-toggle' public/index.html 2>/dev/null; then
  echo "  OK: 包含移动端适配标记"
else
  echo "  FAIL: 缺少移动端适配"
  exit 1
fi

# 2. 检查导航栏是否有固定定位样式
if grep -qi 'sticky\|fixed\|position.*sticky\|position.*fixed' public/index.html 2>/dev/null; then
  echo "  OK: 导航栏有固定定位"
else
  echo "  FAIL: 导航栏无固定定位"
  exit 1
fi

echo "=== PASS ==="
