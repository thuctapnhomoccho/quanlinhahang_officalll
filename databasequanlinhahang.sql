/****** Object:  Table [dbo].[loai_mon_an]    Script Date: 2/18/2019 11:38:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loai_mon_an](
	[id_loaimonan] [int] NOT NULL,
	[name_loaimonan] [nvarchar](50) NULL,
 CONSTRAINT [PK_loai_mon_an] PRIMARY KEY CLUSTERED 
(
	[id_loaimonan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[monan]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[monan](
	[id_monan] [int] IDENTITY(1,1) NOT NULL,
	[name_monan] [nvarchar](50) NULL,
	[gia_monan] [int] NULL,
	[thanh_phan] [nvarchar](50) NULL,
	[id_loaimonan] [int] NULL,
 CONSTRAINT [PK_monan] PRIMARY KEY CLUSTERED 
(
	[id_monan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[hienthimonan]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[hienthimonan] as
select monan.name_monan,monan.gia_monan,loai_mon_an.name_loaimonan from monan , loai_mon_an where monan.id_loaimonan= loai_mon_an.id_loaimonan;
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[id_account] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [varchar](50) NULL,
	[password] [varchar](50) NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[id_account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ban_an]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban_an](
	[id_banan] [int] NOT NULL,
	[ten_banan] [nvarchar](50) NULL,
	[chatlieu] [nvarchar](50) NULL,
	[tinhtrang] [nvarchar](50) NULL,
	[hieu] [nchar](10) NULL,
 CONSTRAINT [PK_ban_an] PRIMARY KEY CLUSTERED 
(
	[id_banan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiet_datban]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiet_datban](
	[id_banan] [int] NOT NULL,
	[id_hoadon] [int] NOT NULL,
	[ngaydatban] [date] NULL,
	[giodatban] [time](6) NULL,
 CONSTRAINT [PK_Table_2] PRIMARY KEY CLUSTERED 
(
	[id_banan] ASC,
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiet_hoadon]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chitiet_hoadon](
	[id_hoadon] [int] NOT NULL,
	[id_monan] [int] NOT NULL,
	[soluong] [int] NULL,
 CONSTRAINT [PK_chitiet_hoadon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC,
	[id_monan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[hoadon]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hoadon](
	[id_hoadon] [int] NOT NULL,
	[id_nhanvienlap] [int] NULL,
	[id_khachhang] [int] NULL,
	[loaikhachhang] [nvarchar](20) NULL,
	[ngaylap] [date] NULL,
	[tinhtrang] [bit] NULL,
	[ma_giam_gia] [nchar](10) NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khachhang](
	[id_khachhang] [int] IDENTITY(1,1) NOT NULL,
	[name_khachhang] [nvarchar](50) NULL,
	[gioitinh] [bit] NULL,
	[Ngaysinh] [date] NULL,
	[diachi] [nvarchar](50) NULL,
	[sđt] [int] NULL,
	[so_the] [int] NULL,
 CONSTRAINT [PK_khachhang] PRIMARY KEY CLUSTERED 
(
	[id_khachhang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nhanvien](
	[id_nhanvien] [int] IDENTITY(1,1) NOT NULL,
	[hoten] [nvarchar](50) NULL,
	[gioitinh] [bit] NULL,
	[diachi] [nvarchar](50) NULL,
	[sdt] [int] NULL,
	[chucvu] [nvarchar](50) NULL,
	[luong] [int] NULL,
	[id_account] [int] NULL,
 CONSTRAINT [PK_nhanvien] PRIMARY KEY CLUSTERED 
(
	[id_nhanvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thongtin_datban]    Script Date: 2/18/2019 11:38:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thongtin_datban](
	[id_khachhang] [int] NOT NULL,
	[id_banan] [int] NOT NULL,
	[ngaydatban] [date] NULL,
	[giodatban] [time](1) NULL,
 CONSTRAINT [PK_thongtin_datban] PRIMARY KEY CLUSTERED 
(
	[id_khachhang] ASC,
	[id_banan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([id_account], [user_name], [password]) VALUES (1, N'vuminhhieu', N'123')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[khachhang] ON 

INSERT [dbo].[khachhang] ([id_khachhang], [name_khachhang], [gioitinh], [Ngaysinh], [diachi], [sđt], [so_the]) VALUES (1, N'Nguyễn Văn Vinh', 1, CAST(N'1998-01-01' AS Date), N'Hà Nội', 12371232, NULL)
SET IDENTITY_INSERT [dbo].[khachhang] OFF
INSERT [dbo].[loai_mon_an] ([id_loaimonan], [name_loaimonan]) VALUES (1, N'Hải Sản')
SET IDENTITY_INSERT [dbo].[monan] ON 

INSERT [dbo].[monan] ([id_monan], [name_monan], [gia_monan], [thanh_phan], [id_loaimonan]) VALUES (2, N'Cá rán ', 50000, NULL, 1)
SET IDENTITY_INSERT [dbo].[monan] OFF
SET IDENTITY_INSERT [dbo].[nhanvien] ON 

INSERT [dbo].[nhanvien] ([id_nhanvien], [hoten], [gioitinh], [diachi], [sdt], [chucvu], [luong], [id_account]) VALUES (1, N'Vũ Minh Hiếu', 0, N'Hải Dương', 123912321, N'Quản lý ', 5000000, 1)
SET IDENTITY_INSERT [dbo].[nhanvien] OFF
ALTER TABLE [dbo].[chitiet_datban]  WITH CHECK ADD  CONSTRAINT [FK_chitiet_datban_hoadon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[hoadon] ([id_hoadon])
GO
ALTER TABLE [dbo].[chitiet_datban] CHECK CONSTRAINT [FK_chitiet_datban_hoadon]
GO
ALTER TABLE [dbo].[chitiet_hoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiet_hoadon_hoadon] FOREIGN KEY([id_hoadon])
REFERENCES [dbo].[hoadon] ([id_hoadon])
GO
ALTER TABLE [dbo].[chitiet_hoadon] CHECK CONSTRAINT [FK_chitiet_hoadon_hoadon]
GO
ALTER TABLE [dbo].[chitiet_hoadon]  WITH CHECK ADD  CONSTRAINT [FK_chitiet_hoadon_monan] FOREIGN KEY([id_monan])
REFERENCES [dbo].[monan] ([id_monan])
GO
ALTER TABLE [dbo].[chitiet_hoadon] CHECK CONSTRAINT [FK_chitiet_hoadon_monan]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khachhang] FOREIGN KEY([id_khachhang])
REFERENCES [dbo].[khachhang] ([id_khachhang])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khachhang]
GO
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_nhanvien] FOREIGN KEY([id_nhanvienlap])
REFERENCES [dbo].[nhanvien] ([id_nhanvien])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_nhanvien]
GO
ALTER TABLE [dbo].[monan]  WITH CHECK ADD  CONSTRAINT [FK_monan_loai_mon_an] FOREIGN KEY([id_loaimonan])
REFERENCES [dbo].[loai_mon_an] ([id_loaimonan])
GO
ALTER TABLE [dbo].[monan] CHECK CONSTRAINT [FK_monan_loai_mon_an]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_nhanvien_Account] FOREIGN KEY([id_account])
REFERENCES [dbo].[Account] ([id_account])
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [FK_nhanvien_Account]
GO
ALTER TABLE [dbo].[nhanvien]  WITH CHECK ADD  CONSTRAINT [FK_nhanvien_Account1] FOREIGN KEY([id_account])
REFERENCES [dbo].[Account] ([id_account])
GO
ALTER TABLE [dbo].[nhanvien] CHECK CONSTRAINT [FK_nhanvien_Account1]
GO
ALTER TABLE [dbo].[thongtin_datban]  WITH CHECK ADD  CONSTRAINT [FK_thongtin_datban_ban_an] FOREIGN KEY([id_banan])
REFERENCES [dbo].[ban_an] ([id_banan])
GO
ALTER TABLE [dbo].[thongtin_datban] CHECK CONSTRAINT [FK_thongtin_datban_ban_an]
GO
ALTER TABLE [dbo].[thongtin_datban]  WITH CHECK ADD  CONSTRAINT [FK_thongtin_datban_khachhang] FOREIGN KEY([id_khachhang])
REFERENCES [dbo].[khachhang] ([id_khachhang])
GO
ALTER TABLE [dbo].[thongtin_datban] CHECK CONSTRAINT [FK_thongtin_datban_khachhang]
GO
/****** Object:  StoredProcedure [dbo].[checkaccount]    Script Date: 2/18/2019 11:38:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checkaccount] @user varchar(50),@pass varchar(50)
as
begin
select * from Account where @user= Account.user_name and @pass=Account.password
end
GO
/****** Object:  StoredProcedure [dbo].[checklogin]    Script Date: 2/18/2019 11:38:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[checklogin] @id int
as
begin
select * from nhanvien where @id=nhanvien.id_account and chucvu=N'quản lý'
end
GO
/****** Object:  StoredProcedure [dbo].[hienthi]    Script Date: 2/18/2019 11:38:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[hienthi]
as
begin 
select monan.name_monan,monan.gia_monan,loai_mon_an.name_loaimonan from monan , loai_mon_an where monan.id_loaimonan= loai_mon_an.id_loaimonan;
end
GO
/****** Object:  StoredProcedure [dbo].[showkhachhang]    Script Date: 2/18/2019 11:38:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showkhachhang]
as
begin
select id_khachhang as [Mã khách hàng],name_khachhang as [ Tên khách hàng],gioitinh as [ Giới tính ],Ngaysinh as[Ngày sinh],
diachi as [Địa chỉ] ,sđt as [Số điện thoại],so_the as [Số thẻ]
from khachhang
end
GO
-- thủ tục hiển thị
create view showmonan
as
select * from monan
select * from showmonan
-- thủ tục thêm món ăn
create proc themmonan(
@name_monan nvarchar(50),
@gia_monan int,
@thanh_phan nvarchar(50),
@id_loaimonan int)
as
begin
insert into monan(name_monan,gia_monan,thanh_phan,id_loaimonan)
values(
@name_monan,
@gia_monan,
@thanh_phan,
@id_loaimonan
)
end
exec themmonan 'Rau muống','3500','rau','2'
-- thủ tục xóa món ăn
Create proc xoamonan
@id_monan int
as begin delete monan where id_monan=@id_monan end
exec xoamonan '5'
-- thủ tục tìm kiếm món ăn
create proc timkiem
as 
begin
SELECT        name_monan,gia_monan,thanh_phan
FROM            dbo.monan
WHERE        (name_monan = N'Thịt bò')
end
exec timkiem
-- thủ tục sửa món ăn
alter proc suamonan(
@id_monan int,
@name_monan nvarchar(50),
@gia_monan int,
@thanh_phan nvarchar(50),
@id_loaimonan int)
as
begin
update monan set
name_monan = @name_monan,
gia_monan = @gia_monan,
thanh_phan = @thanh_phan,
id_loaimonan = @id_loaimonan
where id_monan = @id_monan
end
exec suamonan  '4',N'Thịt gà', '79000',N'thịt','3'