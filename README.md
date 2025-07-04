# 🔐 Auto Backup & Email Notification on Ubuntu

Tự động backup thư mục mỗi ngày và gửi email thông báo thành công/thất bại về Gmail, sử dụng `cron`, `tar`, và `msmtp`.

## 📦 Tính năng
- Tự động nén thư mục vào file `.tar.gz`
- Lưu file vào ổ rời hoặc thư mục riêng
- Gửi thông báo Gmail sau mỗi lần backup
- Chạy tự động mỗi ngày bằng `cron`
- Hỗ trợ Gmail SMTP bảo mật (không cần Postfix)

---

## 🧪 Yêu cầu hệ thống

- Ubuntu (tested on 22.04+)
- Đã cài `msmtp`, `mailutils`, `cron`
- Có Gmail và mật khẩu ứng dụng

---

## 🛠 Cài đặt

### 1. Cài các công cụ cần thiết

```bash
sudo apt update
sudo apt install msmtp msmtp-mta mailutils cron

