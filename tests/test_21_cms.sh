#!/usr/bin/env bash
# 验证 Decap CMS 管理页面
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Decap CMS admin page ==="

hugo > /dev/null 2>&1

# 1. 静态文件存在
if [ -f static/admin/index.html ]; then
  echo "  OK: static/admin/index.html 存在"
else
  echo "  FAIL: static/admin/index.html 不存在"
  exit 1
fi

if [ -f static/admin/config.yml ]; then
  echo "  OK: static/admin/config.yml 存在"
else
  echo "  FAIL: static/admin/config.yml 不存在"
  exit 1
fi

# 2. CMS 入口添加到公开目录
if [ -f public/admin/index.html ]; then
  echo "  OK: public/admin/index.html 生成成功"
else
  echo "  FAIL: public/admin/index.html 未生成"
  exit 1
fi

# 3. CMS 加载脚本
if grep -q 'decap-cms' public/admin/index.html; then
  echo "  OK: CMS 加载脚本正确"
else
  echo "  FAIL: CMS 加载脚本缺失"
  exit 1
fi

# 4. 配置文件定义了必要集合
for collection in "posts" "books" "pages"; do
  if grep -q "$collection" static/admin/config.yml; then
    echo "  OK: 定义了 $collection 集合"
  else
    echo "  FAIL: 缺少 $collection 集合"
    exit 1
  fi
done

echo "=== PASS ==="
