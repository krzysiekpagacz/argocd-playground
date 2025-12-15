set -euo pipefail
apk add --no-cache jq >/dev/null

# Save JSON safely
printf '%s' "${PAYLOAD}" > /tmp/response.json

# Validate JSON
jq -e . /tmp/response.json >/dev/null

# Extract fields
jq -r '.title // empty' /tmp/response.json > /tmp/title
jq -r '.version.number // empty' /tmp/response.json > /tmp/version
jq -r '.body.storage.value // empty' /tmp/response.json > /tmp/body.html

# Basic validation
if [ ! -s /tmp/title ] || [ ! -s /tmp/version ] || [ ! -s /tmp/body.html ]; then
  echo "Missing one of: title, version.number, body.storage.value" >&2
  exit 1
fi