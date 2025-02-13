USE [master]
GO
/****** Object:  Database [QLNHIEMVU]    Script Date: 8/6/2024 8:51:21 PM ******/
CREATE DATABASE [QLNHIEMVU]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLNHIEMVU', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\QLNHIEMVU.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLNHIEMVU_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLSERVER\MSSQL\DATA\QLNHIEMVU_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QLNHIEMVU] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLNHIEMVU].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLNHIEMVU] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLNHIEMVU] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLNHIEMVU] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLNHIEMVU] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLNHIEMVU] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET RECOVERY FULL 
GO
ALTER DATABASE [QLNHIEMVU] SET  MULTI_USER 
GO
ALTER DATABASE [QLNHIEMVU] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLNHIEMVU] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLNHIEMVU] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLNHIEMVU] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLNHIEMVU] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QLNHIEMVU] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLNHIEMVU', N'ON'
GO
ALTER DATABASE [QLNHIEMVU] SET QUERY_STORE = ON
GO
ALTER DATABASE [QLNHIEMVU] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QLNHIEMVU]
GO
/****** Object:  UserDefinedFunction [dbo].[MaHoaMk]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[MaHoaMk] (@mk nvarchar(50)) returns varchar(32)
as begin
	declare @mh varchar(32) -- mk da ma hoa
	set @mh = CONVERT(varchar(32),HASHBYTES('MD5',@mk), 2)
	return @mh
end


--Quản lý quy trình thực hiện nhiệm vụ
GO
/****** Object:  Table [dbo].[BuocQuyTrinh]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuocQuyTrinh](
	[IdBQT] [int] IDENTITY(1,1) NOT NULL,
	[IdQTNV] [int] NOT NULL,
	[NoiDung] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdBQT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeLog]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeLog](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](500) NULL,
	[IdNV] [int] NULL,
	[IdPB] [int] NULL,
	[IdNVien] [nvarchar](50) NULL,
	[NgayTao] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[IdNVien] [nvarchar](50) NOT NULL,
	[MatKhau] [varchar](100) NULL,
	[PhongBan] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNVien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhiemVu]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhiemVu](
	[IdNV] [int] IDENTITY(1,1) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[NgayBatDauNV] [date] NOT NULL,
	[NgayKetThucNV] [date] NULL,
	[NoiDungNV] [nvarchar](1000) NOT NULL,
	[TinhTrangNV] [int] NULL,
	[PhongBan] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCongNhiemVu]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCongNhiemVu](
	[IdPCNV] [int] IDENTITY(1,1) NOT NULL,
	[IdNV] [int] NOT NULL,
	[IdNVien] [nvarchar](50) NOT NULL,
	[TinhTrang] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPCNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[IdPQ] [int] IDENTITY(1,1) NOT NULL,
	[IdNVien] [nvarchar](50) NULL,
	[IdQ] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[IdPB] [int] IDENTITY(1,1) NOT NULL,
	[TenPB] [nvarchar](50) NOT NULL,
	[IdTruongPhong] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quyen]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quyen](
	[IdQ] [int] IDENTITY(1,1) NOT NULL,
	[TenQ] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuyTrinhNhiemVu]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuyTrinhNhiemVu](
	[IdQTNV] [int] IDENTITY(1,1) NOT NULL,
	[TenQTNV] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdQTNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiLieu]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiLieu](
	[IdTL] [int] IDENTITY(1,1) NOT NULL,
	[IdBQT] [int] NOT NULL,
	[Link] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TaiLieuNV]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiLieuNV](
	[IdTLNV] [int] IDENTITY(1,1) NOT NULL,
	[IdNV] [int] NOT NULL,
	[TenTL] [nvarchar](50) NULL,
	[Link] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTLNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinhTrang]    Script Date: 8/6/2024 8:51:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrang](
	[IdTT] [int] IDENTITY(1,1) NOT NULL,
	[LoaiTT] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChangeLog] ON 

INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (1, N'Có nhiệm vụ mới: abc', NULL, NULL, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (2, N'Có nhiệm vụ mới: abc', NULL, NULL, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (3, N'Có nhiệm vụ mới: abc', NULL, NULL, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (4, N'Có nhiệm vụ mới: abc', 30, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (5, N'Có nhiệm vụ mới: abc', 31, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (6, N'Có nhiệm vụ mới: 111', 32, 3, N'minhtan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (7, N'Có nhiệm vụ mới: ádasadasda', 33, 3, N'minhtan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (8, N'Có nhiệm vụ mới: ádsadadasadadad', 34, 3, N'minhtan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (9, N'Có nhiệm vụ mới: ádasadasda', 35, 1, N'admin', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (10, N'Có nhiệm vụ mới: a', 36, 1, N'admin', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (11, N'Có nhiệm vụ mới: 111', 37, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (12, N'Có nhiệm vụ mới: 111', 38, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (13, N'Có nhiệm vụ mới: 111', 39, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (14, N'Có nhiệm vụ mới: a', 40, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (15, N'Có nhiệm vụ mới: a', 41, 2, N'minhtuan', CAST(N'2024-07-27' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (16, N'Có nhiệm vụ mới: ádsadadasadadad', 42, 2, N'minhtuan', CAST(N'2024-07-28' AS Date))
INSERT [dbo].[ChangeLog] ([IdLog], [NoiDung], [IdNV], [IdPB], [IdNVien], [NgayTao]) VALUES (17, N'Có nhiệm vụ mới: aaa', 43, 2, N'minhtuan', CAST(N'2024-08-01' AS Date))
SET IDENTITY_INSERT [dbo].[ChangeLog] OFF
GO
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'123', N'06D49632C9DC9BCB62AEAEF99612BA6B', 2)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'a', N'E9470CB03F533BC87C7AE7C86967FC55', 1)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'ab', N'CE0BFD15059B68D67688884D7A3D3E8C', 8)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'admin', N'7066A40F427769CC43347AA96B72931A', 1)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'b', N'7084A7C180C44B54C494370612CDC151', 2)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'c', N'D4E8E61F3BB30E106D5ED53A0246CE83', 3)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'minhtan', N'F88DE1D28205F4BBDA19981E3F0EF166', 3)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'minhtuan', N'09E31D1AB4DE57A06DAC4834A7CB1432', 2)
INSERT [dbo].[NhanVien] ([IdNVien], [MatKhau], [PhongBan]) VALUES (N'qwe', N'06D49632C9DC9BCB62AEAEF99612BA6B', 2)
GO
SET IDENTITY_INSERT [dbo].[NhiemVu] ON 

INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (3, N'ádasdasdasa', CAST(N'2024-01-01' AS Date), CAST(N'2024-02-02' AS Date), N'ádadadsadasdas', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (10, N'a', CAST(N'2024-07-26' AS Date), CAST(N'2024-08-08' AS Date), N'a', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (12, N'123', CAST(N'2024-07-26' AS Date), CAST(N'2024-07-26' AS Date), N'a', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (13, N'123', CAST(N'2024-07-26' AS Date), CAST(N'2024-07-26' AS Date), N'a', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (14, N'ádsadadasadadad', CAST(N'2024-08-01' AS Date), CAST(N'2024-08-08' AS Date), N'sadsadas', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (15, N'a', CAST(N'2024-08-02' AS Date), CAST(N'2024-07-24' AS Date), N'ádsadd', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (16, N'ádsadadasadadad', CAST(N'2024-07-24' AS Date), CAST(N'2024-07-31' AS Date), N'áda', 1, 3)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (17, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (18, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (19, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (20, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (21, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (22, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (23, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (24, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (25, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (26, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (27, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (28, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (29, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (30, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (31, N'abc', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (32, N'111', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 3)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (33, N'ádasadasda', CAST(N'2024-07-17' AS Date), CAST(N'2024-07-25' AS Date), N'ádasdsa', 1, 3)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (34, N'ádsadadasadadad', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'ádasd', 1, 3)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (35, N'ádasadasda', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'ádasdas', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (36, N'a', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 1)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (37, N'111', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (38, N'111', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (39, N'111', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'a', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (40, N'a', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'aa', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (41, N'a', CAST(N'2024-07-27' AS Date), CAST(N'2024-07-27' AS Date), N'aa', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (42, N'ádsadadasadadad', CAST(N'2024-07-28' AS Date), CAST(N'2024-07-28' AS Date), N'sadsasadas', 1, 2)
INSERT [dbo].[NhiemVu] ([IdNV], [TenNV], [NgayBatDauNV], [NgayKetThucNV], [NoiDungNV], [TinhTrangNV], [PhongBan]) VALUES (43, N'aaa', CAST(N'2024-08-01' AS Date), CAST(N'2024-08-01' AS Date), N'sadadsa', 1, 2)
SET IDENTITY_INSERT [dbo].[NhiemVu] OFF
GO
SET IDENTITY_INSERT [dbo].[PhongBan] ON 

INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (1, N'Ban Giám Đốc', N'admin')
INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (2, N'Phòng hành chính', N'minhtuan')
INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (3, N'Phòng nhân sự', N'minhtan')
INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (6, N'a', NULL)
INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (7, N'a', NULL)
INSERT [dbo].[PhongBan] ([IdPB], [TenPB], [IdTruongPhong]) VALUES (8, N'b', NULL)
SET IDENTITY_INSERT [dbo].[PhongBan] OFF
GO
SET IDENTITY_INSERT [dbo].[TaiLieuNV] ON 

INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (1, 13, N'NhÃ³m 2_QLDA CNTT_CQ.05_Hk2 23-24.docx', N'C:\2\c#\QLNHIEMVU\public\uploads\1721994485285-NhÃ³m 2_QLDA CNTT_CQ.05_Hk2 23-24.docx')
INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (2, 14, N'Chuong 04 _Stored procedure Function.pdf', N'C:\2\c#\QLNHIEMVU\public\uploads\1721994537510-Chuong 04 _Stored procedure Function.pdf')
INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (3, 14, N'ChuongTrinhDaoTao.xlsx', N'C:\2\c#\QLNHIEMVU\public\uploads\1721994537535-ChuongTrinhDaoTao.xlsx')
INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (4, 14, N'Chuong 05 _Trigger  Transaction.pdf', N'C:\2\c#\QLNHIEMVU\public\uploads\1721994537535-Chuong 05 _Trigger  Transaction.pdf')
INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (5, 14, N'Chuong 06 - Bao mat Phan Quyen.pdf', N'C:\2\c#\QLNHIEMVU\public\uploads\1721994537549-Chuong 06 - Bao mat Phan Quyen.pdf')
INSERT [dbo].[TaiLieuNV] ([IdTLNV], [IdNV], [TenTL], [Link]) VALUES (6, 15, N'Chuong 04 _Stored procedure Function.pdf', N'C:\2\c#\QLNHIEMVU\public\uploads\1722045034967-Chuong 04 _Stored procedure Function.pdf')
SET IDENTITY_INSERT [dbo].[TaiLieuNV] OFF
GO
SET IDENTITY_INSERT [dbo].[TinhTrang] ON 

INSERT [dbo].[TinhTrang] ([IdTT], [LoaiTT]) VALUES (1, N'Chờ')
INSERT [dbo].[TinhTrang] ([IdTT], [LoaiTT]) VALUES (2, N'Đang xử lý')
INSERT [dbo].[TinhTrang] ([IdTT], [LoaiTT]) VALUES (3, N'Hoàn thành')
INSERT [dbo].[TinhTrang] ([IdTT], [LoaiTT]) VALUES (4, N'Phê duyệt')
INSERT [dbo].[TinhTrang] ([IdTT], [LoaiTT]) VALUES (5, N'Lưu trữ')
SET IDENTITY_INSERT [dbo].[TinhTrang] OFF
GO
ALTER TABLE [dbo].[NhiemVu] ADD  DEFAULT ((1)) FOR [TinhTrangNV]
GO
ALTER TABLE [dbo].[PhanCongNhiemVu] ADD  DEFAULT ((2)) FOR [TinhTrang]
GO
ALTER TABLE [dbo].[BuocQuyTrinh]  WITH CHECK ADD  CONSTRAINT [fk_BQT_Id_QTNV] FOREIGN KEY([IdQTNV])
REFERENCES [dbo].[QuyTrinhNhiemVu] ([IdQTNV])
GO
ALTER TABLE [dbo].[BuocQuyTrinh] CHECK CONSTRAINT [fk_BQT_Id_QTNV]
GO
ALTER TABLE [dbo].[ChangeLog]  WITH CHECK ADD  CONSTRAINT [fk_Log_Id_NV] FOREIGN KEY([IdNV])
REFERENCES [dbo].[NhiemVu] ([IdNV])
GO
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [fk_Log_Id_NV]
GO
ALTER TABLE [dbo].[ChangeLog]  WITH CHECK ADD  CONSTRAINT [fk_Log_Id_NVien] FOREIGN KEY([IdNVien])
REFERENCES [dbo].[NhanVien] ([IdNVien])
GO
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [fk_Log_Id_NVien]
GO
ALTER TABLE [dbo].[ChangeLog]  WITH CHECK ADD  CONSTRAINT [fk_Log_Id_PB] FOREIGN KEY([IdPB])
REFERENCES [dbo].[PhongBan] ([IdPB])
GO
ALTER TABLE [dbo].[ChangeLog] CHECK CONSTRAINT [fk_Log_Id_PB]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [fk_NVien_Id_PB] FOREIGN KEY([PhongBan])
REFERENCES [dbo].[PhongBan] ([IdPB])
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [fk_NVien_Id_PB]
GO
ALTER TABLE [dbo].[NhiemVu]  WITH CHECK ADD  CONSTRAINT [fk_NV_Id_PB] FOREIGN KEY([PhongBan])
REFERENCES [dbo].[PhongBan] ([IdPB])
GO
ALTER TABLE [dbo].[NhiemVu] CHECK CONSTRAINT [fk_NV_Id_PB]
GO
ALTER TABLE [dbo].[NhiemVu]  WITH CHECK ADD  CONSTRAINT [fk_NV_Id_TT] FOREIGN KEY([TinhTrangNV])
REFERENCES [dbo].[TinhTrang] ([IdTT])
GO
ALTER TABLE [dbo].[NhiemVu] CHECK CONSTRAINT [fk_NV_Id_TT]
GO
ALTER TABLE [dbo].[PhanCongNhiemVu]  WITH CHECK ADD  CONSTRAINT [fk_PCNV_Id_NV] FOREIGN KEY([IdNV])
REFERENCES [dbo].[NhiemVu] ([IdNV])
GO
ALTER TABLE [dbo].[PhanCongNhiemVu] CHECK CONSTRAINT [fk_PCNV_Id_NV]
GO
ALTER TABLE [dbo].[PhanCongNhiemVu]  WITH CHECK ADD  CONSTRAINT [fk_PCNV_Id_NVien] FOREIGN KEY([IdNVien])
REFERENCES [dbo].[NhanVien] ([IdNVien])
GO
ALTER TABLE [dbo].[PhanCongNhiemVu] CHECK CONSTRAINT [fk_PCNV_Id_NVien]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [fk_PQ_Id_NVien] FOREIGN KEY([IdNVien])
REFERENCES [dbo].[NhanVien] ([IdNVien])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [fk_PQ_Id_NVien]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [fk_PQ_Id_Q] FOREIGN KEY([IdQ])
REFERENCES [dbo].[Quyen] ([IdQ])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [fk_PQ_Id_Q]
GO
ALTER TABLE [dbo].[PhongBan]  WITH CHECK ADD  CONSTRAINT [fk_PB_IdTruongPhong_NVien] FOREIGN KEY([IdTruongPhong])
REFERENCES [dbo].[NhanVien] ([IdNVien])
GO
ALTER TABLE [dbo].[PhongBan] CHECK CONSTRAINT [fk_PB_IdTruongPhong_NVien]
GO
ALTER TABLE [dbo].[TaiLieu]  WITH CHECK ADD  CONSTRAINT [fk_TaiLieu_Id_BQT] FOREIGN KEY([IdBQT])
REFERENCES [dbo].[BuocQuyTrinh] ([IdBQT])
GO
ALTER TABLE [dbo].[TaiLieu] CHECK CONSTRAINT [fk_TaiLieu_Id_BQT]
GO
ALTER TABLE [dbo].[TaiLieuNV]  WITH CHECK ADD  CONSTRAINT [fk_NV_IdNV_TLNV] FOREIGN KEY([IdNV])
REFERENCES [dbo].[NhiemVu] ([IdNV])
GO
ALTER TABLE [dbo].[TaiLieuNV] CHECK CONSTRAINT [fk_NV_IdNV_TLNV]
GO
USE [master]
GO
ALTER DATABASE [QLNHIEMVU] SET  READ_WRITE 
GO
