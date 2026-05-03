#!/usr/bin/env bash
# 验证文章页显示标签
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Article tags display ==="

hugo > /dev/null 2>&1

# 文章页标签在 <div class="tags"> 中
for page in public/essays/*/index.html; do
  [ -f "$page" ] || continue

  if grep -q 'class="tags"' "$page" 2>/dev/null; then
    echo "  OK: $page 包含标签"
  else
    echo "  FAIL: $page 缺少标签"
    exit 1
  fi
done

# 首页不直接显示标签，文章由 article-item 链接展示
# 标签页面应有标签
if grep -q 'class="tag-cloud"' public/tags/index.html 2>/dev/null; then
  echo "  OK: 标签页显示标签"
else
  echo "  FAIL: 标签页缺少标签"
  exit 1
fi

echo "=== PASS ==="
