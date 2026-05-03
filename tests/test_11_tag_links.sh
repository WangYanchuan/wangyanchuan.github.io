#!/usr/bin/env bash
# 验证文章页标签可点击跳转到标签聚合页
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Clickable tag links ==="

hugo > /dev/null 2>&1

for page in public/essays/*/index.html; do
  [ -f "$page" ] || continue

  if grep -q 'href=".*tags.*"' "$page" 2>/dev/null; then
    echo "  OK: $(basename "$(dirname "$page")") 标签可点击"
  else
    echo "  FAIL: $(basename "$(dirname "$page")") 标签无链接"
    exit 1
  fi
done

echo "=== PASS ==="
