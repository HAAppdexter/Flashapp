# Thiết lập dự án

## Cấu trúc thư mục
```
app/
├── src/main/
│   ├── java/com/flashapp/
│   │   ├── core/         # Core functions
│   │   ├── features/     # Các tính năng
│   │   ├── ui/          # Giao diện
│   │   └── utils/       # Tiện ích
│   └── res/             # Resources
```

## Các dependency cần thiết
```gradle
dependencies {
    // Camera & Flash
    implementation 'androidx.camera:camera-core:1.2.1'
    // Location & Weather
    implementation 'com.google.android.gms:play-services-location:21.0.1'
    // Ads
    implementation 'com.google.android.gms:play-services-ads:22.1.0'
}
```

## Quyền cần thiết
```xml
<uses-permission android:name="android.permission.CAMERA" />
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-feature android:name="android.hardware.camera.flash" />
``` 