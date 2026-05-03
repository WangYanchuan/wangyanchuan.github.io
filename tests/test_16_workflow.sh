#!/usr/bin/env bash
# 验证 GitHub Actions workflow 文件存在且结构正确
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: GitHub Actions workflow ==="

wf=".github/workflows/deploy.yml"

if [ -f "$wf" ]; then
  echo "  OK: $wf 文件存在"
else
  echo "  FAIL: $wf 文件不存在"
  exit 1
fi

# 检查关键 action 引用
for action in "actions/checkout" "peaceiris/actions-hugo" "actions/upload-pages-artifact" "actions/deploy-pages"; do
  if grep -q "$action" "$wf"; then
    echo "  OK: 引用 $action"
  else
    echo "  FAIL: 缺少 $action"
    exit 1
  fi
done

# 检查 hugo --minify
if grep -q "hugo.*--minify\|hugo.*minify" "$wf"; then
  echo "  OK: 使用 hugo --minify"
else
  echo "  FAIL: 未使用 hugo --minify"
  exit 1
fi

echo "=== PASS ==="
