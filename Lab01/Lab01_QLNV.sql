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
GO

-- Sử dụng cơ sở dữ liệu Quản lý nhân viên
USE Lab01_QuanLyNhanVien
GO

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

-- 1. Truy vấn lựa chọn trên nhiều bảng
-- a) Hiển thị MSNV, HoTen (Ho + Ten as HoTen), số năm làm việc (SoNamLamViec).
SELECT MANV, Ho + ' ' + Ten AS HoTen, YEAR(GETDATE()) - YEAR(NgayVaoLam) AS SoNamLamViec
FROM NhanVien

-- b) Liệt kê các thông tin về nhân viên: HoTen, NgaySinh, NgayVaoLam, TenCN (sắp xếp theo tên chi nhánh).
SELECT Ho + ' ' + Ten AS HoTen, CONVERT(char(10), NgaySinh, 103) AS NgaySinh, CONVERT(char(10), NgayVaoLam, 103) AS NgayVaoLam, TenCN
FROM NhanVien, ChiNhanh
WHERE NhanVien.MSCN = ChiNhanh.MSCN
ORDER BY TenCN, Ten


-- c) Liệt kê các nhân viên (HoTen, TenKN, MucDo) của những nhân viên biết sử dụng ‘Word’.
SELECT Ho + ' ' + Ten AS HoTen, TenKN, MucDo 
FROM NhanVien, KyNang, NhanVienKyNang
WHERE  
	NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN AND
	KyNang.TenKN = N'Word'
ORDER BY MucDo


-- d) Liệt kê các kỹ năng (TenKN, MucDo) mà nhân viên ‘Lê Anh Tuấn’ biết sử dụng.
SELECT TenKN, MucDo
FROM NhanVien, KyNang, NhanVienKyNang
WHERE
	NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN AND
	NhanVien.Ho = N'Lê Anh' AND NhanVien.Ten = N'Tuấn'
ORDER BY MucDo

-- 2. Truy vấn lồng
-- a) Liệt kê MANV, HoTen, MSCN, TenCN của các nhân viên có mức độ thành thạo về ‘Excel’ cao nhất trong công ty .
SELECT NhanVien.MANV, Ho, Ten, ChiNhanh.MSCN, TenCN, MucDo
FROM NhanVien, NhanVienKyNang, KyNang, ChiNhanh
WHERE
	NhanVien.MSCN = ChiNhanh.MSCN AND NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN AND
	KyNang.TenKN = N'Excel'
GROUP BY NhanVien.MANV, Ho, Ten, ChiNhanh.MSCN, TenCN, MucDo
HAVING MucDo >= ALL(
		SELECT MucDo
		FROM KyNang, NhanVienKyNang
		WHERE KyNang.MSKN = NhanVienKyNang.MSKN AND KyNang.TenKN = N'Excel'
	)
	

-- b) Liệt kê MANV, HoTen, TenCN của các nhân viên vừa biết ‘Word’ vừa biết ‘Excel’ (dùng truy vấn lồng).
-- LIỆT KÊ NHÂN VIÊN BIẾT WORD
SELECT NhanVien.MANV, Ho, Ten, ChiNhanh.MSCN, TenCN
FROM NhanVien, NhanVienKyNang, KyNang, ChiNhanh
WHERE
	NhanVien.MSCN = ChiNhanh.MSCN AND NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN AND
	KyNang.TenKN = N'Word' AND
	NhanVien.MANV IN (
		-- LIỆT KÊ NHÂN VIÊN BIẾT EXCEL 
		SELECT NhanVien.MANV
		FROM NhanVien, NhanVienKyNang, KyNang
		WHERE
			NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN AND
			KyNang.TenKN = N'Excel'
		)

-- c) Với từng kỹ năng, hãy liệt kê các thông tin (MANV, HoTen, TenCN, TenKN, MucDo) của những nhân viên thành thạo kỹ năng đó nhất.


-- d) Liệt kê các chi nhánh (MSCN, TenCN) mà mọi nhân viên trong chi nhánh đó đều biết ‘Word’.



-- 3. Truy vấn gom nhóm dữ liệu.
-- a) Với mỗi chi nhánh, hãy cho biết các thông tin sau TenCN, SoNV (số nhân viên của chi nhánh đó).
SELECT ChiNhanh.TenCN, COUNT(NhanVien.MANV) AS SoNV
FROM ChiNhanh, NhanVien
WHERE ChiNhanh.MSCN = NhanVien.MSCN
GROUP BY ChiNhanh.MSCN, ChiNhanh.TenCN
ORDER BY TenCN

-- b) Với mỗi kỹ năng, hãy cho biết TenKN, SoNguoiDung (số nhân viên biết sử dụng kỹ năng đó).
SELECT TenCN, TenKN, COUNT(NhanVien.MANV) AS SoNguoiDung
FROM ChiNhanh, NhanVien, NhanVienKyNang, KyNang
WHERE ChiNhanh.MSCN = NhanVien.MSCN AND NhanVien.MANV = NhanVienKyNang.MANV AND KyNang.MSKN = NhanVienKyNang.MSKN
GROUP BY TenCN, TenKN
ORDER BY TenCN

-- c) Cho biết TenKN có từ 3 nhân viên trong công ty sử dụng trở lên.
SELECT TenKN
FROM NhanVienKyNang, KyNang
WHERE NhanVienKyNang.MSKN = KyNang.MSKN
GROUP BY TenKN
HAVING COUNT(NhanVienKyNang.MANV) >= 3

-- d) Cho biết TenCN có nhiều nhân viên nhất.
-- GOM SỐ LƯỢNG NHÂN VIÊN THEO TỪNG CHI NHÁNH
SELECT TenCN, COUNT(NhanVien.MANV) AS SoLuongNhanVien
FROM ChiNhanh, NhanVien
WHERE ChiNhanh.MSCN = NhanVien.MSCN
GROUP BY TenCN
HAVING COUNT(NhanVien.MANV) >= ALL(
		SELECT COUNT(NhanVien.MANV)
		FROM ChiNhanh, NhanVien
		WHERE ChiNhanh.MSCN = NhanVien.MSCN
		GROUP BY ChiNhanh.TenCN
	)

-- e) Cho biết TenCN có ít nhân viên nhất.
SELECT TenCN, COUNT(NhanVien.MANV) AS SoLuongNhanVien
FROM ChiNhanh, NhanVien
WHERE ChiNhanh.MSCN = NhanVien.MSCN
GROUP BY TenCN
HAVING COUNT(NhanVien.MANV) <= ALL(
		SELECT COUNT(NhanVien.MANV)
		FROM ChiNhanh, NhanVien
		WHERE ChiNhanh.MSCN = NhanVien.MSCN
		GROUP BY ChiNhanh.TenCN
	)

-- f) Với mỗi nhân viên, hãy cho biết số kỹ năng tin học mà nhân viên đó sử dụng được.
SELECT NhanVien.MANV, Ho, Ten, COUNT(NhanVienKyNang.MSKN) AS SoLuongKyNangSuDung
FROM NhanVien, NhanVienKyNang
WHERE NhanVien.MANV = NhanVienKyNang.MANV
GROUP BY NhanVien.MANV, Ho, Ten
ORDER BY NhanVien.MANV

-- g) Cho biết HoTen, TenCN của nhân viên biết sử dụng nhiều kỹ năng nhất.
SELECT NhanVien.MANV, Ho, Ten, COUNT(NhanVienKyNang.MSKN) AS SoLuongKyNangSuDung
FROM NhanVien, NhanVienKyNang
WHERE NhanVien.MANV = NhanVienKyNang.MANV
GROUP BY NhanVien.MANV, Ho, Ten
HAVING COUNT(NhanVienKyNang.MSKN) >= ALL (
		SELECT COUNT(NhanVienKyNang.MSKN)
		FROM NhanVien, NhanVienKyNang
		WHERE NhanVien.MANV = NhanVienKyNang.MANV
		GROUP BY NhanVien.MANV
	)
