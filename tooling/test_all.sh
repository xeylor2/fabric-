#!/usr/bin/env bash
# FEBRIC — run every package's test suite (app + all packages).
# Flutter packages run `flutter test`; pure Dart packages run `dart test`.
set -uo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")/.."

fail=0

run_suite() {
  local dir="$1"
  [ -d "$dir/test" ] || return 0
  echo "== $dir =="
  if grep -q "sdk: flutter" "$dir/pubspec.yaml"; then
    (cd "$dir" && flutter test --reporter compact) || fail=1
  else
    (cd "$dir" && dart test --reporter compact) || fail=1
  fi
}

run_suite app
for d in packages/*/; do
  run_suite "${d%/}"
done

if [ "$fail" -ne 0 ]; then
  echo "test_all: FAILURES detected."
else
  echo "test_all: all suites passed."
fi
exit "$fail"
