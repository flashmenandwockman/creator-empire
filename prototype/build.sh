#!/usr/bin/env bash
# Baut den Prototyp als vollständige statische Seite nach prototype/dist/.
# index.html ist bewusst ohne <html>/<head> geschrieben (Artifact-Format); hier wird der Rahmen ergänzt.
set -euo pipefail
cd "$(dirname "$0")"
rm -rf dist && mkdir -p dist
{
  echo '<!doctype html><html lang="de"><head><meta charset="utf-8">'
  echo '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">'
  echo '<meta name="robots" content="noindex,nofollow">'
  echo '<meta name="description" content="Creator Empire – Klickprototyp Phase 0. Interner Test.">'
  echo '<link rel="icon" href="data:image/svg+xml,<svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 100 100%22><rect width=%22100%22 height=%22100%22 rx=%2224%22 fill=%22%23ff8a3d%22/><text x=%2250%22 y=%2268%22 font-size=%2252%22 text-anchor=%22middle%22 fill=%22white%22 font-family=%22Arial%22 font-weight=%22bold%22>CE</text></svg>">'
  echo '<style>:root{padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}[hidden]{display:none!important}</style>'
  echo '</head><body>'
  cat index.html
  echo '</body></html>'
} > dist/index.html
cp -r assets dist/assets
echo "dist/ gebaut: $(du -sh dist | cut -f1)"
