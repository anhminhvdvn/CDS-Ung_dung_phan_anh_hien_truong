<h1 align="center">ỨNG DỤNG PHẢN ÁNH HIỆN TRƯỜNG</h1>

<div align="center">

<p align="center">
  <img src="https://raw.githubusercontent.com/anhminhvdvn/CanhBaoDotNhap/main/images/logoDaiNam.png" width="150"> 
</p>

<br>
 
[![Fit DNU](https://img.shields.io/badge/Fit%20DNU-green?style=for-the-badge)](https://fitdnu.net/)
[![DaiNam University](https://img.shields.io/badge/DaiNam%20University-red?style=for-the-badge)](https://dainam.edu.vn)

</br>
</div>

---

## 🌟 Giới thiệu

**Ứng dụng Phản Ánh Hiện Trường** là một hệ thống công nghệ hỗ trợ người dân **gửi thông tin phản ánh** về các sự cố ngoài hiện trường (như **rác thải, cây đổ, tắc đường, tai nạn, ngập lụt, thiết bị công cộng hỏng, đánh nhau**, …) tới **cơ quan chức năng** để kịp thời xử lý.

Hệ thống gồm hai phần:
- **Ứng dụng di động (Mobile App)**: Người dân gửi phản ánh bằng **hình ảnh, mô tả và loại sự cố**.
- **Trang quản lý (Web Dashboard)**: Cơ quan chức năng tiếp nhận, xem và xử lý phản ánh theo thời gian thực.

---

## ⚙️ Mục tiêu

- Tăng tính **minh bạch, kết nối hai chiều** giữa người dân và cơ quan quản lý.  
- Rút ngắn thời gian **phát hiện – xử lý – phản hồi** các sự cố công cộng.  
- Ứng dụng dễ sử dụng, thân thiện, chạy tốt trên điện thoại Android/iOS.

---

## 🌟 Tính năng chính

### 📱 **Ứng dụng di động (người dân)**
- **Gửi phản ánh hiện trường:**
  - Chụp ảnh hoặc chọn ảnh từ thư viện.
  - Nhập **mô tả ngắn gọn** về sự việc.
  - Chọn **loại sự cố** (rác thải, ngập, cây đổ, tai nạn…).
  - Gửi phản ánh trực tiếp đến hệ thống.

- **Theo dõi phản ánh đã gửi:**
  - Xem danh sách các phản ánh đã nộp.
  - Theo dõi **trạng thái xử lý** (chưa xử lý / đang xử lý / đã xử lý).

- **Giao diện thân thiện:**
  - Thiết kế bằng **Flutter**, bố cục rõ ràng, dễ thao tác.
  - Hỗ trợ **đa ngôn ngữ** (có thể mở rộng).

---

### 🖥️ **Trang quản lý (dành cho cơ quan chức năng)**
- **Xem danh sách phản ánh:** hiển thị hình ảnh, loại sự cố, mô tả, thời gian gửi.  
- **Phân loại và lọc phản ánh:** theo loại sự cố hoặc trạng thái xử lý.  
- **Cập nhật trạng thái xử lý:** dễ dàng thay đổi tiến độ và phản hồi người dân.  
- **Quản lý tài khoản người dùng:** hỗ trợ xác thực và phân quyền quản trị.

---

## 📂 Cấu trúc dự án

```
PhanAnhHienTruong
├── 📱 mobile_app/ # Ứng dụng Flutter cho người dân'
│ ├── lib/
│ │ ├── models/ # Model dữ liệu phản ánh  
│ │ ├── screens/ # Giao diện các màn hình
│ │ ├── services/ # API kết nối backend
│ │ └── main.dart  
│ ├── pubspec.yaml
│ └── README.md
│
├── 🌐 web_dashboard/ # Trang quản lý phản ánh (React / NextJS)
│ ├── src/
│ │ ├── pages/
│ │ ├── components/
│ │ ├── services/
│ │ └── store/
│ ├── package.json
│ └── README.md
│
├── 🧠 backend_api/ # API trung gian kết nối mobile và web
│ ├── server.js (Node.js / NestJS)
│ ├── seed.js
│ ├── package-lock.json
│ ├── package.json
│ ├── .gitignore
│ ├── .env
│ ├── uploads/
│ ├── src/
│ │ ├── models/
│ │ └── routes/
│ └── node/module
│
└── 📄 README.md # Tài liệu chính của dự án
```

--- 

## 🛠️ CÔNG NGHỆ SỬ DỤNG

### 📱 Ứng dụng di động

 

<div align="center">
<br>
[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?style=for-the-badge&logo=flutter)]()
[![GetX](https://img.shields.io/badge/GetX-State%20Management-purple?style=for-the-badge)]()
[![Dart](https://img.shields.io/badge/Dart-2.x-blue?style=for-the-badge&logo=dart)]()
</br>
</div>

### 🌐 Trang quản lý
<div align="center">
<br>
[![React](https://img.shields.io/badge/React-18.x-blue?style=for-the-badge&logo=react)]()
[![Vite](https://img.shields.io/badge/Vite-Build%20Tool-orange?style=for-the-badge)]()
[![Tailwind](https://img.shields.io/badge/TailwindCSS-Design%20System-06B6D4?style=for-the-badge)]()
</br>
</div>

### 🧠 Backend & Cơ sở dữ liệu
<div align="center">
<br>
[![NodeJS](https://img.shields.io/badge/NodeJS-Server-brightgreen?style=for-the-badge&logo=node.js)]()
[![Express](https://img.shields.io/badge/Express-Framework-lightgrey?style=for-the-badge)]()
[![MongoDB](https://img.shields.io/badge/MongoDB-Database-green?style=for-the-badge&logo=mongodb)]()
[![Cloudinary](https://img.shields.io/badge/Cloudinary-Image%20Storage-blue?style=for-the-badge&logo=cloudinary)]()
</br>
</div>

---

## 🚀 Hướng Dẫn Cài Đặt

### 1️⃣ Chuẩn bị môi trường
- Cài **Flutter SDK**, **Node.js**, **MongoDB**.
- Cài trình quản lý gói:  
  ```bash
  npm install -g pnpm

2️⃣ Cài đặt ứng dụng di động
 ```cd mobile_app
flutter pub get
flutter run

3️⃣ Cài đặt trang quản lý web
```cd web_dashboard
pnpm install
pnpm run dev

4️⃣ Khởi chạy API backend
```cd backend_api
npm install
npm start

📖 Hướng Dẫn Sử Dụng
👩‍💼 Phía người dân (Mobile App)

```Mở ứng dụng → chọn “Phản ánh mới”.

Chụp ảnh hoặc chọn ảnh có sẵn.

Nhập mô tả chi tiết sự việc.

Chọn loại sự cố (rác, ngập, cây đổ, v.v).

Gửi phản ánh → xem lại trạng thái trong tab “Lịch sử”.

🧑‍💻 Phía cơ quan (Web Dashboard)

```Đăng nhập hệ thống quản lý.

Xem danh sách phản ánh mới gửi.

Lọc và xử lý theo loại hoặc khu vực.

Cập nhật trạng thái để phản hồi người dân.

⚙️ Cấu Hình & Lưu Ý

```Ảnh được lưu trữ tạm thời trên Cloudinary hoặc server nội bộ.

Ứng dụng mobile hiện chưa hỗ trợ GPS, người dân nhập địa điểm bằng text.

Có thể mở rộng để tích hợp bản đồ, chatbot hỗ trợ, và thông báo đẩy (Firebase).
 
🤝 Đóng góp

Dự án được phát triển bởi Nhóm 6 – CNTT16-05, Khoa Công Nghệ Thông Tin, Trường Đại học Đại Nam
Dưới sự hướng dẫn của Phòng Lab AIoT (AIoT Lab – DNU).

© 2025 NHÓM 6, CNTT16-05, TRƯỜNG ĐẠI HỌC ĐẠI NAM