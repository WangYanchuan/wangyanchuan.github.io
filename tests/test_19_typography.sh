#!/usr/bin/env bash
# 验证中文排版风格（阳志平风格）
set -euo pipefail

cd "$(dirname "$0")/.."
echo "=== Test: Chinese typography style ==="

hugo > /dev/null 2>&1

html="public/index.html"

# 1. 字体栈包含中文字体
for font in "PingFang SC" "Hiragino Sans GB" "Noto Sans SC" "Noto Serif SC"; do
  if grep -qi "$font" "$html" 2>/dev/null; then
    echo "  OK: 字体包含 $font"
    break
  fi
done

# 2. 正文行高 ≥ 1.8（适合中文阅读）
if grep -E 'line-height[[:space:]]*:[[:space:]]*1\.([8-9]|[0-9]{2})' "$html" > /dev/null 2>&1; then
  echo "  OK: 行高 ≥ 1.8"
else
  echo "  FAIL: 行高不足 1.8"
  exit 1
fi

# 3. 正文有最大宽度约束 (max-width)
if grep -E 'max-width[[:space:]]*:[[:space:]]*[0-9]' "$html" > /dev/null 2>&1; then
  echo "  OK: 内容有最大宽度"
else
  echo "  FAIL: 无最大宽度约束"
  exit 1
fi

# 4. 配色简洁（深灰文字 + 白底）
if grep -E 'color[[:space:]]*:[[:space:]]*#[0-9a-fA-F]{3,6}' "$html" > /dev/null 2>&1; then
  echo "  OK: 定义了文字颜色"
else
  echo "  FAIL: 无文字颜色定义"
  exit 1
fi

echo "=== PASS ==="
