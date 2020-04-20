------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab02_QuanLySanXuat
GO

USE Lab02_QuanLySanXuat
GO

create table ToSanXuat (
	MaTSX	char(4) primary key,
	TenTSX	nvarchar(5) not null unique
)
go

create table CongNhan (
	MaCN		char(5)	primary key,
	Ho			nvarchar(20) not null,
	Ten			nvarchar(10) not null,
	Phai		nvarchar(3),
	NgaySinh	datetime,
	MaTSX		char(4) references ToSanXuat(MaTSX)
)
go

create table SanPham (
	MaSP		char(5) primary key,
	TenSP		nvarchar(20) not null unique,
	DVT			nvarchar(10),
	TienCong	float check (TienCong > 0)
)
go

create table ThanhPham (
	MaCN	char(5) references CongNhan(MaCN),
	MaSP	char(5) references SanPham(MaSP),
	Ngay	datetime,
	SoLuong int check (SoLuong >= 0)

	primary key(MaCN, MaSP)
)
go

-- Chèn dữ liệu 
INSERT INTO ToSanXuat VALUES ('TS01', N'Tổ 1')
INSERT INTO ToSanXuat VALUES ('TS02', N'Tổ 2')

-- Thay đổi định dạng hiển thị mặc định thành dd/mm/yyyy
set dateformat dmy 
go

INSERT INTO CongNhan VALUES ('CN001', N'Nguyễn Trường', N'An', N'Nam', '12/05/1981', 'TS01')
INSERT INTO CongNhan VALUES ('CN002', N'Lê Thị Hồng', N'Gấm', N'Nữ', '04/06/1980', 'TS01')
INSERT INTO CongNhan VALUES ('CN003', N'Nguyễn Công', N'Thành', N'Nam', '04/05/1981', 'TS02')
INSERT INTO CongNhan VALUES ('CN004', N'Võ Hữu', N'Hạnh', N'Nam', '15/02/1980', 'TS02')
INSERT INTO CongNhan VALUES ('CN005', N'Lý Thanh', N'Hân', N'Nữ', '03/12/1981', 'TS01')

INSERT INTO SanPham VALUES ('SP001', N'Nồi đất', N'cái', 10.000)
INSERT INTO SanPham VALUES ('SP002', N'Chén', N'cái', 2.000)
INSERT INTO SanPham VALUES ('SP003', N'Bình gốm nhỏ', N'cái', 20.000)
INSERT INTO SanPham VALUES ('SP004', N'Bình gốm lớn', N'cái', 25.000)

-- Thay đổi định dạng hiển thị mặc định thành dd/mm/yyyy
set dateformat dmy 
go

INSERT INTO ThanhPham VALUES ('CN001', 'SP001', '01/02/2007', 10)
INSERT INTO ThanhPham VALUES ('CN002', 'SP001', '01/02/2007', 5)
INSERT INTO ThanhPham VALUES ('CN003', 'SP002', '10/01/2007', 50)
INSERT INTO ThanhPham VALUES ('CN004', 'SP003', '12/01/2007', 10)
INSERT INTO ThanhPham VALUES ('CN005', 'SP002', '12/01/2007', 100)
INSERT INTO ThanhPham VALUES ('CN002', 'SP004', '13/02/2007', 10)
INSERT INTO ThanhPham VALUES ('CN001', 'SP003', '14/02/2007', 15)
INSERT INTO ThanhPham VALUES ('CN003', 'SP001', '15/01/2007', 20)
INSERT INTO ThanhPham VALUES ('CN003', 'SP003', '14/02/2007', 15)
INSERT INTO ThanhPham VALUES ('CN004', 'SP002', '30/01/2007', 100)
INSERT INTO ThanhPham VALUES ('CN005', 'SP003', '01/02/2007', 50)
INSERT INTO ThanhPham VALUES ('CN001', 'SP001', '20/02/2007', 30)

-- Xem các bảng
SELECT * FROM ToSanXuat
SELECT * FROM CongNhan
SELECT * FROM SanPham
SELECT * FROM ThanhPham

-- Truy vấn dữ liệu từ CSDL --
-- Q1: Cho biết thông tin các công nhân làm việc tại Tố sản xuất 'TS02'
SELECT MaCN, Ho + ' ' + Ten AS HoTen, Phai, NgaySinh
FROM CongNhan
WHERE CongNhan.MaTSX = 'TS02'

-- Q2: Lập danh sách công nhân sinh sau năm 1980
SELECT MaCN, Ho + ' ' + Ten AS HoTen, Phai, NgaySinh
FROM CongNhan
WHERE YEAR(CongNhan.NgaySinh) > 1980

-- Q3: Lập danh sách công nhân sản xuất 'Bình gốm lớn'
SELECT CongNhan.MaCN, Ho + ' ' + Ten AS HoTen, SanPham.TenSP, ThanhPham.SoLuong, SanPham.DVT
FROM CongNhan, SanPham, ThanhPham
WHERE CongNhan.MaCN = ThanhPham.MaCN and SanPham.MaSP = ThanhPham.MaSP and SanPham.TenSP = N'Bình gốm lớn'

-- Q4: Lập danh sách sản phẩm sản xuất trong tháng 1/2007
SELECT SanPham.MaSP, TenSP, SoLuong, DVT, Ngay
FROM SanPham, ThanhPham
WHERE SanPham.MaSP = ThanhPham.MaSP and MONTH(ThanhPham.Ngay) = 1 and YEAR(ThanhPham.Ngay) = 2007
