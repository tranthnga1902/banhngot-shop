# 🍰 Bakery Shop - Website Bán Bánh Ngọt

<div align="center">

![Java](https://img.shields.io/badge/Java-17+-ED8B00?style=for-the-badge&logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-6DB33F?style=for-the-badge&logo=springboot&logoColor=white)
![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.x-005F0F?style=for-the-badge&logo=thymeleaf&logoColor=white)
![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=for-the-badge&logo=microsoftsqlserver&logoColor=white)
![Maven](https://img.shields.io/badge/Maven-3.9-C71A36?style=for-the-badge&logo=apachemaven&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

*A modern e-commerce platform for bakery businesses*

**[Demo Live](https://banhngot-shop.onrender.com)** · **[Report Bug](https://github.com/tranthnga1902/banhngot-shop/issues)** · **[Request Feature](https://github.com/tranthnga1902/banhngot-shop/issues)**

</div>

---

## 📌 Mục Lục

- [Giới Thiệu](#giới-thiệu)
- [Tính Năng](#tính-năng)
- [Công Nghệ Sử Dụng](#công-nghệ-sử-dụng)
- [Yêu Cầu Hệ Thống](#yêu-cầu-hệ-thống)
- [Bắt Đầu Nhanh](#bắt-đầu-nhanh)
- [Cấu Trúc Dự Án](#cấu-trúc-dự-án)
- [API Endpoints](#api-endpoints)
- [Triển Khai](#triển-khai)
- [Đóng Góp](#đóng-góp)
- [License](#license)

---

## 🎯 Giới Thiệu

**Bakery Shop** là nền tảng thương mại điện tử hoàn chỉnh dành cho cửa hàng bánh ngọt, được xây dựng bằng Spring Boot với giao diện hiện đại và thân thiện người dùng.

Hệ thống hỗ trợ **3 cấp quyền truy cập**:
- 👤 **Khách hàng** - Mua sắm, quản lý giỏ hàng, đặt hàng
- 👨‍💼 **Nhân viên** - Xử lý đơn hàng, quản lý đơn hàng
- 🔐 **Quản trị viên** - Toàn quyền quản lý hệ thống

---

## ✨ Tính Năng

### 👤 Khách Hàng
| Tính năng | Mô tả |
|-----------|-------|
| 🔍 **Tìm kiếm sản phẩm** | Tìm kiếm và lọc theo danh mục, giá |
| 🛒 **Giỏ hàng** | Thêm, sửa, xóa sản phẩm trong giỏ |
| 📦 **Đặt hàng** | Checkout với nhiều phương thức thanh toán |
| 👤 **Quản lý tài khoản** | Cập nhật thông tin cá nhân |
| 🔑 **Quên mật khẩu** | Khôi phục qua email |

### 👨‍💼 Nhân Viên
| Tính năng | Mô tả |
|-----------|-------|
| 📋 **Xem đơn hàng** | Danh sách đơn hàng cần xử lý |
| ✅ **Cập nhật trạng thái** | Xác nhận, giao hàng, hoàn thành |
| 📊 **Báo cáo** | Thống kê đơn hàng |

### 🔐 Quản Trị Viên
| Tính năng | Mô tả |
|-----------|-------|
| 📈 **Dashboard** | Thống kê doanh thu, đơn hàng |
| 🍰 **Quản lý sản phẩm** | CRUD sản phẩm, danh mục |
| 📦 **Quản lý đơn hàng** | Toàn quyền xử lý đơn hàng |
| 👥 **Quản lý người dùng** | Tạo, sửa, xóa tài khoản |
| 📝 **Quản lý blog** | Tin tức, khuyến mãi |

---

## 🛠️ Công Nghệ Sử Dụng

### Backend
<div align="center">

| Technology | Version | Purpose |
|------------|---------|---------|
| ![Java](https://img.shields.io/badge/Java-17-ED8B00?style=flat-square) | 17+ | Programming Language |
| ![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-6DB33F?style=flat-square) | 3.2.0 | Backend Framework |
| ![Spring Security](https://img.shields.io/badge/Spring%20Security-6.x-6DB33F?style=flat-square) | 6.x | Authentication & Authorization |
| ![Spring Data JPA](https://img.shields.io/badge/JPA-3.2-6DB33F?style=flat-square) | 3.2 | ORM Framework |
| ![Maven](https://img.shields.io/badge/Maven-3.9-C71A36?style=flat-square) | 3.9+ | Build Tool |

</div>

### Frontend
<div align="center">

| Technology | Purpose |
|------------|---------|
| ![Thymeleaf](https://img.shields.io/badge/Thymeleaf-3.x-005F0F?style=flat-square) | Template Engine |
| ![HTML5](https://img.shields.io/badge/HTML5-E34F26?style=flat-square&logo=html5) | Markup Language |
| ![CSS3](https://img.shields.io/badge/CSS3-1572B6?style=flat-square&logo=css3) | Styling |
| ![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?style=flat-square&logo=javascript) | Client Scripting |

</div>

### Database & Infrastructure
<div align="center">

| Technology | Purpose |
|------------|---------|
| ![SQL Server](https://img.shields.io/badge/SQL%20Server-2019-CC2927?style=flat-square&logo=microsoftsqlserver) | Database |
| ![Gmail SMTP](https://img.shields.io/badge/Gmail-SMTP-EA4335?style=flat-square&logo=gmail) | Email Service |
| ![Docker](https://img.shields.io/badge/Docker-Ready-2496ED?style=flat-square&logo=docker) | Containerization |

</div>

---

## 📋 Yêu Cầu Hệ Thống

### Phần mềm cần thiết

| Requirement | Version | Download |
|------------|---------|----------|
| JDK | 17+ | [Download](https://adoptium.net/) |
| Maven | 3.9+ | [Download](https://maven.apache.org/download.cgi) |
| SQL Server | 2019+ | [Download](https://www.microsoft.com/sql-server/sql-server-downloads) |
| Docker | 20.10+ | [Download](https://docker.com/get-started) |

---

## 🚀 Bắt Đầu Nhanh

### 1. Clone dự án

```bash
git clone https://github.com/tranthnga1902/banhngot-shop.git
cd banhngot-shop
```

### 2. Cài đặt Database

```sql
-- Tạo database trong SQL Server
CREATE DATABASE Webcake2;
GO

-- Import file SQL
sqlcmd -S localhost -U sa -P YOUR_PASSWORD -i asmfpt5\ 22.23.14.sql
```

### 3. Cấu hình Environment

```bash
# Copy file mẫu
copy .env.example .env

# Hoặc chỉnh sửa trực tiếp
# File: src/main/resources/application.properties
```

```properties
# application.properties
spring.datasource.url=jdbc:sqlserver://localhost:1433;databaseName=Webcake2;encrypt=false;trustServerCertificate=true
spring.datasource.username=sa
spring.datasource.password=YOUR_PASSWORD

# Email Configuration
spring.mail.username=your_email@gmail.com
spring.mail.password=your_app_password
```

### 4. Chạy ứng dụng

```bash
# Sử dụng Maven
mvn spring-boot:run

# Hoặc chạy file JAR
java -jar target/projectend-0.0.1-SNAPSHOT.jar
```

🌐 **Truy cập:** [http://localhost:8080](http://localhost:8080)

---

## 👥 Tài Khoản Mặc Định

> ⚠️ **Lưu ý:** Đổi mật khẩu ngay sau khi deploy lên production!

| Role | Username | Password |
|------|----------|----------|
| 🔐 Admin | `admin` | `admin123` |
| 👨‍💼 Staff | `staff` | `staff123` |
| 👤 Customer | `user` | `user123` |

---

## 📁 Cấu Trúc Dự Án

```
banhngot-shop/
├── src/main/java/com/example/projectend/
│   ├── BakeryShopApplication.java     # Main class
│   ├── controller/
│   │   ├── admin/                     # Admin controllers
│   │   │   ├── DashboardController.java
│   │   │   ├── ProductController.java
│   │   │   ├── OrderController.java
│   │   │   └── UserController.java
│   │   ├── staff/                     # Staff controllers
│   │   │   └── StaffOrderController.java
│   │   ├── HomeController.java        # Public controllers
│   │   └── CartController.java
│   ├── entity/                        # JPA Entities
│   │   ├── TaiKhoan.java
│   │   ├── SanPham.java
│   │   ├── DonHang.java
│   │   └── ChiTietDonHang.java
│   ├── repository/                    # Data Access Layer
│   ├── service/                       # Business Logic
│   │   ├── auth/
│   │   └── impl/
│   └── config/                        # Configuration
│       ├── SecurityConfig.java
│       └── WebConfig.java
│
├── src/main/resources/
│   ├── templates/                     # Thymeleaf Views
│   │   ├── layouts/
│   │   ├── admin/
│   │   ├── staff/
│   │   └── home/
│   ├── static/                        # CSS, JS, Images
│   └── application.properties         # App config
│
├── src/test/java/                     # Unit Tests
├── asmfpt5 22.23.14.sql               # Database script
├── Dockerfile                         # Docker config
├── docker-compose.yml                 # Docker Compose
├── pom.xml                            # Maven config
├── .env.example                       # Env template
└── README.md                          # This file
```

---

## 🔌 API Endpoints

### Public Routes (Không cần đăng nhập)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/` | Trang chủ |
| `GET` | `/san-pham` | Danh sách sản phẩm |
| `GET` | `/san-pham/{id}` | Chi tiết sản phẩm |
| `GET` | `/login` | Trang đăng nhập |
| `GET` | `/register` | Trang đăng ký |
| `GET` | `/quen-mat-khau` | Quên mật khẩu |

### Customer Routes (Cần đăng nhập)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/gio-hang` | Xem giỏ hàng |
| `POST` | `/gio-hang/them` | Thêm vào giỏ hàng |
| `POST` | `/gio-hang/xoa` | Xóa khỏi giỏ hàng |
| `POST` | `/checkout` | Đặt hàng |
| `GET` | `/profile` | Hồ sơ cá nhân |
| `POST` | `/profile/cap-nhat` | Cập nhật hồ sơ |

### Admin Routes (`/admin/*`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/admin/dashboard` | Dashboard |
| `GET` | `/admin/san-pham` | Quản lý sản phẩm |
| `POST` | `/admin/san-pham/them` | Thêm sản phẩm |
| `POST` | `/admin/san-pham/sua` | Sửa sản phẩm |
| `POST` | `/admin/san-pham/xoa` | Xóa sản phẩm |
| `GET` | `/admin/don-hang` | Quản lý đơn hàng |
| `POST` | `/admin/don-hang/cap-nhat` | Cập nhật đơn hàng |
| `GET` | `/admin/nguoi-dung` | Quản lý người dùng |

### Staff Routes (`/staff/*`)

| Method | Endpoint | Description |
|--------|----------|-------------|
| `GET` | `/staff/dashboard` | Dashboard nhân viên |
| `GET` | `/staff/don-hang` | Danh sách đơn hàng |
| `POST` | `/staff/don-hang/xu-ly` | Xử lý đơn hàng |

---

## 🚢 Triển Khai

### Docker (Khuyến nghị)

```bash
# Build image
docker build -t banhngot-shop .

# Chạy container
docker run -d -p 8080:8080 \
  --name banhngot \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e SPRING_DATASOURCE_URL="jdbc:sqlserver://YOUR_DB:1433;databaseName=Webcake2" \
  -e SPRING_DATASOURCE_USERNAME=sa \
  -e SPRING_DATASOURCE_PASSWORD=YOUR_PASSWORD \
  -e SPRING_MAIL_USERNAME=your_email@gmail.com \
  -e SPRING_MAIL_PASSWORD=your_app_password \
  banhngot-shop
```

### Docker Compose

```bash
docker-compose up -d
```

### Render.com (Free Tier)

1. Push code lên GitHub
2. Vào [render.com](https://render.com) → **New → Web Service**
3. Kết nối GitHub repo
4. Thêm Environment Variables:
   ```
   SPRING_PROFILES_ACTIVE=prod
   SPRING_DATASOURCE_URL=jdbc:sqlserver://YOUR_DB:1433;databaseName=Webcake2
   SPRING_DATASOURCE_USERNAME=sa
   SPRING_DATASOURCE_PASSWORD=YOUR_PASSWORD
   SPRING_MAIL_USERNAME=your_email@gmail.com
   SPRING_MAIL_PASSWORD=your_app_password
   ```
5. Click **Deploy**

### Railway.app

1. Push code lên GitHub
2. Vào [railway.app](https://railway.app) → **New Project**
3. Deploy từ GitHub
4. Thêm PostgreSQL database
5. Configure environment variables
6. Deploy!

---

## 🤝 Đóng Góp

Đóng góp luôn được chào đón! Vui lòng:

1. **Fork** dự án này
2. Tạo **Feature Branch** (`git checkout -b feature/AmazingFeature`)
3. **Commit** thay đổi (`git commit -m 'Add AmazingFeature'`)
4. **Push** lên Branch (`git push origin feature/AmazingFeature`)
5. Tạo **Pull Request**

---

## 📝 License

Dự án này được phát triển cho **mục đích học tập**.

Distributed under the MIT License. See [`LICENSE`](LICENSE) for more information.

---

## 📞 Liên Hệ

**Trần Thị Ngọc Á** - [@tranthnga1902](https://github.com/tranthnga1902)

Project Link: [https://github.com/tranthnga1902/banhngot-shop](https://github.com/tranthnga1902/banhngot-shop)

---

<div align="center">

⭐ Star this project if you find it helpful!

*Made with ❤️ by tranthnga1902*

</div>
