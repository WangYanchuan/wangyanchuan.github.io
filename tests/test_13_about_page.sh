#!/usr/bin/env bash
# 验证 /about 页面存在并包含作者信息
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: About page ==="

hugo > /dev/null 2>&1

# 1. 页面存在
if [ -f public/about/index.html ]; then
  echo "  OK: /about 页面存在"
else
  echo "  FAIL: /about 页面不存在"
  exit 1
fi

# 2. 页面有内容（不仅仅是空页面）
content_size=$(wc -c < public/about/index.html | tr -d ' ')
if [ "$content_size" -gt 500 ]; then
  echo "  OK: 页面内容大小 $content_size bytes"
else
  echo "  FAIL: 页面内容过少 ($content_size bytes)"
  exit 1
fi

# 3. 包含社交链接
for social in "github" "twitter" "zhihu"; do
  if grep -qi "$social" public/about/index.html 2>/dev/null; then
    echo "  OK: 包含 $social 链接"
  else
    echo "  FAIL: 缺少 $social 链接"
    exit 1
  fi
done

echo "=== PASS ==="
