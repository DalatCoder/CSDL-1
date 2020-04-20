------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

--Tạo cơ sở dữ liệu Quản lý nhân viên
CREATE DATABASE Lab01_QuanLyNhanVien

-- Go để bắt đầu 1 lệnh
go

-- Sử dụng cơ sở dữ liệu Quản lý nhân viên
use Lab01_QuanLyNhanVien

-- Tạo các bảng tương ứng trong cơ sở dữ liệu
-- Bảng chi nhánh, với MSCN là khóa chính với 2 kí tự char, Tên chi nhánh lưu Unicode với chiều dài 30 kí tự, không được để trống và không được trùng tên

create table ChiNhanh
(
	MSCN	char(2) primary key, 
	TenCN	nvarchar(30) not null unique
)

go
create table NhanVien
(
	MANV	char(4) primary key,
	Ho		nvarchar(20) not null,
	Ten		nvarchar(10)	not null,
	Ngaysinh	datetime,
	NgayVaoLam	datetime,

	-- Khóa ngoại mã số chi nhánh tham chiếu đến khóa chính tương ứng trong bảng chi nhánh
	MSCN	char(2)	references	ChiNhanh(MSCN) 
)

go
create table KyNang
(
	MSKN	char(2) primary key,
	TenKN	nvarchar(30) not null
)

go
create table NhanVienKyNang
(
	MANV	char(4) references NhanVien(MANV),
	MSKN	char(2) references KyNang(MSKN),

	-- Kiểm tra mức độ có giá trị từ 1 đến 9
	MucDo	tinyint check(MucDo between 1 and 9)

	-- Tạo khóa chính gồm nhiều thuộc tính
	primary key(MANV, MSKN) 
)

-- Xem các bảng
select * from ChiNhanh
select * from NhanVien
select * from KyNang
select * from NhanVienKyNang

-- Nhập dữ liệu cho các bảng
-- Với kiểu Unicode, phải đặt N trước giá trị
insert into ChiNhanh values('01',N'Quận 1')
insert into ChiNhanh values('02',N'Quận 5')
insert into ChiNhanh values('03',N'Bình thạnh')

insert into KyNang values('01',N'Word')
insert into KyNang values('02',N'Excel')
insert into KyNang values('03',N'Access')
insert into KyNang values('04',N'Power Point')
insert into KyNang values('05','SPSS')

-- Thay đổi định dạng hiển thị mặc định thành dd/mm/yyyy
set dateformat dmy 

go
insert into NhanVien values('0001',N'Lê Văn',N'Minh','10/06/1960','02/05/1986','01')
insert into NhanVien values('0002',N'Nguyễn Thị',N'Mai','20/04/1970','04/07/2001','01')
insert into NhanVien values('0003',N'Lê Anh',N'Tuấn','25/06/1975','01/09/1982','02')
insert into NhanVien values('0004',N'Vương Tuấn',N'Vũ','25/03/1975','12/01/1986','02')
insert into NhanVien values('0005',N'Lý Anh',N'Hân','01/12/1980','15/05/2004','02')
insert into NhanVien values('0006',N'Phan Lê',N'Tuấn','04/06/1976','25/10/2002','03')
insert into NhanVien values('0007',N'Lê Tuấn',N'Tú','15/08/1975','15/08/2000','03')

insert into NhanVienKyNang values('0001','01',2)
insert into NhanVienKyNang values('0001','02',1)
insert into NhanVienKyNang values('0002','01',2)
insert into NhanVienKyNang values('0002','03',2)
insert into NhanVienKyNang values('0003','02',1)
insert into NhanVienKyNang values('0003','03',2)
insert into NhanVienKyNang values('0004','01',5)
insert into NhanVienKyNang values('0004','02',4)
insert into NhanVienKyNang values('0004','03',1)
insert into NhanVienKyNang values('0005','02',4)
insert into NhanVienKyNang values('0005','04',4)
insert into NhanVienKyNang values('0006','05',4)
insert into NhanVienKyNang values('0006','02',4)
insert into NhanVienKyNang values('0006','03',2)
insert into NhanVienKyNang values('0007','03',4)
insert into NhanVienKyNang values('0007','04',3)

-- Xem lại các bảng sau khi nhập giá trị
select * from ChiNhanh
select * from NhanVien
select * from KyNang
select * from NhanVienKyNang

-- Truy vấn dữ liệu --
-- Q1: Hiển thị MSNV, HoTen (Ho + Ten as HoTen), số năm làm việc (SoNamLamViec)
SELECT MANV, Ho + ' ' + Ten AS HoTen, YEAR(GETDATE()) - YEAR(NgayVaoLam) AS SoNamLamViec
FROM NhanVien

-- Q2: Liệt kê các thông tin về nhân viên: HoTen, NgaySinh, NgayVaoLam, TenCN (sắp xếp theo tên chi nhánh).
SELECT Ho + ' ' + Ten AS HoTen, Ngaysinh, NgayVaoLam, TenCN
FROM NhanVien, ChiNhanh
WHERE NhanVien.MSCN = ChiNhanh.MSCN
ORDER BY ChiNhanh.TenCN

-- Q3: Liệt kê các nhân viên (HoTen, TenKN, MucDo) của những nhân viên biết sử dụng ‘Word’.
SELECT Ho + ' ' + Ten AS HoTen, TenKN, MucDo
FROM NhanVien, KyNang, NhanVienKyNang
WHERE NhanVien.MANV = NhanVienKyNang.MANV and KyNang.MSKN = NhanVienKyNang.MSKN and TenKN = N'Word'

-- Q4: Liệt kê các kỹ năng (TenKN, MucDo) mà nhân viên ‘Lê Anh Tuấn’ biết sử dụng.
SELECT TenKN, MucDo
FROM NhanVien, KyNang, NhanVienKyNang
WHERE 
	NhanVien.Ho = N'Lê Anh' and NhanVien.Ten = N'Tuấn' and 
	NhanVien.MANV = NhanVienKyNang.MANV and KyNang.MSKN = NhanVienKyNang.MSKN


-- Q5: Cho biết số người dùng của từng kĩ năng gồm MSKN, TenKN, SoND
SELECT KyNang.MSKN, TenKN, COUNT(NhanVienKyNang.MANV) as SoND
FROM KyNang, NhanVienKyNang
WHERE KyNang.MSKN = NhanVienKyNang.MSKN
GROUP BY KyNang.MSKN, TenKN

-- Q6: Cho biết những kĩ năng có trên 3 người dùng
SELECT KyNang.MSKN, TenKN, COUNT(NhanVienKyNang.MANV) as SoND
FROM KyNang, NhanVienKyNang
WHERE KyNang.MSKN = NhanVienKyNang.MSKN
GROUP BY KyNang.MSKN, TenKN
HAVING COUNT(NhanVienKyNang.MANV) > 3

-- Q7: Liệt kê nhân viên biết từ 3 kỹ năng trở lên
SELECT NhanVien.MANV, Ho, Ten, Ngaysinh, COUNT(MSKN) AS SoKN
FROM NhanVien, NhanVienKyNang
WHERE NhanVien.MANV = NhanVienKyNang.MANV
GROUP BY NhanVien.MANV, Ho, Ten, Ngaysinh
HAVING COUNT(MSKN) >= 3