# Tính năng đèn pin

## Chức năng cần triển khai
- ❌ Bật/tắt đèn flash
- ❌ Điều chỉnh độ sáng (nếu thiết bị hỗ trợ)
- ❌ Chế độ nhấp nháy với tần số tùy chỉnh
- ❌ Chế độ SOS (... --- ...)
- ❌ Đèn nháy theo nhạc

## Các class cần tạo
1. FlashlightManager.java
   - Quản lý trạng thái đèn pin
   - Xử lý quyền camera
   - Điều khiển đèn flash

2. StrobeController.java
   - Điều khiển nhấp nháy
   - Timer cho SOS
   - Phân tích âm thanh cho đèn nháy theo nhạc

## Quy trình triển khai
1. Xin quyền camera
2. Khởi tạo CameraManager
3. Tạo giao diện điều khiển
4. Thêm chức năng cơ bản
5. Thêm các chế độ đặc biệt

## Tối ưu
- Giảm thiểu sử dụng pin
- Xử lý lỗi phần cứng
- Cache trạng thái 