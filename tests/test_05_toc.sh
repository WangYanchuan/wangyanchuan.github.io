#!/usr/bin/env bash
# 验证文章页包含目录导航（Table of Contents）
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Table of Contents ==="

hugo > /dev/null 2>&1

toc_found=false
for page in public/essays/*/index.html; do
  if [ ! -f "$page" ]; then continue; fi

  if grep -qiE '(TableOfContents|id="toc"|class="toc"|nav.*目录|toc)' "$page" 2>/dev/null; then
    toc_found=true
    echo "  OK: $page 包含目录导航"
    break
  fi
done

if [ "$toc_found" = true ]; then
  echo "=== PASS ==="
else
  echo "  FAIL: 未找到目录导航"
  exit 1
fi
