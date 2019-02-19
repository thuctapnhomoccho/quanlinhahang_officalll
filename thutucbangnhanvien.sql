---Show---
select * from nhanvien

---Sửa---
create proc suanhanvien @ten nvarchar(50) ,@gioitinh bit ,
@diachi nvarchar(50),@sdt int ,@chucvu nvarchar(50),@luong int

as
begin
update nhanvien 
set hoten=@ten , gioitinh=@gioitinh,diachi=@diachi,sdt=@sdt,chucvu=@chucvu,luong=@luongvb 
end

---Thêm---
alter proc themnhanvien

@hoten nvarchar(50),@gioitinh bit,@diachi nvarchar(50),
@sdt int,@chucvu nvarchar(50),@luong int,@id_account int
as
begin
 insert into dbo.nhanvien
 values(@hoten,@gioitinh,@diachi,@sdt,@chucvu,@luong,@id_account)
end  
exec themnhanvien N'Kiều Duy Sơn','1',N'Hà Nội',17836,N'Bảo Vệ',12,1

--xóa--
alter proc xoanhanvien
@id_nhanvien int
as
begin
delete from dbo.nhanvien where id_nhanvien=@id_nhanvien
end

--tìm kiếm--
alter proc timkiemnhanvien @hoten nvarchar(50)
as
begin
SELECT  id_nhanvien, hoten, diachi
FROM  dbo.nhanvien
WHERE hoten like '%'+ @hoten+'%'
end 
exec timkiemnhanvien N'Minh'
