# Tính năng thời tiết

## Chức năng cần triển khai
- ❌ Lấy vị trí hiện tại
- ❌ Hiển thị nhiệt độ (C/F)
- ❌ Hiển thị độ ẩm
- ❌ Cache dữ liệu offline

## Các class cần tạo
1. WeatherManager.java
   - Xử lý vị trí GPS
   - Gọi API thời tiết
   - Quản lý cache

2. WeatherView.java
   - Hiển thị thông tin thời tiết
   - Chuyển đổi đơn vị
   - Animation cập nhật

## API và Services
- OpenWeatherMap API
- Google Location Services
- Room Database cho cache

## Quy trình triển khai
1. Xin quyền vị trí
2. Tích hợp API thời tiết
3. Tạo giao diện hiển thị
4. Thêm chức năng cache
5. Tối ưu cập nhật dữ liệu

## Tối ưu
- Cache thời tiết offline
- Giảm số lần gọi API
- Tự động cập nhật định kỳ 