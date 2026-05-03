#!/usr/bin/env bash
# Run all TDD tests for Issue #1
set -euo pipefail

cd "$(dirname "$0")"

echo "========================================="
echo "  Issue #1 - All Tests"
echo "========================================="

passed=0
failed=0

for test in test_*.sh; do
  if [ "$test" = "run_all.sh" ]; then
    continue
  fi
  printf "\\n--- %s ---\\n" "$test"
  if bash "$test"; then
    passed=$((passed + 1))
  else
    failed=$((failed + 1))
  fi
done

echo ""
echo "========================================="
echo "  Result: $passed passed, $failed failed"
echo "========================================="
exit "$failed"
