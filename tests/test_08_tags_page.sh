#!/usr/bin/env bash
# 验证 /tags 页面存在并显示所有标签
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Tags page ==="

hugo > /dev/null 2>&1

# 1. /tags 页面存在
if [ -f public/tags/index.html ]; then
  echo "  OK: /tags 页面存在"
else
  echo "  FAIL: /tags 页面不存在"
  exit 1
fi

# 2. 检查标签数量（至少有 distinct tags）
tag_count=$(grep -o 'class="count"' public/tags/index.html | wc -l | tr -d ' ')
echo "  标签数: $tag_count"
if [ "$tag_count" -ge 8 ]; then
  echo "  OK: 标签数量正确"
else
  echo "  FAIL: 标签数量不足 ($tag_count < 8)"
  exit 1
fi

echo "=== PASS ==="
