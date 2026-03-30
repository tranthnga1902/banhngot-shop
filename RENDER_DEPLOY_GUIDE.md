# Hướng Dẫn Deploy Lên Render.com (Miễn Phí)

## Các Bước Thực Hiện

### Bước 1: Push Code Lên GitHub

Đảm bảo tất cả các file đã được push lên GitHub:

```bash
cd "d:\democake2403\democake2403\democake2403"
git add .
git commit -m "Add PostgreSQL support and Render deployment config"
git push origin main
```

### Bước 2: Tạo Tài Khoản Render.com

1. Truy cập [render.com](https://render.com)
2. Đăng nhập bằng GitHub (nhanh nhất)
3. Cấp quyền cho Render truy cập repo của bạn

### Bước 3: Tạo PostgreSQL Database (Free Tier)

1. Trong Dashboard Render, click **New +**
2. Chọn **PostgreSQL**
3. Điền thông tin:
   - **Name**: `banhngot-db`
   - **Region**: Singapore (gần VN)
   - **Plan**: Free
   - **Database Name**: `banhngot`
4. Click **Create Database**
5. Sau khi tạo xong, copy **Internal Database URL** (để dùng sau)

### Bước 4: Deploy Web Service

1. Trong Dashboard, click **New +**
2. Chọn **Web Service**
3. Connect GitHub repo `banhngot-shop`
4. Cấu hình:
   - **Name**: `banhngot-shop`
   - **Region**: Singapore
   - **Branch**: `main`
   - **Plan**: Free
   - **Build Command**: `mvn clean package -DskipTests`
   - **Start Command**: `java -jar target/projectend-0.0.1-SNAPSHOT.jar`
5. Environment Variables, thêm:

| Key | Value |
|-----|-------|
| `SPRING_PROFILES_ACTIVE` | `prod` |
| `JPA_DDL_AUTO` | `none` |
| `JPA_SHOW_SQL` | `false` |
| `THYMELEAF_CACHE` | `true` |
| `LOG_LEVEL` | `INFO` |
| `SERVER_PORT` | `10000` |
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://<host>:<port>/banhngot` |
| `SPRING_DATASOURCE_USERNAME` | `banhngot_user` (từ bước 3) |
| `SPRING_DATASOURCE_PASSWORD` | `<password>` (từ bước 3) |
| `SPRING_DATASOURCE_DRIVER_CLASS_NAME` | `org.postgresql.Driver` |
| `SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT` | `org.hibernate.dialect.PostgreSQLDialect` |
| `SPRING_JPA_DATABASE_PLATFORM` | `org.hibernate.dialect.PostgreSQLDialect` |

6. Click **Create Web Service**

### Bước 5: Chạy SQL Init Script

Sau khi web service deploy thành công:

1. Kết nối vào PostgreSQL bằng psql hoặc dbeaver
2. Chạy file `init-postgresql.sql` để tạo tables và seed data

### Bước 6: Kiểm Tra

1. Truy cập URL của web service: `https://banhngot-shop.onrender.com`
2. Đăng nhập với tài khoản:
   - Admin: `admin@webtet.com` / `admin123`
   - Staff: `staff@webtet.com` / `staff123`
   - Customer: `cust1@webtet.com` / `cust123`

---

## Lưu Ý Quan Trọng

### Free Tier Limitations
- **PostgreSQL**: Sleeps after 90 days of inactivity
- **Web Service**: Sleeps after 15 minutes of inactivity (cold start ~30s)
- **Disk**: 512MB for PostgreSQL, 512MB for Web Service

### Khắc Phục Cold Start
- Web service sẽ tự động wake up khi có request
- Lần đầu truy cập có thể chậm ~30-60 giây

### Database Connection String
Render cung cấp connection string dạng:
```
postgres://username:password@host:port/database
```

Parse ra để điền vào các biến môi trường:
- Host: lấy phần sau `@` và trước `:`
- Port: mặc định `5432`
- Database: phần cuối sau `/`

---

## Troubleshooting

### Lỗi "Connection refused"
Kiểm tra environment variables đã điền đúng chưa, đặc biệt:
- `SPRING_DATASOURCE_URL`
- `SPRING_DATASOURCE_USERNAME`
- `SPRING_DATASOURCE_PASSWORD`

### Lỗi "Table not found"
Chạy lại `init-postgresql.sql` để tạo tables.

### Lỗi "Port already in use"
Đổi `SERVER_PORT` thành `10000` hoặc giá trị khác.

---

## Liên Kết Hữu Ích

- [Render Free Tier](https://render.com/docs/free)
- [Render PostgreSQL](https://render.com/docs/postgres-blueprint)
- [Spring Boot on Render](https://render.com/docs/deploy-java-spring-boot)