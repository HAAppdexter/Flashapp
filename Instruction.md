# Instruction Ứng Dụng Flashlight

## Mục tiêu
- ✅ Xây dựng ứng dụng đèn pin đa năng cho Android (Java)
- ❌ Nhóm người dùng: người dùng phổ thông, làm việc trong môi trường thiếu ánh sáng
- ❌ Thu nhập từ quảng cáo không gây phiền nhiễu

## Thứ tự triển khai
1. [Thiết lập dự án](instructions/core/setup.md) ✅
   - Cấu trúc thư mục chuẩn ✅
   - Dependencies và cấu hình ✅
   - Theme và state management ✅
   - Cấu hình AndroidManifest ✅

2. [Tính năng đèn pin](instructions/features/flashlight.md) ⏳
   - Bật/tắt đèn pin cơ bản ✅
   - UI một chạm với animation ✅
   - Điều chỉnh độ sáng ❌
   - Chế độ nhấp nháy và SOS ❌
   - Đèn nháy theo nhạc ❌

3. [La bàn](instructions/features/compass.md) ❌
   - Package đã cài đặt ✅
   - UI/UX chưa implement ❌
   - Chức năng chưa implement ❌

4. [Thời tiết](instructions/features/weather.md) ❌
   - Package đã cài đặt ✅
   - UI/UX chưa implement ❌
   - Chức năng chưa implement ❌

5. [Giao diện chính](instructions/ui/main_interface.md) ⏳
   - Theme sáng/tối ✅
   - Giao diện tối giản ✅
   - Widget truy cập nhanh ❌
   - Điều khiển thông qua cử chỉ ❌

6. [Tích hợp quảng cáo](instructions/monetization/ads.md) ⏳
   - Package đã cài đặt ✅
   - App ID đã cấu hình ✅
   - Banner ads chưa implement ❌
   - Logic hiển thị quảng cáo ❌

## Các thư viện tham khảo
- ✅ Sử dụng tối đa các thư viện bên thứ 3 để tránh phát sinh các resource
Ví dụ:
flutter_launcher_icons: ^0.14.3

## Chức năng chính
- ✅ Bật/tắt đèn pin với UI một chạm
- ❌ Điều chỉnh độ sáng
- ❌ Chế độ nhấp nháy và SOS
- ❌ Đèn nháy theo nhạc
- ❌ La bàn đơn giản
- ❌ Chế độ văn bản cuộn LED
- ❌ Thông tin thời tiết vị trí hiện tại (độ C/F)

## UI/UX
- ✅ Giao diện tối giản, dễ sử dụng trong môi trường tối
- ✅ Chủ đề tối/sáng tự động theo môi trường
- ❌ Widget truy cập nhanh
- ❌ Điều khiển thông qua cử chỉ đơn giản

## Tối ưu hóa
- ✅ Tiết kiệm pin tối đa khi sử dụng
- ✅ Hoạt động offline với các chức năng cơ bản
- ❌ Cache dữ liệu thời tiết
- ❌ Widget truy cập nhanh từ màn hình khóa

## Monetization
- ❌ Quảng cáo banner ở vị trí không ảnh hưởng UX
- ❌ Hiển thị quảng cáo khi không sử dụng đèn pin
- ❌ Không quảng cáo trong chế độ SOS khẩn cấp

## Lưu ý kỹ thuật
- ✅ Xin quyền camera, vị trí, âm thanh
- ✅ Hỗ trợ đa dạng phần cứng đèn flash
- ✅ Tối ưu cho cả điện thoại cũ
- ❌ Widget tùy chỉnh cho truy cập nhanh

## Legend
- ✅ Hoàn thành
- ⏳ Đang tiến hành
- ❌ Chưa bắt đầu
