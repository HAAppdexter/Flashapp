# Tích hợp quảng cáo

## Chức năng cần triển khai
- ❌ Banner ads ở vị trí phù hợp
- ❌ Interstitial ads khi thoát app
- ❌ Tắt quảng cáo trong chế độ SOS
- ❌ Giữa các màn có thể bổ sung quảng cáo inter để tối ưu doanh thu, tuy nhiên cần phân bổ hợp lý để tránh gây phiền phức, tốt nhất là sau các màn không có quảng cáo rewards
- ❌ Quản lý tần suất hiển thị

## Các class cần tạo
1. AdsManager.java
   - Khởi tạo AdMob
   - Quản lý hiển thị ads
   - Xử lý callbacks

2. AdsConfig.java
   - Cấu hình ID quảng cáo
   - Thiết lập tần suất
   - Quy tắc hiển thị

## Quy trình triển khai
1. Đăng ký AdMob
2. Tích hợp SDK
3. Thiết kế vị trí ads
4. Thêm logic hiển thị
5. Test và tối ưu

## Tối ưu
- Không ảnh hưởng UX
- Tối ưu thời điểm hiển thị
- Cache ads để load nhanh
- Xử lý khi không có mạng 