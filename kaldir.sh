#!/bin/bash
# Orta tuşla kaydırmayı ve uyarı gizlemeyi kapatır; başlatıcı Chrome'un varsayılanına döner.
set -e
BAYRAK="--enable-blink-features=MiddleClickAutoscroll"
GIZLE="--test-type"
YEREL=~/.local/share/applications/google-chrome.desktop

[ -f "$YEREL" ] || { echo "Kullanıcı başlatıcısı yok, yapılacak bir şey yok."; exit 0; }
cp "$YEREL" "$YEREL.yedek"
sed -i -e "s| $BAYRAK||" -e "s| $GIZLE||" "$YEREL"
update-desktop-database ~/.local/share/applications 2>/dev/null || true
grep '^Exec' "$YEREL"
echo "Kaldırıldı. Chrome'u tamamen kapatıp aç."
