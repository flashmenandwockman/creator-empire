#!/usr/bin/env bash
# Legt die Netlify-Site an (falls nötig) und deployt den Prototyp über die Netlify-API.
# Braucht nur curl, zip und ein Personal Access Token in NETLIFY_AUTH_TOKEN.
# Aufruf: NETLIFY_AUTH_TOKEN=... bash scripts/deploy-netlify.sh [site-name]
set -euo pipefail
cd "$(dirname "$0")/.."
SITE_NAME="${1:-creator-empire-proto}"
API="https://api.netlify.com/api/v1"
: "${NETLIFY_AUTH_TOKEN:?NETLIFY_AUTH_TOKEN fehlt (Netlify → User settings → Applications → Personal access tokens)}"
auth=(-H "Authorization: Bearer $NETLIFY_AUTH_TOKEN")

echo "1/4 Site suchen oder anlegen: $SITE_NAME"
SITE_JSON=$(curl -sS "${auth[@]}" "$API/sites?name=$SITE_NAME&filter=all")
SITE_ID=$(python3 -c "import json,sys; s=[x for x in json.load(sys.stdin) if x.get('name')=='$SITE_NAME']; print(s[0]['id'] if s else '')" <<<"$SITE_JSON")
if [ -z "$SITE_ID" ]; then
  SITE_ID=$(curl -sS "${auth[@]}" -H "Content-Type: application/json" -X POST "$API/sites" \
    -d "{\"name\":\"$SITE_NAME\"}" | python3 -c "import json,sys; print(json.load(sys.stdin)['id'])")
  echo "    neu angelegt: $SITE_ID"
else
  echo "    vorhanden: $SITE_ID"
fi

echo "2/4 Build"
bash prototype/build.sh

echo "3/4 Paket"
rm -f /tmp/ce-deploy.zip
( cd prototype/dist && zip -qr /tmp/ce-deploy.zip . )
cp netlify.toml prototype/dist/netlify.toml 2>/dev/null || true

echo "4/4 Deploy"
DEPLOY=$(curl -sS "${auth[@]}" -H "Content-Type: application/zip" -X POST \
  "$API/sites/$SITE_ID/deploys?title=$(date -u +%Y-%m-%dT%H:%M)" --data-binary @/tmp/ce-deploy.zip)
python3 - <<PY <<<"$DEPLOY"
import json,sys; d=json.load(sys.stdin)
print("    Status:", d.get("state")); print("    URL:   ", d.get("ssl_url") or d.get("url")); print("    Deploy:", d.get("deploy_ssl_url") or d.get("deploy_url"))
PY
