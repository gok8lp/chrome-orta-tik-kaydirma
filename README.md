# Chrome Orta Tık Kaydırma · Linux

Windows'ta Chrome'da orta tuşa basıp fareyi oynatınca sayfa kayar. Linux'ta Chrome bunu varsayılan olarak yapmaz.
Bu proje özelliği tek komutla açar veya kapatır.

## Kurulum

```bash
git clone <bu-repo> && cd chrome-orta-tik-kaydirma
./kur.sh
```

Sonra Chrome'u **tamamen** kapatıp aç (arka planda açık kalıyorsa sistem tepsisinden "Çık").

## Kapatma

```bash
./kaldir.sh
```

## Bilinmesi gerekenler

- Özellik Chrome'un `--enable-blink-features=MiddleClickAutoscroll` ayarıyla açılır. Ayar, kullanıcıya ait
  `~/.local/share/applications/google-chrome.desktop` başlatıcısına eklenir; sistem dosyasına dokunulmaz.
- Chrome bu ayar açıkken üstte şu uyarıyı gösterir:
  *"You are using an unsupported command-line flag … Stability and security will suffer."*
  Google bu ayarı resmi olarak desteklemediği için çıkan genel bir uyarıdır; bu ayar bir güvenlik açığı oluşturmaz.
  Uyarıyı istemiyorsan `./kaldir.sh` ile kapat; o zaman orta tuşla kaydırma da kapanır.
- Yalnızca bu başlatıcıdan (uygulama menüsü, dock) açılan Chrome'da çalışır; terminalden `google-chrome` ile açarsan ayar gelmez.
- Eski AutoScroll eklentisi 2018'den beri güncellenmediği için yeni Chrome sürümlerinde çalışmayabilir; bu yüzden ayar yolu kullanıldı.
- Her işlemde başlatıcının önceki hâli `google-chrome.desktop.yedek` olarak saklanır.

## Lisans

[MIT](LICENSE)
