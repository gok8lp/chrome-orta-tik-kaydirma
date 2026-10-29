#!/bin/bash
# Linux'ta Chrome'a orta tuşla otomatik kaydırma ekler (Windows'taki gibi: orta tık + fareyi oynat).
# Kullanım: ./kur.sh   (sonra Chrome'u tamamen kapatıp aç)
set -e
BAYRAK="--enable-blink-features=MiddleClickAutoscroll"
SISTEM=/usr/share/applications/google-chrome.desktop
YEREL=~/.local/share/applications/google-chrome.desktop

[ -f "$SISTEM" ] || { echo "HATA: Google Chrome kurulu değil ($SISTEM yok)" >&2; exit 1; }
mkdir -p "$(dirname "$YEREL")"
# Sistemin başlatıcısına dokunulmaz; kullanıcıya ait kopya onu geçersiz kılar
[ -f "$YEREL" ] || cp "$SISTEM" "$YEREL"
cp "$YEREL" "$YEREL.yedek"

if grep -q -- "$BAYRAK" "$YEREL"; then
    echo "Zaten açık."
else
    sed -i "s|^\(Exec=/usr/bin/google-chrome-stable\)|\1 $BAYRAK|" "$YEREL"
    echo "Orta tuşla kaydırma eklendi."
fi
update-desktop-database ~/.local/share/applications 2>/dev/null || true
grep '^Exec' "$YEREL"
echo
echo "Chrome'u tamamen kapatıp aç. Chrome üstte bir 'unsupported command-line flag' uyarısı gösterecek;"
echo "bu ayar Google'ın resmi desteklediği bir ayar olmadığı için çıkan kalıp bir uyarı, zararı yok."
