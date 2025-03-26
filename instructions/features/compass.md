# Tính năng la bàn

## Chức năng cần triển khai
- ❌ Hiển thị hướng chính (N, S, E, W)
- ❌ Hiển thị góc quay
- ❌ Hiệu ứng xoay mượt mà
- ❌ Hiệu chỉnh độ lệch từ trường

## Các class cần tạo
1. CompassManager.java
   - Đọc cảm biến từ trường
   - Tính toán hướng
   - Xử lý nhiễu

2. CompassView.java
   - Vẽ giao diện la bàn
   - Xử lý animation
   - Hiển thị thông tin

## Quy trình triển khai
1. Kiểm tra cảm biến từ trường
2. Tạo giao diện la bàn
3. Xử lý dữ liệu cảm biến
4. Thêm hiệu ứng chuyển động
5. Tối ưu độ chính xác

## Tối ưu
- Làm mịn dữ liệu cảm biến
- Giảm thiểu sử dụng pin
- Cache hướng hiện tại 