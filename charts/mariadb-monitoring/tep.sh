
# List file name and the UID field of each dashboard (shows "null" if missing)
for f in dashboards/*.json; do
  echo -n "$(basename "$f"): "
  jq -r '.uid // "null"' "$f"
done

# Also check IDs (should be null)
for f in dashboards/*.json; do
  echo -n "$(basename "$f"): id="
  jq -r '.id // "null"' "$f"
done

# Titles (helpful to see if they’re distinct)
for f in dashboards/*.json; do
  echo -n "$(basename "$f"): title="
  jq -r '.title // "null"' "$f"
done
