#!/usr/bin/env bash
# 验证 meta 标签（description、Open Graph、canonical）
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: SEO meta tags ==="

hugo > /dev/null 2>&1

# 1. 首页有 meta description
if grep -q '<meta.*description' public/index.html; then
  echo "  OK: 首页有 meta description"
else
  echo "  FAIL: 首页缺 meta description"
  exit 1
fi

# 2. 文章页有 meta description
for page in public/essays/*/index.html; do
  [ -f "$page" ] || continue
  if grep -q '<meta.*description' "$page"; then
    echo "  OK: $(basename "$(dirname "$page")") 有 meta description"
  else
    echo "  FAIL: $(basename "$(dirname "$page")") 缺 meta description"
    exit 1
  fi
done

# 3. Open Graph 标签
if grep -q 'og:title\|og:description\|og:type' public/index.html; then
  echo "  OK: 包含 Open Graph 标签"
else
  echo "  FAIL: 缺少 Open Graph 标签"
  exit 1
fi

# 4. Canonical link
if grep -q 'rel="canonical"' public/index.html; then
  echo "  OK: 包含 canonical link"
else
  echo "  FAIL: 缺少 canonical link"
  exit 1
fi

echo "=== PASS ==="
