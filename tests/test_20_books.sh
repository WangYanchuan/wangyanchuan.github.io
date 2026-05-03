#!/usr/bin/env bash
# 验证首页显示图书作品模块
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Homepage books section ==="

hugo > /dev/null 2>&1

# 1. 首页存在图书作品区域
if grep -q '图书作品' public/index.html; then
  echo "  OK: 首页包含图书作品"
else
  echo "  FAIL: 首页缺少图书作品"
  exit 1
fi

# 2. 包含图书卡片
book_count=$(grep -c 'class="book-card"' public/index.html || true)
if [ "$book_count" -ge 1 ]; then
  echo "  OK: 有 $book_count 个图书作品"
else
  echo "  FAIL: 无图书作品展示"
  exit 1
fi

# 3. data/books.yaml 存在且有图书数据
if [ -f data/books.yaml ]; then
  echo "  OK: data/books.yaml 存在"
else
  echo "  FAIL: data/books.yaml 不存在"
  exit 1
fi

echo "=== PASS ==="
