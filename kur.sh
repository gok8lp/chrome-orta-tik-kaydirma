#!/bin/bash
# Linux'ta Chrome'a orta tuşla otomatik kaydırma ekler (Windows'taki gibi: orta tık + fareyi oynat).
# Kullanım: ./kur.sh   (sonra Chrome'u tamamen kapatıp aç)
set -e
BAYRAK="--enable-blink-features=MiddleClickAutoscroll"
# Desteklenmeyen ayar uyarı çubuğunu gizler
GIZLE="--test-type"
SISTEM=/usr/share/applications/google-chrome.desktop
YEREL=~/.local/share/applications/google-chrome.desktop

[ -f "$SISTEM" ] || { echo "HATA: Google Chrome kurulu değil ($SISTEM yok)" >&2; exit 1; }
mkdir -p "$(dirname "$YEREL")"
# Sistemin başlatıcısına dokunulmaz; kullanıcıya ait kopya onu geçersiz kılar
[ -f "$YEREL" ] || cp "$SISTEM" "$YEREL"
cp "$YEREL" "$YEREL.yedek"

for b in "$GIZLE" "$BAYRAK"; do
    grep -q -- "$b" "$YEREL" || sed -i "s|^\(Exec=/usr/bin/google-chrome-stable\)|\1 $b|" "$YEREL"
done
echo "Orta tuşla kaydırma açık, uyarı çubuğu gizli."
update-desktop-database ~/.local/share/applications 2>/dev/null || true
grep '^Exec' "$YEREL"
echo
echo "Chrome'u tamamen kapatıp aç."
