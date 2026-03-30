USE [master]
GO
/****** Object:  Database [Webcake2]    Script Date: 3/30/2026 8:59:44 PM ******/
CREATE DATABASE [Webcake2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebBanHangTet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Webcake2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebBanHangTet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS01\MSSQL\DATA\Webcake2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Webcake2] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Webcake2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Webcake2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Webcake2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Webcake2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Webcake2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Webcake2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Webcake2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Webcake2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Webcake2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Webcake2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Webcake2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Webcake2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Webcake2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Webcake2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Webcake2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Webcake2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Webcake2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Webcake2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Webcake2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Webcake2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Webcake2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Webcake2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Webcake2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Webcake2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Webcake2] SET  MULTI_USER 
GO
ALTER DATABASE [Webcake2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Webcake2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Webcake2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Webcake2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Webcake2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Webcake2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Webcake2] SET QUERY_STORE = ON
GO
ALTER DATABASE [Webcake2] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Webcake2]
GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBV] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NOT NULL,
	[TieuDe] [nvarchar](200) NOT NULL,
	[NoiDung] [nvarchar](max) NOT NULL,
	[NgayDang] [datetime] NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[TrangThai] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaDG] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[MaDH] [int] NOT NULL,
	[SoSao] [int] NULL,
	[BinhLuan] [nvarchar](500) NULL,
	[NgayDG] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiaChi]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiaChi](
	[MaDC] [int] IDENTITY(1,1) NOT NULL,
	[MaTK] [int] NOT NULL,
	[DiaChiChiTiet] [nvarchar](255) NOT NULL,
	[MacDinh] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDH] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NOT NULL,
	[MaNV] [int] NULL,
	[MaDC] [int] NOT NULL,
	[NgayDat] [datetime] NULL,
	[TongTien] [decimal](18, 2) NOT NULL,
	[MaTTDH] [int] NULL,
	[MaPTTT] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangChiTiet](
	[MaDHCT] [int] IDENTITY(1,1) NOT NULL,
	[MaDH] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDHCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaTK] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhapKho]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhapKho](
	[MaNK] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[NgayNhap] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhuongThucThanhToan]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhuongThucThanhToan](
	[MaPTTT] [int] IDENTITY(1,1) NOT NULL,
	[TenPTTT] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaPTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](200) NOT NULL,
	[MoTa] [nvarchar](max) NULL,
	[Gia] [decimal](18, 2) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[HinhAnh] [nvarchar](500) NULL,
	[MaLoai] [int] NOT NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[MatKhau] [nvarchar](255) NOT NULL,
	[SoDienThoai] [nvarchar](20) NULL,
	[MaVT] [int] NOT NULL,
	[TrangThai] [bit] NULL,
	[NgayTao] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThongKe]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongKe](
	[MaThongKe] [int] IDENTITY(1,1) NOT NULL,
	[NgayBaoCao] [date] NOT NULL,
	[TongDoanhThu] [decimal](18, 2) NOT NULL,
	[TongDonHang] [int] NOT NULL,
	[TongSanPhamBanRa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaThongKe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThaiDonHang]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThaiDonHang](
	[MaTTDH] [int] IDENTITY(1,1) NOT NULL,
	[TenTTDH] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTTDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 3/30/2026 8:59:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [int] IDENTITY(1,1) NOT NULL,
	[TenVT] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBV], [MaTK], [TieuDe], [NoiDung], [NgayDang], [HinhAnh], [TrangThai]) VALUES (1, 1, N'Mẹo chọn giỏ quà Tết phù hợp cho doanh nghiệp', N'Bài viết hướng dẫn chọn giỏ quà theo đối tượng: sếp, đối tác, khách hàng...', CAST(N'2026-03-16T23:44:36.340' AS DateTime), N'https://picsum.photos/seed/blog1/800/400', N'Hiển thị')
INSERT [dbo].[BaiViet] ([MaBV], [MaTK], [TieuDe], [NoiDung], [NgayDang], [HinhAnh], [TrangThai]) VALUES (2, 2, N'Cách bảo quản mứt Tết lâu mà vẫn ngon', N'Những lưu ý khi bảo quản mứt, tránh ẩm mốc...', CAST(N'2026-03-16T23:44:36.340' AS DateTime), N'https://picsum.photos/seed/blog2/800/400', N'Hiển thị')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
GO
SET IDENTITY_INSERT [dbo].[DanhGia] ON 

INSERT [dbo].[DanhGia] ([MaDG], [MaKH], [MaSP], [MaDH], [SoSao], [BinhLuan], [NgayDG]) VALUES (1, 3, 7, 1, 5, N'Giỏ quà đẹp, giao nhanh, rất hài lòng!', CAST(N'2026-03-16T23:44:36.337' AS DateTime))
INSERT [dbo].[DanhGia] ([MaDG], [MaKH], [MaSP], [MaDH], [SoSao], [BinhLuan], [NgayDG]) VALUES (2, 4, 11, 2, 4, N'Chất lượng tốt nhưng hộp hơi nhỏ hơn tưởng tượng.', CAST(N'2026-03-16T23:44:36.337' AS DateTime))
INSERT [dbo].[DanhGia] ([MaDG], [MaKH], [MaSP], [MaDH], [SoSao], [BinhLuan], [NgayDG]) VALUES (3, 5, 3, 3, 5, N'Mứt dừa thơm ngon, gói cẩn thận.', CAST(N'2026-03-16T23:44:36.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[DanhGia] OFF
GO
SET IDENTITY_INSERT [dbo].[DiaChi] ON 

INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (1, 1, N'123 Quang Trung, Gò Vấp, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (2, 2, N'456 Lê Lợi, Quận 1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (3, 3, N'789 Phạm Văn Đồng, Thủ Đức, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (4, 4, N'fggh', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (5, 5, N'99 Lê Lai, Q1, TP.HCM - ĐÃ SỬA', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (6, 6, N'56 Phan Đình Phùng, Hà Nội', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (7, 7, N'78 Trần Hưng Đạo, Hải Phòng', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (8, 8, N'90 Lương Khánh Thiện, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (9, 9, N'22 Nguyễn Văn Cừ, Cần Thơ', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (10, 10, N'11 Phạm Ngũ Lão, Nha Trang', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (11, 4, N'chhv', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (12, 3, N'123 Lê Lợi, Quận 1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (13, 67, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (14, 68, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (15, 70, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (16, 71, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (17, 71, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (18, 72, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (19, 72, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (20, 77, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (21, 78, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (22, 78, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (23, 79, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (24, 79, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (25, 80, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (26, 80, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (27, 81, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (28, 81, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (30, 3, N'111 Lê Lai, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (31, 3, N'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (32, 3, N'222 Test Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (33, 82, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (34, 82, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (35, 83, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (36, 83, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (37, 3, N' Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (38, 3, N'i, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (39, 85, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (41, 86, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (42, 86, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (43, 87, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (44, 87, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (45, 3, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (46, 88, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (47, 88, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (48, 3, N'222 Test Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (49, 3, N'111 Lê Lai, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (50, 89, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (51, 89, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (52, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (53, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (54, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (55, 90, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (56, 90, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (57, 91, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (58, 91, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (59, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (60, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (61, 92, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (62, 93, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (63, 93, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (64, 94, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (65, 94, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (66, 5, N'222 Test Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (67, 5, N'111 Lê Lai, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (69, 5, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (70, 95, N'111 Nam Kỳ Khởi Nghĩa, Q3, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (71, 95, N'222 Pasteur, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (72, 5, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (73, 96, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (74, 96, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (75, 5, N'99 Lê Lai, Q1, TP.HCM - TEST1774711279129', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (76, 98, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (77, 98, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (78, 99, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (79, 99, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (80, 5, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (81, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (82, 100, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (83, 5, N'99 Lê Lai, Q1, TP.HCM - TEST1774714577241', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (84, 101, N'123 Lê Lợi, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (85, 101, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (86, 102, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (87, 102, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (88, 5, N'222 Test Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (89, 5, N'111 Lê Lai, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (91, 5, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (92, 104, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (93, 104, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (94, 105, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (95, 105, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (96, 109, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (97, 109, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (98, 110, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (99, 110, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (100, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (101, 111, N'45 Nguyễn Huệ, Q1, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (102, 5, N'99 Lê Lai, Q1, TP.HCM - TEST1774716181903', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (103, 112, N'123 Lê Lợi, Q1, TP.HCM', 1)
GO
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (104, 112, N'456 Nguyễn Trãi, Q5, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (105, 113, N'789 Lý Thường Kiệt, Q10, TP.HCM', 1)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (106, 113, N'321 Trần Hưng Đạo, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (107, 5, N'222 Test Street, Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (108, 5, N'111 Lê Lai, Q1, TP.HCM', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (110, 5, N'Q1', 0)
INSERT [dbo].[DiaChi] ([MaDC], [MaTK], [DiaChiChiTiet], [MacDinh]) VALUES (111, 5, N'123 Lê Lợi, Quận 1, TP.HCM', 1)
SET IDENTITY_INSERT [dbo].[DiaChi] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (1, 3, NULL, 3, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(580000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (2, 4, 2, 4, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(1250000.00 AS Decimal(18, 2)), 3, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (3, 5, NULL, 5, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(350000.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (4, 6, 2, 6, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(1990000.00 AS Decimal(18, 2)), 2, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (5, 7, NULL, 7, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(220000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (6, 8, NULL, 8, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (7, 9, 2, 9, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(450000.00 AS Decimal(18, 2)), 2, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (8, 10, NULL, 10, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(300000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (9, 3, 2, 3, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(1500000.00 AS Decimal(18, 2)), 3, 4)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (10, 4, NULL, 4, CAST(N'2026-03-16T23:44:36.320' AS DateTime), CAST(270000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (11, 2, NULL, 2, CAST(N'2026-03-18T14:46:45.870' AS DateTime), CAST(85000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (12, 5, NULL, 5, CAST(N'2026-03-18T23:30:45.550' AS DateTime), CAST(85000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (13, 5, NULL, 5, CAST(N'2026-03-18T23:43:26.333' AS DateTime), CAST(115000.00 AS Decimal(18, 2)), 3, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (14, 4, NULL, 4, CAST(N'2026-03-26T11:15:37.190' AS DateTime), CAST(270000.00 AS Decimal(18, 2)), 3, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (15, 4, NULL, 4, CAST(N'2026-03-26T11:21:48.057' AS DateTime), CAST(100000.00 AS Decimal(18, 2)), 4, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (16, 6, NULL, 6, CAST(N'2026-03-29T00:42:04.580' AS DateTime), CAST(100000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (17, 6, NULL, 6, CAST(N'2026-03-29T00:42:44.413' AS DateTime), CAST(80000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (18, 3, NULL, 12, CAST(N'2026-03-29T18:01:01.270' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (19, 3, NULL, 12, CAST(N'2026-03-29T18:01:10.693' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (20, 3, NULL, 12, CAST(N'2026-03-29T18:01:19.137' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (21, 3, NULL, 12, CAST(N'2026-03-29T18:02:09.260' AS DateTime), CAST(15350000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (22, 3, NULL, 12, CAST(N'2026-03-29T18:02:17.837' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (23, 3, NULL, 12, CAST(N'2026-03-29T18:07:54.280' AS DateTime), CAST(15350000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (24, 3, NULL, 12, CAST(N'2026-03-29T18:09:42.110' AS DateTime), CAST(9210000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (25, 3, NULL, 12, CAST(N'2026-03-29T18:10:47.893' AS DateTime), CAST(12280000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (26, 3, NULL, 12, CAST(N'2026-03-29T18:12:24.177' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (27, 3, NULL, 12, CAST(N'2026-03-29T18:20:30.783' AS DateTime), CAST(12280000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (28, 3, NULL, 12, CAST(N'2026-03-29T18:20:48.443' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (29, 3, NULL, 12, CAST(N'2026-03-29T18:21:03.663' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (30, 3, NULL, 12, CAST(N'2026-03-29T18:21:19.203' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (31, 3, NULL, 12, CAST(N'2026-03-29T18:21:27.880' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (32, 3, NULL, 12, CAST(N'2026-03-29T18:28:41.390' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (33, 3, NULL, 12, CAST(N'2026-03-29T18:28:50.197' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (34, 3, NULL, 12, CAST(N'2026-03-29T18:28:58.850' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (35, 3, NULL, 12, CAST(N'2026-03-29T18:29:19.107' AS DateTime), CAST(6140000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (36, 3, NULL, 12, CAST(N'2026-03-29T18:33:49.880' AS DateTime), CAST(36840000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (37, 3, NULL, 12, CAST(N'2026-03-29T18:34:01.427' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (38, 3, NULL, 12, CAST(N'2026-03-29T18:40:18.987' AS DateTime), CAST(15350000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (39, 6, NULL, 6, CAST(N'2026-03-29T22:13:32.033' AS DateTime), CAST(170000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (40, 3, NULL, 12, CAST(N'2026-03-29T22:25:06.777' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (41, 3, NULL, 12, CAST(N'2026-03-29T22:26:08.260' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (42, 3, NULL, 12, CAST(N'2026-03-29T22:26:33.167' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (43, 3, NULL, 12, CAST(N'2026-03-29T22:27:10.920' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (44, 3, NULL, 12, CAST(N'2026-03-29T22:28:43.950' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (45, 3, NULL, 12, CAST(N'2026-03-29T22:29:09.220' AS DateTime), CAST(3070000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (46, 3, NULL, 12, CAST(N'2026-03-29T22:30:01.543' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (47, 3, NULL, 12, CAST(N'2026-03-29T22:30:26.423' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (48, 3, NULL, 12, CAST(N'2026-03-29T22:30:51.307' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (49, 3, NULL, 12, CAST(N'2026-03-29T22:31:16.250' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (50, 3, NULL, 12, CAST(N'2026-03-29T22:31:42.557' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (51, 3, NULL, 12, CAST(N'2026-03-29T22:32:07.897' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (52, 3, NULL, 12, CAST(N'2026-03-29T22:32:34.380' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (53, 3, NULL, 12, CAST(N'2026-03-29T22:32:59.800' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (54, 3, NULL, 12, CAST(N'2026-03-29T22:33:27.407' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (55, 3, NULL, 12, CAST(N'2026-03-29T22:44:17.253' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (56, 6, NULL, 6, CAST(N'2026-03-29T22:47:35.913' AS DateTime), CAST(170000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (57, 3, NULL, 12, CAST(N'2026-03-29T22:55:38.397' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (58, 3, NULL, 12, CAST(N'2026-03-29T22:55:58.747' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (59, 3, NULL, 12, CAST(N'2026-03-29T22:56:18.857' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (60, 3, NULL, 12, CAST(N'2026-03-29T22:57:05.210' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (61, 3, NULL, 12, CAST(N'2026-03-29T22:57:25.193' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (62, 3, NULL, 12, CAST(N'2026-03-29T22:57:52.020' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (63, 3, NULL, 12, CAST(N'2026-03-29T22:59:18.940' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (64, 3, NULL, 12, CAST(N'2026-03-29T22:59:40.020' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (65, 3, NULL, 12, CAST(N'2026-03-29T23:00:23.343' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (66, 3, NULL, 12, CAST(N'2026-03-29T23:00:44.520' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (67, 3, NULL, 12, CAST(N'2026-03-29T23:01:04.707' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (68, 3, NULL, 12, CAST(N'2026-03-29T23:01:25.737' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (69, 3, NULL, 12, CAST(N'2026-03-29T23:01:46.027' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (70, 3, NULL, 12, CAST(N'2026-03-29T23:02:06.933' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (71, 3, NULL, 12, CAST(N'2026-03-29T23:02:28.027' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (72, 3, NULL, 12, CAST(N'2026-03-29T23:02:48.473' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (73, 3, NULL, 12, CAST(N'2026-03-29T23:03:12.273' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (74, 3, NULL, 12, CAST(N'2026-03-29T23:13:41.900' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (75, 3, NULL, 12, CAST(N'2026-03-29T23:24:53.783' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (76, 3, NULL, 12, CAST(N'2026-03-29T23:25:15.150' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (77, 3, NULL, 12, CAST(N'2026-03-29T23:25:36.373' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (78, 3, NULL, 12, CAST(N'2026-03-29T23:26:17.477' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (79, 3, NULL, 12, CAST(N'2026-03-29T23:26:37.800' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (80, 3, NULL, 12, CAST(N'2026-03-29T23:27:05.227' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (81, 3, NULL, 12, CAST(N'2026-03-29T23:28:34.780' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 2)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (82, 3, NULL, 12, CAST(N'2026-03-29T23:29:01.750' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (83, 3, NULL, 12, CAST(N'2026-03-29T23:29:57.633' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (84, 3, NULL, 12, CAST(N'2026-03-29T23:30:19.087' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (85, 3, NULL, 12, CAST(N'2026-03-29T23:30:41.107' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (86, 3, NULL, 12, CAST(N'2026-03-29T23:31:03.233' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (87, 3, NULL, 12, CAST(N'2026-03-29T23:31:25.157' AS DateTime), CAST(1570000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (88, 3, NULL, 12, CAST(N'2026-03-29T23:31:45.753' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (89, 3, NULL, 12, CAST(N'2026-03-29T23:32:06.453' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (90, 3, NULL, 12, CAST(N'2026-03-29T23:32:28.097' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (91, 3, NULL, 12, CAST(N'2026-03-29T23:32:52.170' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 1)
INSERT [dbo].[DonHang] ([MaDH], [MaKH], [MaNV], [MaDC], [NgayDat], [TongTien], [MaTTDH], [MaPTTT]) VALUES (92, 3, NULL, 12, CAST(N'2026-03-29T23:45:01.250' AS DateTime), CAST(820000.00 AS Decimal(18, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[DonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] ON 

INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (1, 1, 7, 1, CAST(580000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (2, 2, 11, 1, CAST(1250000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (3, 3, 3, 2, CAST(175000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (4, 4, 5, 1, CAST(1990000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (5, 5, 21, 2, CAST(110000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (6, 6, 6, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (7, 7, 25, 2, CAST(225000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (8, 8, 30, 2, CAST(150000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (9, 9, 9, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (10, 10, 27, 1, CAST(270000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (11, 11, 37, 1, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (12, 11, 38, 1, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (13, 12, 37, 1, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (14, 12, 38, 1, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (15, 13, 37, 2, CAST(30000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (16, 13, 38, 1, CAST(25000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (17, 14, 37, 1, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (18, 14, 38, 1, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (19, 14, 39, 1, CAST(120000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (20, 15, 37, 1, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (21, 16, 37, 1, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (22, 17, 38, 1, CAST(50000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (23, 18, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (24, 18, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (25, 18, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (26, 19, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (27, 19, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (28, 19, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (29, 20, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (30, 20, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (31, 20, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (32, 21, 3, 5, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (33, 21, 4, 5, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (34, 21, 5, 5, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (35, 22, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (36, 22, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (37, 22, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (38, 23, 3, 5, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (39, 23, 4, 5, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (40, 23, 5, 5, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (41, 24, 3, 3, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (42, 24, 4, 3, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (43, 24, 5, 3, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (44, 25, 3, 4, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (45, 25, 4, 4, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (46, 25, 5, 4, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (47, 26, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (48, 26, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (49, 26, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (50, 27, 3, 4, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (51, 27, 4, 4, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (52, 27, 5, 4, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (53, 28, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (54, 28, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (55, 28, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (56, 29, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (57, 29, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (58, 29, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (59, 30, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (60, 30, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (61, 30, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (62, 31, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (63, 31, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (64, 31, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (65, 32, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (66, 32, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (67, 32, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (68, 33, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (69, 33, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (70, 33, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (71, 34, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (72, 34, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (73, 34, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (74, 35, 3, 2, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (75, 35, 4, 2, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (76, 35, 5, 2, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (77, 36, 3, 12, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (78, 36, 4, 12, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (79, 36, 5, 12, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (80, 37, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (81, 37, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (82, 37, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (83, 38, 3, 5, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (84, 38, 4, 5, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (85, 38, 5, 5, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (86, 39, 37, 2, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (87, 40, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (88, 40, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (89, 40, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (90, 41, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (91, 41, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (92, 41, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (93, 42, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (94, 42, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (95, 42, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (96, 43, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (97, 43, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (98, 43, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (99, 44, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (100, 44, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (101, 44, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (102, 45, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (103, 45, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (104, 45, 5, 1, CAST(1500000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (105, 46, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (106, 46, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (107, 47, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (108, 47, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (109, 48, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (110, 48, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (111, 49, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (112, 49, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (113, 50, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (114, 50, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (115, 51, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (116, 51, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (117, 52, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (118, 52, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (119, 53, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (120, 53, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (121, 54, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (122, 54, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (123, 55, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (124, 55, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (125, 56, 37, 2, CAST(70000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (126, 57, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (127, 57, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (128, 58, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (129, 58, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (130, 59, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (131, 59, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (132, 60, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (133, 60, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (134, 61, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (135, 61, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (136, 62, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (137, 62, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (138, 63, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (139, 63, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (140, 64, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (141, 64, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (142, 65, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (143, 65, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (144, 66, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (145, 66, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (146, 67, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (147, 67, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (148, 68, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (149, 68, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (150, 69, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (151, 69, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (152, 70, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (153, 70, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (154, 71, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (155, 71, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (156, 72, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (157, 72, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (158, 73, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (159, 73, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (160, 74, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (161, 74, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (162, 75, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (163, 75, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (164, 76, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (165, 76, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (166, 77, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (167, 77, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (168, 78, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (169, 78, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (170, 79, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (171, 79, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (172, 80, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (173, 80, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (174, 81, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (175, 81, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (176, 82, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (177, 82, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (178, 83, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (179, 83, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (180, 84, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (181, 84, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (182, 85, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (183, 85, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (184, 86, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (185, 86, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (186, 87, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (187, 87, 4, 1, CAST(750000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (188, 88, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (189, 89, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (190, 90, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (191, 91, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
INSERT [dbo].[DonHangChiTiet] ([MaDHCT], [MaDH], [MaSP], [SoLuong], [DonGia]) VALUES (192, 92, 3, 1, CAST(820000.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] OFF
GO
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (1, 37, 1)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (4, 37, 1)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (4, 38, 1)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (6, 37, 0)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (11, 37, 2)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (12, 37, 1)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (12, 38, 1)
INSERT [dbo].[GioHang] ([MaTK], [MaSP], [SoLuong]) VALUES (13, 37, 2)
GO
SET IDENTITY_INSERT [dbo].[LoaiSanPham] ON 

INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (3, N'Bánh Khô')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (2, N'Bánh Mặn')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (4, N'Bánh Mì')
INSERT [dbo].[LoaiSanPham] ([MaLoai], [TenLoai]) VALUES (1, N'Bánh Ngọt')
SET IDENTITY_INSERT [dbo].[LoaiSanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[NhapKho] ON 

INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (3, 3, 60, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (4, 4, 50, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (5, 5, 30, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (6, 6, 180, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (7, 7, 130, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (8, 8, 140, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (9, 9, 45, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (11, 11, 35, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (21, 21, 240, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (22, 22, 260, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (23, 23, 180, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (25, 25, 100, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (27, 27, 240, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (30, 30, 180, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (33, 33, 900, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (34, 34, 400, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (37, 37, 300, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (38, 38, 150, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (39, 39, 120, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (40, 40, 250, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (41, 41, 220, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (42, 42, 300, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (43, 43, 120, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (44, 44, 260, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (45, 45, 220, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (46, 46, 120, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (47, 47, 800, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[NhapKho] ([MaNK], [MaSP], [SoLuong], [NgayNhap]) VALUES (48, 48, 700, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[NhapKho] OFF
GO
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] ON 

INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [TenPTTT]) VALUES (2, N'Chuyển khoản ngân hàng')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [TenPTTT]) VALUES (1, N'COD - Thanh toán khi nhận hàng')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [TenPTTT]) VALUES (3, N'Ví điện tử Momo')
INSERT [dbo].[PhuongThucThanhToan] ([MaPTTT], [TenPTTT]) VALUES (4, N'Ví ZaloPay')
SET IDENTITY_INSERT [dbo].[PhuongThucThanhToan] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (3, N'Bánh kem handmade phủ hạt', N'Bánh handmade phủ hạt dinh dưỡng, giòn thơm', CAST(820000.00 AS Decimal(18, 2)), 13, N'1774427057924_1773771036027_B4.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (4, N'Bánh mousse vani mini', N'Bánh mousse mềm mịn, tan ngay trong miệng', CAST(750000.00 AS Decimal(18, 2)), 0, N'1774427489230_1773888543124_B9.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (5, N'Bánh kem socola cổ điển', N'Bánh socola đậm vị, dành cho người thích ngọt', CAST(1500000.00 AS Decimal(18, 2)), 0, N'1774427511494_1773771072754_B24.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (6, N'Bánh kem trang trí hoa', N'Bánh kem tạo hình hoa tinh tế, thích hợp làm quà', CAST(480000.00 AS Decimal(18, 2)), 359, N'1774427564114_1773770923666_B34.png', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (7, N'Bánh kem nhiều tầng mini', N'Bánh nhiều tầng mini, đẹp mắt cho sự kiện nhỏ', CAST(580000.00 AS Decimal(18, 2)), 259, N'1774427523215_1773771028358_B3.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (8, N'Bánh kem in hình theo yêu cầu', N'Bánh in hình theo yêu cầu, cá nhân hóa độc đáo', CAST(490000.00 AS Decimal(18, 2)), 280, N'1774427543702_1773771036027_B4.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (9, N'Bánh quy bơ tổng hợp', N'Bánh quy bơ giòn tan, nhiều hương vị hấp dẫn', CAST(990000.00 AS Decimal(18, 2)), 89, N'1774427588567_1773771080443_B12.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (11, N'Bánh kem tiramisu cao cấp', N'Bánh tiramisu mềm mịn, vị cà phê nhẹ, sang trọng', CAST(1250000.00 AS Decimal(18, 2)), 69, N'1774427618980_1773771062789_B9.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (21, N'Bánh kem phô mai nướng (cheesecake)', N'Bánh cheesecake béo mịn, tan trong miệng', CAST(3500000.00 AS Decimal(18, 2)), 246, N'1774427964984_1773771036027_B4.jpg', 2, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (22, N'Bánh kem mini trang trí đơn giản', N'Bánh mini nhỏ gọn, phù hợp tiệc nhẹ', CAST(180000.00 AS Decimal(18, 2)), 560, N'1774427975037_1773770881940_B3.jpg', 2, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (23, N'Bánh kem trà sữa trân châu', N'Bánh kem trà sữa độc đáo, topping trân châu', CAST(860000.00 AS Decimal(18, 2)), 275, N'1774428014325_1773770954587_B36.jpg', 2, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (25, N'Bánh kem chuối socola', N'Bánh chuối kết hợp socola ngọt dịu', CAST(150000.00 AS Decimal(18, 2)), 498, N'1774428025275_1773771080443_B12.jpg', 3, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (27, N'Bánh kem hạt sen thanh nhẹ', N'Bánh hạt sen thanh nhẹ, tốt cho sức khỏe', CAST(180000.00 AS Decimal(18, 2)), 479, N'1774428037929_1773771080443_B12.jpg', 3, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (30, N'Bánh tiramisu', N'Bánh tiramisu Ý chuẩn vị, lớp mascarpone mịn thơm béo', CAST(65000.00 AS Decimal(18, 2)), 150, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (33, N'Bánh cheese cake Nhật', N'Cheesecake mềm kiểu Nhật, tan trong miệng, vị béo nhẹ', CAST(80000.00 AS Decimal(18, 2)), 110, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (34, N'Bánh xíu mại chiên', N'Xíu mại nhân thịt heo băm, chiên giòn, chấm tương ớt', CAST(40000.00 AS Decimal(18, 2)), 250, N'https://gomsulongloan.vn/wp-content/uploads/2023/12/y-nghia-cua-khay-mut-ngay-tet-trong-van-hoa-co-truyen-1.jpg', 2, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (37, N'Bánh quiche lorraine', N'Quiche Pháp nhân kem trứng, thịt xông khói, phô mai', CAST(70000.00 AS Decimal(18, 2)), 93, N'1773770881940_B3.jpg', 2, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (38, N'Bánh empanada nhân thịt bò', N'Bánh bột mì nhân thịt bò xào rau củ, nướng vàng đậm đà', CAST(50000.00 AS Decimal(18, 2)), 158, N'1773770954587_B36.jpg', 2, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (39, N'Bánh quy bơ hộp thiếc', N'Bánh quy bơ Đan Mạch, giòn thơm, đóng hộp thiếc sang trọng', CAST(120000.00 AS Decimal(18, 2)), 199, N'1773770918040_B35.jpg', 3, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (40, N'Bánh biscotti hạt hạnh nhân', N'Biscotti Ý nướng giòn, hạt hạnh nhân thơm, ăn cùng cà phê', CAST(95000.00 AS Decimal(18, 2)), 180, N'1773770923666_B34.png', 3, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (41, N'Bánh macaron hộp 6 cái', N'Macaron Pháp đủ màu sắc, vỏ giòn nhân kem mềm thơm', CAST(110000.00 AS Decimal(18, 2)), 150, N'1773770947030_B33.jpg', 3, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (42, N'Bánh brownie hạt óc chó', N'Brownie đậm vị socola, hạt óc chó giòn tan, không quá ngọt', CAST(55000.00 AS Decimal(18, 2)), 220, N'1773770969063_B32.jpg', 3, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (43, N'Bánh quy socola chip', N'Bánh quy mềm vừa, hạt socola chip tan chảy thơm ngon', CAST(75000.00 AS Decimal(18, 2)), 300, N'1773770996535_B29.jpg', 3, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (44, N'Bánh mì bơ tỏi phô mai', N'Bánh mì giòn vỏ, bơ tỏi thơm lừng, rắc phô mai parmesan', CAST(35000.00 AS Decimal(18, 2)), 300, N'1773771012849_B3.jpg', 4, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (45, N'Bánh mì sandwich thịt nguội', N'Bánh mì sandwich nhân thịt nguội, phô mai, rau tươi giòn', CAST(45000.00 AS Decimal(18, 2)), 200, N'1773771036027_B4.jpg', 4, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (46, N'Bánh mì pate chả', N'Bánh mì Việt Nam truyền thống, pate thơm, chả lụa tươi ngon', CAST(30000.00 AS Decimal(18, 2)), 350, N'1773771052668_B6.jpg', 4, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (47, N'Bánh croissant bơ', N'Croissant Pháp nhiều lớp bơ, vỏ giòn rụm, thơm béo', CAST(45000.00 AS Decimal(18, 2)), 220, N'1773771062789_B9.jpg', 4, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MoTa], [Gia], [SoLuong], [HinhAnh], [MaLoai], [NgayTao]) VALUES (48, N'Bánh mì focaccia', N'Focaccia Ý mềm xốp, rắc ô liu, rosemary và muối biển hồng', CAST(65000.00 AS Decimal(18, 2)), 130, N'1773771080443_B12.jpg', 4, CAST(N'2026-03-16T23:44:36.290' AS DateTime))
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiKhoan] ON 

INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (1, N'Nguyễn Văn Admin', N'admin@webtet.com', N'$2a$10$7m8QsrnJqCClmcxlD.zMP.KY7siTnzfR0GIu.f3JhDhFtX1i91vPS', N'0909000001', 3, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (2, N'Lê Thị Nhân Viên', N'staff@webtet.com', N'$2a$10$us0gBMlpOFTwRTNgaaGVIOKttK9D5xukY8nQMN.NnaTFYomThI0tS', N'0909000002', 2, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (3, N'TestCSRF', N'cust1@webtet.com', N'$2a$10$HIX5b.2tdVDDSIEe6cYb/.51q4NWleA7u79Ho52CHUR8BVqWlKvs2', N'0909000001', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (4, N'Phạm Thị Hoa', N'cust2@webtet.com', N'$2a$10$WKc6isGCo6jE9Q5e4LoH6.preKxDBZASkEJTz0Q/w5bjMc.jnCHIW', N'0909000004', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (5, N'Nguyễn Văn C', N'cust3@webtet.com', N'$2a$10$bhKW0vQ/kA4rCwwN0P.OpOuecHM/j0uUfbEiRfsszjxwXfgOMxRxi', N'0909999999', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (6, N'Ngô Thị C', N'cust4@webtet.com', N'$2a$10$ML6fwGKCCKmQpKwlfHaFROgIp.WYLQ2vW.oB2YDP79Mb6pwTbLK3C', N'0909000006', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (7, N'Lý Văn D', N'cust5@webtet.com', N'$2a$10$EhihcZrAO0U08uLQQ.Wf.uZ9WJ164DvXUdvYQtGHkJzqRq/mohPPa', N'0909000007', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (8, N'Mai Thị E', N'cust6@webtet.com', N'cust123', N'0909000008', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (9, N'Vũ Văn F', N'cust7@webtet.com', N'cust123', N'0909000009', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (10, N'Bùi Thị G', N'cust8@webtet.com', N'cust123', N'0909000010', 1, 1, CAST(N'2026-03-16T23:44:36.287' AS DateTime))
INSERT [dbo].[TaiKhoan] ([MaTK], [HoTen], [Email], [MatKhau], [SoDienThoai], [MaVT], [TrangThai], [NgayTao]) VALUES (115, N'Trần Thị B', N'user21774797806109@gmail.com', N'$2a$10$Lt6U4xDY/5.8oOnCZGrvwuUjbEz2n4yVkxIyEIVXdUxLjNnRMjfbe', N'', 1, 1, CAST(N'2026-03-29T22:23:27.613' AS DateTime))
SET IDENTITY_INSERT [dbo].[TaiKhoan] OFF
GO
SET IDENTITY_INSERT [dbo].[ThongKe] ON 

INSERT [dbo].[ThongKe] ([MaThongKe], [NgayBaoCao], [TongDoanhThu], [TongDonHang], [TongSanPhamBanRa]) VALUES (1, CAST(N'2025-01-01' AS Date), CAST(12500000.00 AS Decimal(18, 2)), 32, 85)
INSERT [dbo].[ThongKe] ([MaThongKe], [NgayBaoCao], [TongDoanhThu], [TongDonHang], [TongSanPhamBanRa]) VALUES (2, CAST(N'2025-01-02' AS Date), CAST(8200000.00 AS Decimal(18, 2)), 20, 54)
SET IDENTITY_INSERT [dbo].[ThongKe] OFF
GO
SET IDENTITY_INSERT [dbo].[TrangThaiDonHang] ON 

INSERT [dbo].[TrangThaiDonHang] ([MaTTDH], [TenTTDH]) VALUES (1, N'Chờ xác nhận')
INSERT [dbo].[TrangThaiDonHang] ([MaTTDH], [TenTTDH]) VALUES (2, N'Đang giao')
INSERT [dbo].[TrangThaiDonHang] ([MaTTDH], [TenTTDH]) VALUES (3, N'Hoàn tất')
INSERT [dbo].[TrangThaiDonHang] ([MaTTDH], [TenTTDH]) VALUES (4, N'Đã hủy')
SET IDENTITY_INSERT [dbo].[TrangThaiDonHang] OFF
GO
SET IDENTITY_INSERT [dbo].[VaiTro] ON 

INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (3, N'Admin')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (1, N'Khách hàng')
INSERT [dbo].[VaiTro] ([MaVT], [TenVT]) VALUES (2, N'Nhân viên')
SET IDENTITY_INSERT [dbo].[VaiTro] OFF
GO
/****** Object:  Index [UQ_DanhGia]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[DanhGia] ADD  CONSTRAINT [UQ_DanhGia] UNIQUE NONCLUSTERED 
(
	[MaKH] ASC,
	[MaSP] ASC,
	[MaDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__LoaiSanP__E29B1042EFCBA6FF]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[LoaiSanPham] ADD UNIQUE NONCLUSTERED 
(
	[TenLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__PhuongTh__FD193B4FAFBA3C29]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[PhuongThucThanhToan] ADD UNIQUE NONCLUSTERED 
(
	[TenPTTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IDX_SanPham_MaLoai]    Script Date: 3/30/2026 8:59:44 PM ******/
CREATE NONCLUSTERED INDEX [IDX_SanPham_MaLoai] ON [dbo].[SanPham]
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_SanPham_TenSP]    Script Date: 3/30/2026 8:59:44 PM ******/
CREATE NONCLUSTERED INDEX [IDX_SanPham_TenSP] ON [dbo].[SanPham]
(
	[TenSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__TaiKhoan__A9D105346B827E23]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[TaiKhoan] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UQ__ThongKe__F82394FF1666BFCE]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[ThongKe] ADD UNIQUE NONCLUSTERED 
(
	[NgayBaoCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__VaiTro__4CF9F7BCF7487ACA]    Script Date: 3/30/2026 8:59:44 PM ******/
ALTER TABLE [dbo].[VaiTro] ADD UNIQUE NONCLUSTERED 
(
	[TenVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT (getdate()) FOR [NgayDang]
GO
ALTER TABLE [dbo].[BaiViet] ADD  DEFAULT (N'Hiển thị') FOR [TrangThai]
GO
ALTER TABLE [dbo].[DanhGia] ADD  DEFAULT (getdate()) FOR [NgayDG]
GO
ALTER TABLE [dbo].[DiaChi] ADD  DEFAULT ((0)) FOR [MacDinh]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT (getdate()) FOR [NgayDat]
GO
ALTER TABLE [dbo].[DonHang] ADD  DEFAULT ((1)) FOR [MaTTDH]
GO
ALTER TABLE [dbo].[NhapKho] ADD  DEFAULT (getdate()) FOR [NgayNhap]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[SanPham] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[TaiKhoan] ADD  DEFAULT (getdate()) FOR [NgayTao]
GO
ALTER TABLE [dbo].[BaiViet]  WITH CHECK ADD  CONSTRAINT [FK_BaiViet_TaiKhoan] FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[BaiViet] CHECK CONSTRAINT [FK_BaiViet_TaiKhoan]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_DonHang] FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_DonHang]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_KhachHang]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_SanPham]
GO
ALTER TABLE [dbo].[DiaChi]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaDC])
REFERENCES [dbo].[DiaChi] ([MaDC])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKH])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaNV])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaPTTT])
REFERENCES [dbo].[PhuongThucThanhToan] ([MaPTTT])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaTTDH])
REFERENCES [dbo].[TrangThaiDonHang] ([MaTTDH])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaDH])
REFERENCES [dbo].[DonHang] ([MaDH])
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD FOREIGN KEY([MaTK])
REFERENCES [dbo].[TaiKhoan] ([MaTK])
GO
ALTER TABLE [dbo].[NhapKho]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaLoai])
REFERENCES [dbo].[LoaiSanPham] ([MaLoai])
GO
ALTER TABLE [dbo].[TaiKhoan]  WITH CHECK ADD FOREIGN KEY([MaVT])
REFERENCES [dbo].[VaiTro] ([MaVT])
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD CHECK  (([SoSao]>=(1) AND [SoSao]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [Webcake2] SET  READ_WRITE 
GO
