#!/usr/bin/env bash
# Builds the site and publishes it to https://omerjahangir.github.io/
# by replacing the contents of the OmerJahangir.github.io repository.
#
# Usage: tool/deploy_pages.sh ["commit message"]
# Stop `jaspr serve` first; it holds the build lock.
set -euo pipefail

PAGES_REPO="https://github.com/OmerJahangir/OmerJahangir.github.io.git"
MESSAGE="${1:-Deploy portfolio $(git rev-parse --short HEAD)}"
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

cd "$ROOT"
jaspr build

git clone --quiet --depth 1 "$PAGES_REPO" "$WORK/site"
cd "$WORK/site"
git rm -rqf --ignore-unmatch .
# Skip build-tool leftovers the site never requests (they also contain local paths).
rsync -a --exclude 'packages/' --exclude '.dart_tool/' --exclude '.build.manifest' --exclude '.DS_Store' "$ROOT/build/jaspr/" ./
# Serve files as-is; don't let GitHub run Jekyll over them.
touch .nojekyll

git add -A
if git diff --cached --quiet; then
  echo "Nothing changed; site is already up to date."
  exit 0
fi
git commit --quiet -m "$MESSAGE"
git push --quiet origin HEAD
echo "Pushed. GitHub Pages updates in about a minute: https://omerjahangir.github.io/"
