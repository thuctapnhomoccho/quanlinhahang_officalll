USE [quanlinhahang]
GO
/****** Object:  StoredProcedure [dbo].[update_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[update_khachhang]
GO
/****** Object:  StoredProcedure [dbo].[themkhachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[themkhachhang]
GO
/****** Object:  StoredProcedure [dbo].[showkhachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[showkhachhang]
GO
/****** Object:  StoredProcedure [dbo].[seach_khachhang_diachi]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[seach_khachhang_diachi]
GO
/****** Object:  StoredProcedure [dbo].[seach_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[seach_khachhang]
GO
/****** Object:  StoredProcedure [dbo].[hienthi]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[hienthi]
GO
/****** Object:  StoredProcedure [dbo].[delete_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[delete_khachhang]
GO
/****** Object:  StoredProcedure [dbo].[checklogin]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[checklogin]
GO
/****** Object:  StoredProcedure [dbo].[checkaccount]    Script Date: 2/19/2019 11:46:34 AM ******/
DROP PROCEDURE [dbo].[checkaccount]
GO
/****** Object:  StoredProcedure [dbo].[checkaccount]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[checklogin]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[delete_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[hienthi]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[seach_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[seach_khachhang_diachi]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[showkhachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[themkhachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
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
/****** Object:  StoredProcedure [dbo].[update_khachhang]    Script Date: 2/19/2019 11:46:34 AM ******/
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
