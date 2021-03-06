USE [quanlinhahang]
GO
/****** Object:  Table [dbo].[loai_mon_an]    Script Date: 2/20/2019 9:45:11 AM ******/
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
/****** Object:  Table [dbo].[monan]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  View [dbo].[hienthimonan]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[hienthimonan] as
select monan.name_monan,monan.gia_monan,loai_mon_an.name_loaimonan from monan , loai_mon_an where monan.id_loaimonan= loai_mon_an.id_loaimonan;
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  Table [dbo].[ban_an]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ban_an](
	[id_banan] [int] IDENTITY(1,1) NOT NULL,
	[chatlieu] [nvarchar](50) NULL,
	[tinhtrang] [bit] NULL,
	[id_loaibanan] [int] NULL,
 CONSTRAINT [PK_ban_an] PRIMARY KEY CLUSTERED 
(
	[id_banan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chitiet_hoadon]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  Table [dbo].[hoadon]    Script Date: 2/20/2019 9:45:12 AM ******/
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
	[id_khuyenmai] [int] NULL,
 CONSTRAINT [PK_hoadon] PRIMARY KEY CLUSTERED 
(
	[id_hoadon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  Table [dbo].[khuyenmai]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khuyenmai](
	[id_khuyenmai] [int] NOT NULL,
	[name_khuyenmai] [nvarchar](50) NULL,
	[phantram_discount] [varchar](4) NULL,
 CONSTRAINT [PK_khuyenmai] PRIMARY KEY CLUSTERED 
(
	[id_khuyenmai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loaibanan]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loaibanan](
	[id_loaiban] [int] NOT NULL,
	[soluongkhach] [int] NULL,
 CONSTRAINT [PK_Loaibanan] PRIMARY KEY CLUSTERED 
(
	[id_loaiban] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  Table [dbo].[thongtin_datban]    Script Date: 2/20/2019 9:45:12 AM ******/
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
ALTER TABLE [dbo].[ban_an]  WITH CHECK ADD  CONSTRAINT [FK_ban_an_Loaibanan] FOREIGN KEY([id_loaibanan])
REFERENCES [dbo].[Loaibanan] ([id_loaiban])
GO
ALTER TABLE [dbo].[ban_an] CHECK CONSTRAINT [FK_ban_an_Loaibanan]
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
ALTER TABLE [dbo].[hoadon]  WITH CHECK ADD  CONSTRAINT [FK_hoadon_khuyenmai] FOREIGN KEY([id_khuyenmai])
REFERENCES [dbo].[khuyenmai] ([id_khuyenmai])
GO
ALTER TABLE [dbo].[hoadon] CHECK CONSTRAINT [FK_hoadon_khuyenmai]
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
/****** Object:  StoredProcedure [dbo].[checkaccount]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  StoredProcedure [dbo].[checklogin]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  StoredProcedure [dbo].[delete_khachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_khachhang] @id int
as
begin
delete from khachhang
where id_khachhang=@id
end
GO
/****** Object:  StoredProcedure [dbo].[hienthi]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  StoredProcedure [dbo].[seach_khachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[seach_khachhang] @name nvarchar(50)
as
begin
select * from khachhang where name_khachhang like '%'+ @name +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[seach_khachhang_diachi]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[seach_khachhang_diachi] @diachi nvarchar(50)
as
begin
  select * from khachhang where diachi like '%'+@diachi+'%'
end
GO
/****** Object:  StoredProcedure [dbo].[showbanan]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[showbanan]
as
begin
select * from ban_an
end
GO
/****** Object:  StoredProcedure [dbo].[showkhachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
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
/****** Object:  StoredProcedure [dbo].[themkhachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[themkhachhang] @ten nvarchar(50),@gioitinh bit ,@ngaysinh date,@diachi nvarchar(50),@phone int,@card int
as
begin
insert into khachhang
values(@ten,@gioitinh,@ngaysinh,@diachi,@phone,@card)
end
GO
/****** Object:  StoredProcedure [dbo].[update_khachhang]    Script Date: 2/20/2019 9:45:12 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[update_khachhang] @id int,  @ten nvarchar(50),@gioitinh bit ,@ngaysinh date,@diachi nvarchar(50),@phone int,@card int
as
begin
update khachhang 
set
 name_khachhang=@ten,gioitinh=@gioitinh,Ngaysinh=@ngaysinh,diachi=@diachi,sđt=@phone,so_the=@card
 where id_khachhang=@id
end
GO
