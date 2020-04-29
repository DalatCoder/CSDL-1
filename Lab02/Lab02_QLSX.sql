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

	primary key(MaCN, MaSP, Ngay)
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
--1) Liệt kê các công nhân theo tổ sản xuất gồm các thông tin: TenTSX, HoTen,
--   NgaySinh, Phai (xếp thứ tự tăng dần của tên tổ sản xuất, Tên của công nhân).
SELECT TenTSX, Ho + ' ' + Ten as HoTen, CONVERT(char(10), NgaySinh, 103) as NgaySinh, Phai
FROM CongNhan, ToSanXuat
WHERE CongNhan.MaTSX = ToSanXuat.MaTSX
ORDER BY TenTSX, Ten


--2) Liệt kê các thành phẩm mà công nhân ‘Nguyễn Trường An’ đã làm được gồm
--   các thông tin: TenSP, Ngay, SoLuong, ThanhTien (xếp theo thứ tự tăng dần của ngày).
SELECT TenSP, CONVERT(char(10), Ngay, 103) as Ngay, SoLuong, TienCong, SoLuong * TienCong as ThanhTien
FROM CongNhan, ThanhPham, SanPham
WHERE
	CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP AND
	Ho = N'Nguyễn Trường' AND Ten = N'An'
ORDER BY Ngay

--3) Liệt kê các nhân viên không sản xuất sản phẩm ‘Bình gốm lớn’.
-- LIỆT KÊ TOÀN BỘ NHÂN VIÊN
SELECT * FROM CongNhan
WHERE CongNhan.MaCN NOT IN (
	-- LIỆT KÊ CÔNG NHÂN SẢN XUẤT BÌNH GỐM LỚN
	SELECT ThanhPham.MaCN
	FROM SanPham, ThanhPham
	WHERE	
		SanPham.MaSP = ThanhPham.MaSP AND
		SanPham.TenSP = N'Bình gốm lớn'
	)


--4) Liệt kê thông tin các công nhân có sản xuất cả ‘Nồi đất’ và ‘Bình gốm nhỏ’.
-- LIỆT KÊ CÔNG NHÂN SẢN XUẤT NỒI ĐẤT
SELECT DISTINCT CongNhan.MaCN, Ho + ' ' + Ten as HoTen, CONVERT(char(10), NgaySinh, 103) as NgaySinh, Phai
FROM CongNhan, ThanhPham, SanPham
WHERE 
	CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP AND
	SanPham.TenSP = N'Bình gốm nhỏ' AND
	CongNhan.MaCN IN (
		-- LIỆT KÊ CÔNG NHÂN SẢN XUẤT BÌNH GỐM NHỎ
		SELECT DISTINCT ThanhPham.MaCN
		FROM ThanhPham, SanPham
		WHERE 
			SanPham.MaSP = ThanhPham.MaSP AND
			SanPham.TenSP = N'Nồi đất'
		)

--5) Thống kê Số luợng công nhân theo từng tổ sản xuất.
SELECT TenTSX, COUNT(MaCN) AS SoLuongCongNhan
FROM CongNhan, ToSanXuat
WHERE CongNhan.MaTSX = ToSanXuat.MaTSX
GROUP BY ToSanXuat.MaTSX, TenTSX
ORDER BY ToSanXuat.MaTSX

--6) Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được (Ho,
--   Ten, TenSP, TongSLThanhPham, TongThanhTien).
SELECT CongNhan.MaCN, Ho, Ten, TenSP, SUM(SoLuong) as TongSLThanhPham, SUM(SoLuong * TienCong) as TongThanhTien
FROM CongNhan, ThanhPham, SanPham
WHERE CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP
GROUP BY CongNhan.MaCN, Ho, Ten, TenSP
ORDER BY CongNhan.MaCN


--7) Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
SELECT SUM(SoLuong * TienCong) AS TongTienCong
FROM ThanhPham, SanPham
WHERE 
	SanPham.MaSP = ThanhPham.MaSP AND 
	MONTH(Ngay) = 1 AND YEAR(Ngay)= 2007


--8) Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
-- ĐẾM SỐ LƯỢNG SẢN PHẨM SẢN XUẤT TRONG THÁNG 2/2007
SELECT SanPham.MaSP, TenSP, SUM(SoLuong) AS SoLuongSX
FROM ThanhPham, SanPham
WHERE 
	SanPham.MaSP = ThanhPham.MaSP AND
	MONTH(Ngay) = 2 AND YEAR(Ngay)= 2007
GROUP BY SanPham.MaSP, TenSP
HAVING SUM(SoLuong) >= ALL(
	SELECT SUM(SoLuong)
	FROM ThanhPham
	WHERE 
		MONTH(Ngay) = 2 AND YEAR(Ngay)= 2007
	GROUP BY MaSP
	)

--9) Cho biết công nhân sản xuất được nhiều ‘Chén’ nhất.
-- LIỆT KÊ SỐ LƯỢNG CHÉN ĐƯỢC SẢN XUẤT
SELECT CongNhan.MaCN, Ho, Ten, Phai, SUM(SoLuong) AS SoLuong
FROM CongNhan, ThanhPham, SanPham
WHERE
	CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP AND
	SanPham.TenSP = N'Chén'
GROUP BY CongNhan.MaCN, Ho, Ten, Phai
HAVING SUM(SoLuong) >= ALL(
	SELECT SUM(SoLuong)
	FROM CongNhan, ThanhPham, SanPham
	WHERE
		CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP AND
		SanPham.TenSP = N'Chén'
	GROUP BY CongNhan.MaCN
	)

--10) Tiền công tháng 2/2007 của công nhân viên có mã số ‘CN002’
SELECT SUM(SoLuong * TienCong) AS TongTienCong
FROM CongNhan, ThanhPham, SanPham
WHERE 
	CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP AND
	CongNhan.MaCN = 'CN002'


--11) Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên.
-- LIỆT KÊ SẢN PHẨM CÔNG NHÂN LÀM ĐƯỢC THEO TỪNG LOẠI
SELECT CongNhan.MaCN, Ho, Ten, Phai
FROM CongNhan, ThanhPham, SanPham
WHERE
	CongNhan.MaCN = ThanhPham.MaCN AND SanPham.MaSP = ThanhPham.MaSP
GROUP BY CongNhan.MaCN, Ho, Ten, Phai
HAVING COUNT(DISTINCT TenSP) >= 3
ORDER BY CongNhan.MaCN


--12) Cập nhật giá tiền công của các loại bình gốm thêm 1000.
--13) Thêm bộ <’CN006’, ‘Lê Thị’, ‘Lan’, ‘Nữ’,’TS02’ > vào bảng CongNhan.