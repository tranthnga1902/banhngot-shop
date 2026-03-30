-- =====================================================
-- Database: PostgreSQL for Bakery Shop
-- Database Name: banhngot
-- =====================================================

-- Create Database (run separately if needed)
-- CREATE DATABASE banhngot;

-- =====================================================
-- TABLES
-- =====================================================

-- VaiTro (Role)
CREATE TABLE vai_tro (
    ma_vt SERIAL PRIMARY KEY,
    ten_vt VARCHAR(50) NOT NULL UNIQUE
);

-- TaiKhoan (Account)
CREATE TABLE tai_khoan (
    ma_tk SERIAL PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    mat_khau VARCHAR(255) NOT NULL,
    so_dien_thoai VARCHAR(20),
    ma_vt INTEGER NOT NULL REFERENCES vai_tro(ma_vt),
    trang_thai BOOLEAN DEFAULT true,
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BaiViet (Post/Blog)
CREATE TABLE bai_viet (
    ma_bv SERIAL PRIMARY KEY,
    ma_tk INTEGER NOT NULL REFERENCES tai_khoan(ma_tk),
    tieu_de VARCHAR(200) NOT NULL,
    noi_dung TEXT NOT NULL,
    ngay_dang TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    hinh_anh VARCHAR(500),
    trang_thai VARCHAR(20) DEFAULT 'Hiển thị'
);

-- LoaiSanPham (Product Category)
CREATE TABLE loai_san_pham (
    ma_loai SERIAL PRIMARY KEY,
    ten_loai VARCHAR(100) NOT NULL UNIQUE
);

-- SanPham (Product)
CREATE TABLE san_pham (
    ma_sp SERIAL PRIMARY KEY,
    ten_sp VARCHAR(200) NOT NULL,
    mo_ta TEXT,
    gia DECIMAL(18,2) NOT NULL,
    so_luong INTEGER NOT NULL DEFAULT 0,
    hinh_anh VARCHAR(500),
    ma_loai INTEGER NOT NULL REFERENCES loai_san_pham(ma_loai),
    ngay_tao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TrangThaiDonHang (Order Status)
CREATE TABLE trang_thai_don_hang (
    ma_ttdh SERIAL PRIMARY KEY,
    ten_ttdh VARCHAR(50) NOT NULL
);

-- PhuongThucThanhToan (Payment Method)
CREATE TABLE phuong_thuc_thanh_toan (
    ma_pttt SERIAL PRIMARY KEY,
    ten_pttt VARCHAR(100) NOT NULL UNIQUE
);

-- DiaChi (Address)
CREATE TABLE dia_chi (
    ma_dc SERIAL PRIMARY KEY,
    ma_tk INTEGER NOT NULL REFERENCES tai_khoan(ma_tk),
    dia_chi_chi_tiet VARCHAR(255) NOT NULL,
    mac_dinh BOOLEAN DEFAULT false
);

-- DonHang (Order)
CREATE TABLE don_hang (
    ma_dh SERIAL PRIMARY KEY,
    ma_kh INTEGER NOT NULL REFERENCES tai_khoan(ma_tk),
    ma_nv INTEGER REFERENCES tai_khoan(ma_tk),
    ma_dc INTEGER NOT NULL REFERENCES dia_chi(ma_dc),
    ngay_dat TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    tong_tien DECIMAL(18,2) NOT NULL,
    ma_ttdh INTEGER DEFAULT 1 REFERENCES trang_thai_don_hang(ma_ttdh),
    ma_pttt INTEGER NOT NULL REFERENCES phuong_thuc_thanh_toan(ma_pttt)
);

-- DonHangChiTiet (Order Detail)
CREATE TABLE don_hang_chi_tiet (
    ma_dhct SERIAL PRIMARY KEY,
    ma_dh INTEGER NOT NULL REFERENCES don_hang(ma_dh),
    ma_sp INTEGER NOT NULL REFERENCES san_pham(ma_sp),
    so_luong INTEGER NOT NULL,
    don_gia DECIMAL(18,2) NOT NULL
);

-- GioHang (Cart)
CREATE TABLE gio_hang (
    ma_tk INTEGER NOT NULL REFERENCES tai_khoan(ma_tk),
    ma_sp INTEGER NOT NULL REFERENCES san_pham(ma_sp),
    so_luong INTEGER NOT NULL,
    PRIMARY KEY (ma_tk, ma_sp)
);

-- DanhGia (Review)
CREATE TABLE danh_gia (
    ma_dg SERIAL PRIMARY KEY,
    ma_kh INTEGER NOT NULL REFERENCES tai_khoan(ma_tk),
    ma_sp INTEGER NOT NULL REFERENCES san_pham(ma_sp),
    ma_dh INTEGER NOT NULL REFERENCES don_hang(ma_dh),
    so_sao INTEGER CHECK (so_sao >= 1 AND so_sao <= 5),
    binh_luan VARCHAR(500),
    ngay_dg TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (ma_kh, ma_sp, ma_dh)
);

-- NhapKho (Stock Import)
CREATE TABLE nhap_kho (
    ma_nk SERIAL PRIMARY KEY,
    ma_sp INTEGER NOT NULL REFERENCES san_pham(ma_sp),
    so_luong INTEGER NOT NULL,
    ngay_nhap TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ThongKe (Statistics)
CREATE TABLE thong_ke (
    ma_thong_ke SERIAL PRIMARY KEY,
    ngay_bao_cao DATE NOT NULL UNIQUE,
    tong_doanh_thu DECIMAL(18,2) NOT NULL,
    tong_don_hang INTEGER NOT NULL,
    tong_san_pham_ban_ra INTEGER NOT NULL
);

-- =====================================================
-- INDEXES
-- =====================================================

CREATE INDEX idx_san_pham_ma_loai ON san_pham(ma_loai);
CREATE INDEX idx_san_pham_ten_sp ON san_pham(ten_sp);

-- =====================================================
-- SEED DATA: VaiTro (Roles)
-- =====================================================

INSERT INTO vai_tro (ma_vt, ten_vt) VALUES (1, 'Khách hàng');
INSERT INTO vai_tro (ma_vt, ten_vt) VALUES (2, 'Nhân viên');
INSERT INTO vai_tro (ma_vt, ten_vt) VALUES (3, 'Admin');

-- =====================================================
-- SEED DATA: LoaiSanPham (Product Categories)
-- =====================================================

INSERT INTO loai_san_pham (ma_loai, ten_loai) VALUES (1, 'Bánh Ngọt');
INSERT INTO loai_san_pham (ma_loai, ten_loai) VALUES (2, 'Bánh Mặn');
INSERT INTO loai_san_pham (ma_loai, ten_loai) VALUES (3, 'Bánh Khô');
INSERT INTO loai_san_pham (ma_loai, ten_loai) VALUES (4, 'Bánh Mì');

-- =====================================================
-- SEED DATA: TrangThaiDonHang (Order Status)
-- =====================================================

INSERT INTO trang_thai_don_hang (ma_ttdh, ten_ttdh) VALUES (1, 'Chờ xác nhận');
INSERT INTO trang_thai_don_hang (ma_ttdh, ten_ttdh) VALUES (2, 'Đang giao');
INSERT INTO trang_thai_don_hang (ma_ttdh, ten_ttdh) VALUES (3, 'Hoàn tất');
INSERT INTO trang_thai_don_hang (ma_ttdh, ten_ttdh) VALUES (4, 'Đã hủy');

-- =====================================================
-- SEED DATA: PhuongThucThanhToan (Payment Methods)
-- =====================================================

INSERT INTO phuong_thuc_thanh_toan (ma_pttt, ten_pttt) VALUES (1, 'COD - Thanh toán khi nhận hàng');
INSERT INTO phuong_thuc_thanh_toan (ma_pttt, ten_pttt) VALUES (2, 'Chuyển khoản ngân hàng');
INSERT INTO phuong_thuc_thanh_toan (ma_pttt, ten_pttt) VALUES (3, 'Ví điện tử Momo');
INSERT INTO phuong_thuc_thanh_toan (ma_pttt, ten_pttt) VALUES (4, 'Ví ZaloPay');

-- =====================================================
-- SEED DATA: TaiKhoan (Accounts)
-- Password hash: BCrypt encoded
-- admin123, staff123, user123
-- =====================================================

INSERT INTO tai_khoan (ma_tk, ho_ten, email, mat_khau, so_dien_thoai, ma_vt, trang_thai, ngay_tao) VALUES
(1, N'Nguyễn Văn Admin', N'admin@webtet.com', N'$2a$10$7m8QsrnJqCClmcxlD.zMP.KY7siTnzfR0GIu.f3JhDhFtX1i91vPS', N'0909000001', 3, true, '2026-03-16 23:44:36'),
(2, N'Lê Thị Nhân Viên', N'staff@webtet.com', N'$2a$10$us0gBMlpOFTwRTNgaaGVIOKttK9D5xukY8nQMN.NnaTFYomThI0tS', N'0909000002', 2, true, '2026-03-16 23:44:36'),
(3, N'TestCSRF', N'cust1@webtet.com', N'$2a$10$HIX5b.2tdVDDSIEe6cYb/.51q4NWleA7u79Ho52CHUR8BVqWlKvs2', N'0909000001', 1, true, '2026-03-16 23:44:36'),
(4, N'Phạm Thị Hoa', N'cust2@webtet.com', N'$2a$10$WKc6isGCo6jE9Q5e4LoH6.preKxDBZASkEJTz0Q/w5bjMc.jnCHIW', N'0909000004', 1, true, '2026-03-16 23:44:36'),
(5, N'Nguyễn Văn C', N'cust3@webtet.com', N'$2a$10$bhKW0vQ/kA4rCwwN0P.OpOuecHM/j0uUfbEiRfsszjxwXfgOMxRxi', N'0909999999', 1, true, '2026-03-16 23:44:36'),
(6, N'Ngô Thị C', N'cust4@webtet.com', N'$2a$10$ML6fwGKCCKmQpKwlfHaFROgIp.WYLQ2vW.oB2YDP79Mb6pwTbLK3C', N'0909000006', 1, true, '2026-03-16 23:44:36');

-- =====================================================
-- SEED DATA: SanPham (Products)
-- =====================================================

INSERT INTO san_pham (ma_sp, ten_sp, mo_ta, gia, so_luong, hinh_anh, ma_loai, ngay_tao) VALUES
(3, N'Bánh kem handmade phủ hạt', N'Bánh handmade phủ hạt dinh dưỡng, giòn thơm', 820000.00, 13, N'1774427057924_1773771036027_B4.jpg', 1, '2026-03-16 23:44:36'),
(4, N'Bánh mousse vani mini', N'Bánh mousse mềm mịn, tan ngay trong miệng', 750000.00, 0, N'1774427489230_1773888543124_B9.jpg', 1, '2026-03-16 23:44:36'),
(5, N'Bánh kem socola cổ điển', N'Bánh socola đậm vị, dành cho người thích ngọt', 1500000.00, 0, N'1774427511494_1773771072754_B24.jpg', 1, '2026-03-16 23:44:36'),
(6, N'Bánh kem trang trí hoa', N'Bánh kem tạo hình hoa tinh tế, thích hợp làm quà', 480000.00, 359, N'1774427564114_1773770923666_B34.png', 1, '2026-03-16 23:44:36'),
(7, N'Bánh kem nhiều tầng mini', N'Bánh nhiều tầng mini, đẹp mắt cho sự kiện nhỏ', 580000.00, 259, N'1774427523215_1773771028358_B3.jpg', 1, '2026-03-16 23:44:36'),
(8, N'Bánh kem in hình theo yêu cầu', N'Bánh in hình theo yêu cầu, cá nhân hóa độc đáo', 490000.00, 280, N'1774427543702_1773771036027_B4.jpg', 1, '2026-03-16 23:44:36'),
(9, N'Bánh quy bơ tổng hợp', N'Bánh quy bơ giòn tan, nhiều hương vị hấp dẫn', 990000.00, 89, N'1774427588567_1773771080443_B12.jpg', 1, '2026-03-16 23:44:36'),
(11, N'Bánh kem tiramisu cao cấp', N'Bánh tiramisu mềm mịn, vị cà phê nhẹ, sang trọng', 1250000.00, 69, N'1774427618980_1773771062789_B9.jpg', 1, '2026-03-16 23:44:36'),
(21, N'Bánh kem phô mai nướng (cheesecake)', N'Bánh cheesecake béo mịn, tan trong miệng', 3500000.00, 246, N'1774427964984_1773771036027_B4.jpg', 2, '2026-03-16 23:44:36'),
(22, N'Bánh kem mini trang trí đơn giản', N'Bánh mini nhỏ gọn, phù hợp tiệc nhẹ', 180000.00, 560, N'1774427975037_1773770881940_B3.jpg', 2, '2026-03-16 23:44:36'),
(23, N'Bánh kem trà sữa trân châu', N'Bánh kem trà sữa độc đáo, topping trân châu', 860000.00, 275, N'1774428014325_1773770954587_B36.jpg', 2, '2026-03-16 23:44:36'),
(25, N'Bánh kem chuối socola', N'Bánh chuối kết hợp socola ngọt dịu', 150000.00, 498, N'1774428025275_1773771080443_B12.jpg', 3, '2026-03-16 23:44:36'),
(27, N'Bánh kem hạt sen thanh nhẹ', N'Bánh hạt sen thanh nhẹ, tốt cho sức khỏe', 180000.00, 479, N'1774428037929_1773771080443_B12.jpg', 3, '2026-03-16 23:44:36'),
(30, N'Bánh tiramisu', N'Bánh tiramisu Ý chuẩn vị, lớp mascarpone mịn thơm béo', 65000.00, 150, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 1, '2026-03-16 23:44:36'),
(33, N'Bánh cheese cake Nhật', N'Cheesecake mềm kiểu Nhật, tan trong miệng, vị béo nhẹ', 80000.00, 110, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 1, '2026-03-16 23:44:36'),
(34, N'Bánh xíu mại chiên', N'Xíu mại nhân thịt heo băm, chiên giòn, chấm tương ớt', 40000.00, 250, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 2, '2026-03-16 23:44:36'),
(37, N'Bánh quiche lorraine', N'Quiche Pháp nhân kem trứng, thịt xông khói, phô mai', 70000.00, 93, N'1773770881940_B3.jpg', 2, '2026-03-16 23:44:36'),
(38, N'Bánh empanada nhân thịt bò', N'Bánh bột mì nhân thịt bò xào rau củ, nướng vàng đậm đà', 50000.00, 158, N'1773770954587_B36.jpg', 2, '2026-03-16 23:44:36'),
(39, N'Bánh quy bơ hộp thiếc', N'Bánh quy bơ Đan Mạch, giòn thơm, đóng hộp thiếc sang trọng', 120000.00, 199, N'1773770918040_B35.jpg', 3, '2026-03-16 23:44:36'),
(40, N'Bánh biscotti hạt hạnh nhân', N'Biscotti Ý nướng giòn, hạt hạnh nhân thơm, ăn cùng cà phê', 95000.00, 180, N'1773770923666_B34.png', 3, '2026-03-16 23:44:36'),
(41, N'Bánh macaron hộp 6 cái', N'Macaron Pháp đủ màu sắc, vỏ giòn nhân kem mềm thơm', 110000.00, 150, N'1773770947030_B33.jpg', 3, '2026-03-16 23:44:36'),
(42, N'Bánh brownie hạt óc chó', N'Brownie đậm vị socola, hạt óc chó giòn tan, không quá ngọt', 55000.00, 220, N'1773770969063_B32.jpg', 3, '2026-03-16 23:44:36'),
(43, N'Bánh quy socola chip', N'Bánh quy mềm vừa, hạt socola chip tan chảy thơm ngon', 75000.00, 300, N'1773770996535_B29.jpg', 3, '2026-03-16 23:44:36'),
(44, N'Bánh mì bơ tỏi phô mai', N'Bánh mì giòn vỏ, bơ tỏi thơm lừng, rắc phô mai parmesan', 35000.00, 300, N'1773771012849_B3.jpg', 4, '2026-03-16 23:44:36'),
(45, N'Bánh mì sandwich thịt nguội', N'Bánh mì sandwich nhân thịt nguội, phô mai, rau tươi giòn', 45000.00, 200, N'1773771036027_B4.jpg', 4, '2026-03-16 23:44:36'),
(46, N'Bánh mì pate chả', N'Bánh mì Việt Nam truyền thống, pate thơm, chả lụa tươi ngon', 30000.00, 350, N'1773771052668_B6.jpg', 4, '2026-03-16 23:44:36'),
(47, N'Bánh croissant bơ', N'Croissant Pháp nhiều lớp bơ, vỏ giòn rụm, thơm béo', 45000.00, 220, N'1773771062789_B9.jpg', 4, '2026-03-16 23:44:36'),
(48, N'Bánh mì focaccia', N'Focaccia Ý mềm xốp, rắc ô liu, rosemary và muối biển hồng', 65000.00, 130, N'1773771080443_B12.jpg', 4, '2026-03-16 23:44:36');

-- =====================================================
-- SEED DATA: ThongKe (Statistics)
-- =====================================================

INSERT INTO thong_ke (ma_thong_ke, ngay_bao_cao, tong_doanh_thu, tong_don_hang, tong_san_pham_ban_ra) VALUES
(1, '2025-01-01', 12500000.00, 32, 85),
(2, '2025-01-02', 8200000.00, 20, 54);

-- =====================================================
-- SEED DATA: NhapKho (Stock Import)
-- =====================================================

INSERT INTO nhap_kho (ma_nk, ma_sp, so_luong, ngay_nhap) VALUES
(3, 3, 60, '2026-03-16 23:44:36'),
(4, 4, 50, '2026-03-16 23:44:36'),
(5, 5, 30, '2026-03-16 23:44:36'),
(6, 6, 180, '2026-03-16 23:44:36'),
(7, 7, 130, '2026-03-16 23:44:36'),
(8, 8, 140, '2026-03-16 23:44:36'),
(9, 9, 45, '2026-03-16 23:44:36'),
(11, 11, 35, '2026-03-16 23:44:36'),
(21, 21, 240, '2026-03-16 23:44:36'),
(22, 22, 260, '2026-03-16 23:44:36'),
(23, 23, 180, '2026-03-16 23:44:36'),
(25, 25, 100, '2026-03-16 23:44:36'),
(27, 27, 240, '2026-03-16 23:44:36'),
(30, 30, 180, '2026-03-16 23:44:36'),
(33, 33, 900, '2026-03-16 23:44:36'),
(34, 34, 400, '2026-03-16 23:44:36'),
(37, 37, 300, '2026-03-16 23:44:36'),
(38, 38, 150, '2026-03-16 23:44:36'),
(39, 39, 120, '2026-03-16 23:44:36'),
(40, 40, 250, '2026-03-16 23:44:36');

-- =====================================================
-- SEED DATA: DiaChi (Addresses)
-- =====================================================

INSERT INTO dia_chi (ma_dc, ma_tk, dia_chi_chi_tiet, mac_dinh) VALUES
(1, 1, N'123 Quang Trung, Gò Vấp, TP.HCM', true),
(2, 2, N'456 Lê Lợi, Quận 1, TP.HCM', true),
(3, 3, N'789 Phạm Văn Đồng, Thủ Đức, TP.HCM', false),
(4, 4, N'fggh', true),
(5, 5, N'99 Lê Lai, Q1, TP.HCM - ĐÃ SỬA', true),
(6, 6, N'56 Phan Đình Phùng, Hà Nội', true);

-- =====================================================
-- SEED DATA: BaiViet (Posts/Blogs)
-- =====================================================

INSERT INTO bai_viet (ma_bv, ma_tk, tieu_de, noi_dung, ngay_dang, hinh_anh, trang_thai) VALUES
(1, 1, N'Mẹo chọn giỏ quà Tết phù hợp cho doanh nghiệp', N'Bài viết hướng dẫn chọn giỏ quà theo đối tượng: sếp, đối tác, khách hàng...', '2026-03-16 23:44:36', N'https://picsum.photos/seed/blog1/800/400', N'Hiển thị'),
(2, 2, N'Cách bảo quản mứt Tết lâu mà vẫn ngon', N'Những lưu ý khi bảo quản mứt, tránh ẩm mốc...', '2026-03-16 23:44:36', N'https://picsum.photos/seed/blog2/800/400', N'Hiển thị');

-- =====================================================
-- SEED DATA: DonHang (Orders)
-- =====================================================

INSERT INTO don_hang (ma_dh, ma_kh, ma_nv, ma_dc, ngay_dat, tong_tien, ma_ttdh, ma_pttt) VALUES
(1, 3, NULL, 3, '2026-03-16 23:44:36', 580000.00, 1, 1),
(2, 4, 2, 4, '2026-03-16 23:44:36', 1250000.00, 3, 2),
(3, 5, NULL, 5, '2026-03-16 23:44:36', 350000.00, 1, 3),
(4, 6, 2, 6, '2026-03-16 23:44:36', 1990000.00, 2, 1);

-- =====================================================
-- SEED DATA: DonHangChiTiet (Order Details)
-- =====================================================

INSERT INTO don_hang_chi_tiet (ma_dhct, ma_dh, ma_sp, so_luong, don_gia) VALUES
(1, 1, 7, 1, 580000.00),
(2, 2, 11, 1, 1250000.00),
(3, 3, 3, 2, 175000.00),
(4, 4, 5, 1, 1990000.00);

-- =====================================================
-- SEED DATA: GioHang (Cart)
-- =====================================================

INSERT INTO gio_hang (ma_tk, ma_sp, so_luong) VALUES
(1, 37, 1),
(4, 37, 1),
(4, 38, 1);

-- =====================================================
-- SEED DATA: DanhGia (Reviews)
-- =====================================================

INSERT INTO danh_gia (ma_dg, ma_kh, ma_sp, ma_dh, so_sao, binh_luan, ngay_dg) VALUES
(1, 3, 7, 1, 5, N'Giỏ quà đẹp, giao nhanh, rất hài lòng!', '2026-03-16 23:44:36'),
(2, 4, 11, 2, 4, N'Chất lượng tốt nhưng hộp hơi nhỏ hơn tưởng tượng.', '2026-03-16 23:44:36'),
(3, 5, 3, 3, 5, N'Mứt dừa thơm ngon, gói cẩn thận.', '2026-03-16 23:44:36');

-- =====================================================
-- Done!
-- =====================================================
