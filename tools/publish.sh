#!/usr/bin/env bash
# Add one Compound brief to the feed and push it.
# Usage: tools/publish.sh <brief.json> <doc_id>
set -euo pipefail
cd "$(dirname "$0")/.."
[ $# -eq 2 ] || { echo "usage: tools/publish.sh <brief.json> <doc_id>"; exit 2; }
python3 tools/compound_epub.py "$1" "$2" feed
git add -A feed
if git diff --cached --quiet; then echo "feed unchanged"; exit 0; fi
git -c user.name="Compound" -c user.email="natdanai2707@gmail.com" commit -q -m "Add $2"
for attempt in 1 2 3; do
  git fetch -q origin main && git rebase -q origin/main || true
  if git push -q origin HEAD:main; then echo "pushed $2"; exit 0; fi
  sleep 5
done
echo "push failed" >&2; exit 1
