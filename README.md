# Karavan Kontrol

## Android telefon emülatöründe çalıştırma

Android Studio'da **Device Manager** üzerinden bir Android emülatörü başlat. Ardından proje klasöründe terminal aç:

```powershell
flutter pub get
flutter devices
flutter run -d <emulator-id>
```

`flutter devices` çıktısındaki Android cihaz kimliğini `<emulator-id>` yerine yaz. Uygulama açıkken değişiklikleri görmek için terminalde `r` tuşuna bas.

## Kontroller

```powershell
flutter analyze
flutter test
```

Akü, su ve sıcaklık değerleri örnektir; gerçek karavan donanımına henüz bağlı değildir.
