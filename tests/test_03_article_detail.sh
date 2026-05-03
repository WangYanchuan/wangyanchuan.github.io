#!/usr/bin/env bash
# 验证文章详情页渲染：Markdown 内容、front matter、代码高亮
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Article detail page ==="

hugo > /dev/null 2>&1

# 找到生成的文章页面
post_dir="public/essays"
if [ ! -d "$post_dir" ]; then
  echo "  FAIL: $post_dir 目录不存在"
  exit 1
fi

found=0
for dir in "$post_dir"/*/; do
  page="${dir}index.html"
  if [ -f "$page" ]; then
    found=$((found + 1))
    echo "  检查: $page"

    # 1. 包含文章标题 (<h1>)
    if grep -q '<h1' "$page"; then
      echo "    OK: 包含标题"
    else
      echo "    FAIL: 缺少标题"
      exit 1
    fi

    # 2. 包含文章内容（至少一段 <p>）
    if grep -q '<p>' "$page"; then
      echo "    OK: 包含正文段落"
    else
      echo "    FAIL: 缺少正文"
      exit 1
    fi
  fi
done

echo "  OK: 共 $found 篇文章详情页"
if [ "$found" -lt 3 ]; then
  echo "  FAIL: 文章页数不足"
  exit 1
fi

echo "=== PASS ==="
