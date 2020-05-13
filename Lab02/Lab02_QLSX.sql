------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab02_QuanLySanXuat;
USE Lab02_QuanLySanXuat;

CREATE TABLE ToSanXuat 
(
	id CHAR(4) PRIMARY KEY,
	ten NVARCHAR(30) UNIQUE
);

CREATE TABLE CongNhan
(
	id CHAR(5) PRIMARY KEY,
	ho NVARCHAR(30),
	ten NVARCHAR(30),
	phai NVARCHAR(30),
	ngaySinh DATE,
	toSX_id CHAR(4),
	FOREIGN KEY (toSX_id) REFERENCES ToSanXuat(id) ON DELETE CASCADE
);

CREATE TABLE SanPham
(
	id CHAR(5) PRIMARY KEY,
	ten NVARCHAR(30) UNIQUE,
	dvt NVARCHAR(30),
	tienCong FLOAT CHECK (tienCong > 0)
);

CREATE TABLE ThanhPham
(
	congNhan_id CHAR(5),
	sanPham_id CHAR(5),
	ngay DATE,
	soLuong INT CHECK (soLuong > 0),
	FOREIGN KEY (congNhan_id) REFERENCES CongNhan(id),
	FOREIGN KEY (sanPham_id) REFERENCES SanPham(id),
	PRIMARY KEY (congNhan_id, sanPham_id, ngay)
);

INSERT INTO ToSanXuat(id, ten) VALUES('TS01', N'Tổ 1');
INSERT INTO ToSanXuat(id, ten) VALUES('TS02', N'Tổ 2');
SELECT * FROM ToSanXuat;

SET DATEFORMAT dmy;
INSERT INTO CongNhan(id, ho, ten, phai, ngaySinh, toSX_id)
VALUES('CN001', N'Nguyễn Trường', N'An',N'Nam', '12/05/1981','TS01');

INSERT INTO CongNhan(id, ho, ten, phai, ngaySinh, toSX_id)
VALUES('CN002', N'Lê Thị Hồng', N'Gấm',N'Nữ', '04/06/1980','TS01');

INSERT INTO CongNhan(id, ho, ten, phai, ngaySinh, toSX_id)
VALUES('CN003', N'Nguyễn Công', N'Thành',N'Nam', '04/05/1981','TS02');

INSERT INTO CongNhan(id, ho, ten, phai, ngaySinh, toSX_id)
VALUES('CN004', N'Võ Hữu', N'Hạnh',N'Nam', '15/02/1980','TS02');

INSERT INTO CongNhan(id, ho, ten, phai, ngaySinh, toSX_id)
VALUES('CN005', N'Lý Thanh', N'Hân',N'Nữ', '03/12/1981','TS01');
SELECT * FROM CongNhan;

INSERT INTO SanPham(id, ten, dvt, tienCong) VALUES ('SP001', N'Nồi đất', N'cái', 10.000);
INSERT INTO SanPham(id, ten, dvt, tienCong) VALUES ('SP002', N'Chén', N'cái', 2.000);
INSERT INTO SanPham(id, ten, dvt, tienCong) VALUES ('SP003', N'Bình gốm nhỏ', N'cái', 20.000);
INSERT INTO SanPham(id, ten, dvt, tienCong) VALUES ('SP004', N'Bình gốm lớn', N'cái', 25.000);
SELECT * FROM SanPham;

SET DATEFORMAT dmy;
INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN001', 'SP001', '01/02/2007', 10);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN002', 'SP001', '01/02/2007', 5);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN003', 'SP002', '10/01/2007', 50);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN004', 'SP003', '12/01/2007', 10);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN005', 'SP002', '12/01/2007', 100);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN002', 'SP004', '13/02/2007', 10);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN001', 'SP003', '14/02/2007', 15);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN003', 'SP001', '15/01/2007', 20);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN003', 'SP004', '14/02/2007', 15);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN004', 'SP002', '30/01/2007', 100);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN005', 'SP003', '01/02/2007', 50);

INSERT INTO ThanhPham(congNhan_id, sanPham_id, ngay, soLuong)
VALUES ('CN001', 'SP001', '20/02/2007', 30);
SELECT * FROM ThanhPham;

-- 1) Liệt kê các công nhân theo tổ sản xuất gồm các thông tin: 
-- TenTSX, HoTen, NgaySinh, Phai (xếp thứ tự tăng dần của tên tổ sản xuất, Tên của công nhân).
SELECT ToSanXuat.ten, CONCAT(ho, ' ', CongNhan.ten) AS HoTen, ngaySinh, Phai
FROM CongNhan
JOIN ToSanXuat ON CongNhan.toSX_id = ToSanXuat.id
ORDER BY ToSanXuat.ten, CongNhan.ten;

-- 2) Liệt kê các thành phẩm mà công nhân ‘Nguyễn Trường An’ đã làm được gồm các thông tin: 
-- TenSP, Ngay, SoLuong, ThanhTien (xếp theo thứ tự tăng dần của ngày).
SELECT SanPham.ten, ngay, soLuong, tienCong, soLuong * tienCong AS ThanhTien
FROM CongNhan
JOIN ThanhPham ON CongNhan.id = ThanhPham.congNhan_id
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
WHERE CongNhan.ten = N'An' AND CongNhan.ho = N'Nguyễn Trường';

-- 3) Liệt kê các nhân viên không sản xuất sản phẩm ‘Bình gốm lớn’.
SELECT *
FROM CongNhan
WHERE CongNhan.id NOT IN
    (SELECT congNhan_id
     FROM ThanhPham
     JOIN SanPham ON ThanhPham.sanPham_id = SanPham.id
     WHERE SanPham.ten = N'Bình gốm lớn');

-- 4) Liệt kê thông tin các công nhân có sản xuất cả ‘Nồi đất’ và ‘Bình gốm nhỏ’.
SELECT DISTINCT CONCAT(CongNhan.ho, ' ', CongNhan.ten) AS HoTen,
                ngaySinh,
                Phai
FROM CongNhan
JOIN ThanhPham ON CongNhan.id = ThanhPham.congNhan_id
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
WHERE SanPham.ten = N'Nồi đất'
  AND CongNhan.id IN
    (SELECT ThanhPham.congNhan_id
     FROM ThanhPham
     JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
     WHERE SanPham.ten = N'Bình gốm nhỏ');

-- 5) Thống kê Số luợng công nhân theo từng tổ sản xuất.
SELECT ToSanXuat.ten, COUNT(*) AS SoLuongCongNhan
FROM ToSanXuat
JOIN CongNhan ON CongNhan.toSX_id = ToSanXuat.id
GROUP BY ToSanXuat.id, ToSanXuat.ten
ORDER BY ToSanXuat.ten;

-- 6) Tổng số lượng thành phẩm theo từng loại mà mỗi nhân viên làm được 
-- (Ho, Ten, TenSP, TongSLThanhPham, TongThanhTien).
SELECT CONCAT(CongNhan.ho, ' ', CongNhan.ten) AS HoTen,
       SanPham.ten AS TenSP,
       SUM(soLuong) AS TongSLThanhPham,
       SUM(soLuong * tienCong) AS TongThanhTien
FROM CongNhan
JOIN ThanhPham ON CongNhan.id = ThanhPham.congNhan_id
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
GROUP BY CongNhan.id,
         CongNhan.ho,
         CongNhan.ten,
         SanPham.id,
         SanPham.ten;

-- 7) Tổng số tiền công đã trả cho công nhân trong tháng 1 năm 2007
SELECT SUM(soLuong * tienCong) AS TongTienCong
FROM ThanhPham
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
WHERE MONTH(ThanhPham.ngay) = 1 AND YEAR(ThanhPham.ngay) = 2007;

-- 8) Cho biết sản phẩm được sản xuất nhiều nhất trong tháng 2/2007
SELECT SanPham.ten,
       COUNT(*) AS SoLuongSX
FROM ThanhPham
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
WHERE MONTH(ThanhPham.ngay) = 2
  AND YEAR(ThanhPham.ngay) = 2007
GROUP BY SanPham.id,
         SanPham.ten
HAVING COUNT(*) >= ALL
  (SELECT COUNT(*)
   FROM ThanhPham
   JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
   WHERE MONTH(ThanhPham.ngay) = 2
     AND YEAR(ThanhPham.ngay) = 2007
   GROUP BY SanPham.id);

-- 9) Cho biết công nhân sản xuất được nhiều ‘Chén’ nhất.
SELECT CONCAT(CongNhan.ho, ' ', CongNhan.ten) AS HoTen,
       phai,
       SUM(soLuong) AS TongSanPham
FROM CongNhan
JOIN ThanhPham ON CongNhan.id = ThanhPham.congNhan_id
JOIN SanPham ON SanPham.id = ThanhPham.sanPham_id
WHERE SanPham.ten = N'Chén'
GROUP BY CongNhan.id,
         CongNhan.ho,
         CongNhan.ten,
         CongNhan.phai,
         SanPham.id
HAVING SUM(soLuong) >= ALL
  (SELECT SUM(soLuong)
   FROM SanPham
   JOIN ThanhPham ON SanPham.id = ThanhPham.sanPham_id
   WHERE SanPham.ten = N'Chén'
   GROUP BY ThanhPham.congNhan_id);

-- 10) Tiền công tháng 2/2007 của công nhân viên có mã số ‘CN002’
SELECT SUM(tienCong * soLuong) AS TongTienCong_CN002
FROM SanPham
JOIN ThanhPham ON SanPham.id = ThanhPham.sanPham_id
WHERE ThanhPham.congNhan_id = 'CN002'
  AND MONTH(ThanhPham.ngay) = 2
  AND YEAR(ThanhPham.ngay) = 2007;

-- 11) Liệt kê các công nhân có sản xuất từ 3 loại sản phẩm trở lên.
SELECT CONCAT(CongNhan.ho, ' ', CongNhan.ten) AS HoTen,
       phai,
	   COUNT (DISTINCT sanPham_id) AS SoLoaiSP
FROM CongNhan
JOIN ThanhPham ON CongNhan.id = ThanhPham.congNhan_id
GROUP BY CongNhan.id, CongNhan.ho, CongNhan.ten, CongNhan.phai
HAVING COUNT (DISTINCT sanPham_id) >= 3;

-- 12) Cập nhật giá tiền công của các loại bình gốm thêm 1000.
-- 13) Thêm bộ <’CN006’, ‘Lê Thị’, ‘Lan’, ‘Nữ’,’TS02’ > vào bảng CongNhan.
