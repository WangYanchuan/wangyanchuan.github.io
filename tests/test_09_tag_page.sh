#!/usr/bin/env bash
# 验证 /tags/<tag> 页面显示该标签下的文章
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Tag detail page ==="

hugo > /dev/null 2>&1

found=false
for page in public/tags/*/index.html; do
  if [ -f "$page" ]; then
    found=true
    echo "  OK: $(dirname "$page" | sed 's|public||') 页面存在"
    if grep -q '<a.*href.*essays' "$page" 2>/dev/null; then
      echo "  OK: 包含文章链接"
    else
      echo "  FAIL: 缺少文章链接"
      exit 1
    fi
  fi
done

if [ "$found" = true ]; then
  echo "=== PASS ==="
else
  echo "  FAIL: 没有找到任何标签分类页面"
  exit 1
fi
