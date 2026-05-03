#!/usr/bin/env bash
# RED: 验证 Hugo 已安装且可以构建空站点
set -euo pipefail
# shellcheck disable=all

echo "=== Test 1: Hugo is installed ==="
hugo version

echo "=== Test 2: Empty site builds ==="
SITE_DIR=$(mktemp -d)
cd "$SITE_DIR"
hugo new site quick-test --force > /dev/null 2>&1
cd quick-test
echo 'baseURL = "http://example.com"' > hugo.toml
echo 'title = "Test"' >> hugo.toml
hugo > /dev/null 2>&1
echo "Build OK: $(ls public/ | head -5)"

rm -rf "$SITE_DIR"
echo "=== PASS ==="
