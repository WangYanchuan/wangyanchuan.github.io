#!/usr/bin/env bash
# 验证 RSS feed 和 sitemap
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: RSS & Sitemap ==="

hugo > /dev/null 2>&1

# 1. RSS feed
if [ -f public/index.xml ]; then
  echo "  OK: /index.xml 存在"
  if grep -q '<item>' public/index.xml; then
    echo "  OK: RSS 包含文章条目"
  else
    echo "  FAIL: RSS 无文章条目"
    exit 1
  fi
else
  echo "  FAIL: /index.xml 不存在"
  exit 1
fi

# 2. Sitemap
if [ -f public/sitemap.xml ]; then
  echo "  OK: /sitemap.xml 存在"
else
  echo "  FAIL: /sitemap.xml 不存在"
  exit 1
fi

echo "=== PASS ==="
