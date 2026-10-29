#!/bin/bash
# Orta tuşla kaydırmayı kapatır; Chrome'daki "unsupported command-line flag" uyarısı da kaybolur.
set -e
BAYRAK="--enable-blink-features=MiddleClickAutoscroll"
YEREL=~/.local/share/applications/google-chrome.desktop

[ -f "$YEREL" ] || { echo "Kullanıcı başlatıcısı yok, yapılacak bir şey yok."; exit 0; }
cp "$YEREL" "$YEREL.yedek"
sed -i "s| $BAYRAK||" "$YEREL"
update-desktop-database ~/.local/share/applications 2>/dev/null || true
grep '^Exec' "$YEREL"
echo "Kaldırıldı. Chrome'u tamamen kapatıp aç."
