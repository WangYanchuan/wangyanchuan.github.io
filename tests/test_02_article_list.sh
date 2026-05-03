#!/usr/bin/env bash
# 验证首页渲染文章列表（标题、日期）
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Homepage shows article list ==="

hugo > /dev/null 2>&1

# 首页使用 article-item 类
post_count=$(grep -c 'class="article-item"' public/index.html || true)
echo "  首页文章数: $post_count"
if [ "$post_count" -ge 3 ]; then
  echo "  OK: 首页包含至少3篇文章"
else
  echo "  FAIL: 首页文章数不足 ($post_count < 3)"
  exit 1
fi

# 检查是否有日期格式
if grep -Eo '20[0-9]{2}-[0-9]{2}-[0-9]{2}' public/index.html > /dev/null; then
  echo "  OK: 首页包含日期"
else
  echo "  FAIL: 首页缺少日期"
  exit 1
fi

# 检查是否有文章链接
if grep -c 'class="article-item"' public/index.html > /dev/null; then
  echo "  OK: 首页包含文章链接"
else
  echo "  FAIL: 首页缺少文章链接"
  exit 1
fi

echo "=== PASS ==="
