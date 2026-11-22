#!/bin/sh
# Extract proprietary LG blobs for F70 D315 from a stock ROM system tree.
#
# Usage:
#   ./extract-blobs.sh /path/to/stock/system
#
# Linux example (stock system.img):
#   sudo mkdir -p /mnt/d315-system
#   sudo mount -o loop,ro system.img /mnt/d315-system
#   ./extract-blobs.sh /mnt/d315-system
#
# Windows: extract system.img with 7-Zip, then pass the extracted folder, e.g.
#   sh extract-blobs.sh /c/Users/You/Downloads/stock/system
#
# Run this from the repository root. Nothing is downloaded from LG here.
# The blobs are copied from the ROM you provide into vendor/lge/d315/proprietary/.

set -eu

LIST="vendor/lge/d315/proprietary-blobs.txt"
OUT="vendor/lge/d315/proprietary"

if [ "$#" -ne 1 ] || [ ! -d "$1" ]; then
    echo "Usage: $0 /path/to/stock/system" >&2
    exit 1
fi
if [ ! -f "$LIST" ]; then
    echo "Cannot find $LIST - run this script from the repository root." >&2
    exit 1
fi

SYSTEM=$(cd "$1" && pwd)
mkdir -p "$OUT"
ok=0
missing=0

while IFS= read -r line || [ -n "$line" ]; do
    line=$(printf '%s' "$line" | tr -d '\r')
    case "$line" in
        ''|'#'*) continue ;;
    esac
    # Also accept CM-style lines starting with file mode, e.g. "-rw-r--r-- ... path"
    case "$line" in
        -*) line=$(printf '%s\n' "$line" | awk '{print $NF}') ;;
    esac

    src="$SYSTEM/$line"
    dst="$OUT/$line"
    if [ -f "$src" ]; then
        mkdir -p "$(dirname "$dst")"
        cp -p "$src" "$dst"
        ok=$((ok + 1))
    else
        echo "MISSING: $line" >&2
        missing=$((missing + 1))
    fi
done < "$LIST"

echo "Copied $ok blobs, $missing missing -> $OUT"
[ "$missing" -eq 0 ]
