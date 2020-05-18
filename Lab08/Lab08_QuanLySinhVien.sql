﻿------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 18/05/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

drop database Lab08_QuanLySinhVien;

CREATE DATABASE Lab08_QuanLySinhVien;
USE Lab08_QuanLySinhVien;

CREATE TABLE Khoa 
(
	id CHAR(2) PRIMARY KEY,
	ten NVARCHAR(50),
	vietTat NVARCHAR(10)
);

CREATE TABLE Lop
(
	id CHAR(4) PRIMARY KEY,
	ten VARCHAR(50),
	khoa_id CHAR(2) REFERENCES Khoa(id) ON DELETE CASCADE,
	nienKhoa INT
);

CREATE TABLE Tinh
(
	id CHAR(2) PRIMARY KEY,
	ten VARCHAR(30)
);

CREATE TABLE MonHoc
(
	id CHAR(4) PRIMARY KEY,
	ten VARCHAR(50),
	heSo INT
);

CREATE TABLE SinhVien
(
	id CHAR(7) PRIMARY KEY,
	ho VARCHAR(50),
	ten VARCHAR(30),
	ngaySinh DATE,
	tinh_id CHAR(2) REFERENCES Tinh(id) ON DELETE CASCADE,
	ngayNhapHoc DATE,
	lop_id CHAR(4) REFERENCES Lop(id),
	phai VARCHAR(5),
	diaChi VARCHAR(100),
	dienThoai VARCHAR(13) 
);

CREATE TABLE BangDiem
(
	sinhVien_id CHAR(7),
	monHoc_id CHAR(4),
	lanThi INT,
	diem FLOAT CHECK(diem BETWEEN 0 AND 10),
	FOREIGN KEY (sinhVien_id) REFERENCES SinhVien(id),
	FOREIGN KEY (monHoc_id) REFERENCES MonHoc(id),
	PRIMARY KEY (sinhVien_id, monHoc_id, lanThi)
);

INSERT INTO Khoa(id, ten, vietTat) VALUES ('01', N'Công nghệ thông tin', 'CNTT');
INSERT INTO Khoa(id, ten, vietTat) VALUES ('02', N'Điện tử viễn thông', 'DTVT');
INSERT INTO Khoa(id, ten, vietTat) VALUES ('03', N'Quản trị kinh doanh', 'QTKD');
INSERT INTO Khoa(id, ten, vietTat) VALUES ('04', N'Công nghệ sinh học', 'CNSH');
SELECT * FROM Khoa;

INSERT INTO Lop(id, ten, khoa_id, nienKhoa) VALUES ('98TH', 'Tin hoc khoa 1998', '01', 1998);
INSERT INTO Lop(id, ten, khoa_id, nienKhoa) VALUES ('98VT', 'Vien thong khoa 1998', '02', 1998);
INSERT INTO Lop(id, ten, khoa_id, nienKhoa) VALUES ('99TH', 'Tin hoc khoa 1999', '01', 1999);
INSERT INTO Lop(id, ten, khoa_id, nienKhoa) VALUES ('99VT', 'Vien thong khoa 1999', '02', 1999);
INSERT INTO Lop(id, ten, khoa_id, nienKhoa) VALUES ('99QT', 'Quan tri khoa 1999', '03', 1999);
SELECT * FROM Lop;

INSERT INTO Tinh(id, ten) VALUES ('01', 'An Giang');
INSERT INTO Tinh(id, ten) VALUES ('02', 'TPHCM');
INSERT INTO Tinh(id, ten) VALUES ('03', 'Dong Nai');
INSERT INTO Tinh(id, ten) VALUES ('04', 'Long An');
INSERT INTO Tinh(id, ten) VALUES ('05', 'Hue QA01');
INSERT INTO Tinh(id, ten) VALUES ('06', 'Ca Mau');
SELECT * FROM Tinh;

INSERT INTO MonHoc(id, ten, heSo) VALUES ('TA01', 'Nhap mon tin hoc', 2);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('TA02', 'Lap trinh co ban', 3);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('TB01', 'Cau truc du lieu', 2);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('TB02', 'Co so du lieu', 2);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('QA01', 'Kinh te vi mo', 2);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('QA02', 'Quan tri chat luong', 3);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('VA01', 'Dien tu co ban', 2);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('VA02', 'Mach so', 3);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('VB01', 'Truyen so lieu', 3);
INSERT INTO MonHoc(id, ten, heSo) VALUES ('XA01', 'Vat ly dai cuong', 2);
SELECT * FROM MonHoc;

SET DATEFORMAT dmy;
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('98TH001', 'Nguyen Van', 'An', '06/08/80', '01', '03/09/98', '98TH', 'Yes', '12 Tran Hung Dao, Q.1', '8234512');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('98TH002', 'Le Thi', 'An', '17/10/79', '01', '03/09/98', '98TH', 'No', '23 CMT8, Q. Tan Binh', '0303234342');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('98VT001', 'Nguyen Duc', 'Binh', '25/11/81', '02', '03/09/98', '98VT', 'Yes', '245 Lac Long Quan, Q.11', '8654323');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('98VT002', 'Tran Ngoc', 'Anh', '19/08/80', '02', '03/09/98', '98VT', 'No', '242 Tran Hung Dao, Q.1', NULL);
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99TH001', 'Ly Van Hung', 'Dung', '27/09/81', '03', '05/10/99', '99TH', 'Yes', '178 CMT8, Q. Tan Binh', '7563213');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99TH002', 'Van Minh', 'Hoang', '01/01/81', '04', '05/10/99', '99TH', 'Yes', '272 Ly Thuong Kiet, Q.10', '8341234');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99TH003', 'Nguyen', 'Tuan', '12/01/80', '03', '05/10/99', '99TH', 'Yes', '162 Tran Hung Dao, Q.5', NULL);
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99TH004', 'Tran Van', 'Minh', '25/06/81', '04', '05/10/99', '99TH', 'Yes', '147 Dien Bien Phu, Q.3', '7236754');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99TH005', 'Nguyen Thai', 'Minh', '01/01/80', '04', '05/10/99', '99TH', 'Yes', '345 Le Dai Hanh, Q.11', NULL);
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99VT001', 'Le Ngoc', 'Mai', '21/06/82', '01', '05/10/99', '99VT', 'No', '129 Tran Hung Dao, Q.1', '0903124534');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99QT001', 'Nguyen Thi', 'Oanh', '19/08/73', '04', '05/10/99', '99QT', 'No', '76 Hung Vuong, Q.5', '0901656324');
INSERT INTO SinhVien(id, ho, ten, ngaySinh, tinh_id, ngayNhapHoc, lop_id, phai, diaChi, dienThoai)
VALUES ('99QT002', 'Le My', 'Hanh', '20/05/76', '04', '05/10/99', '99QT', 'No', '12 Pham Ngoc Thach, Q.3', NULL);
SELECT * FROM SinhVien;

INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH001', 'TA01', 1, 8.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH001', 'TA02', 1, 8);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH002', 'TA01', 1, 4);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH002', 'TA01', 2, 5.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH001', 'TB01', 1, 7.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98TH002', 'TB01', 1, 8);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98VT001', 'VA01', 1, 4);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98VT001', 'VA01', 2, 5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('98VT002', 'VA02', 1, 7.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH001', 'TA01', 1, 4);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH001', 'TA01', 2, 6);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH001', 'TB01', 1, 6.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH002', 'TB01', 1, 10);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH002', 'TB02', 1, 9);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH003', 'TA02', 1, 7.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH003', 'TB01', 1, 3);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH003', 'TB01', 2, 6);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH003', 'TB02', 1, 8);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH004', 'TB02', 1, 2);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH004', 'TB02', 2, 4);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99TH004', 'TB02', 3, 3);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99QT001', 'QA01', 1, 7);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99QT001', 'QA02', 1, 6.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99QT002', 'QA01', 1, 8.5);
INSERT INTO BangDiem(sinhVien_id, monHoc_id, lanThi, diem) VALUES ('99QT002', 'QA02', 1, 9);
SELECT * FROM BangDiem;

-- 1) Liệt kê MSSV, Họ, Tên, Địa chỉ của tất cả các sinh viên
SELECT id AS MSSV, CONCAT(ho, ' ', ten) AS HoTen, diaChi
FROM SinhVien;

-- 2) Liệt kê MSSV, Họ, Tên, MS Tỉnh của tất cả các sinh viên. 
-- Sắp xếp kết quả theo MS tỉnh, trong cùng tỉnh sắp xếp theo họ tên của sinh viên.
SELECT id AS MSSV, CONCAT(ho, ' ', ten) AS HoTen, diaChi, tinh_id AS MS_Tinh
FROM SinhVien
ORDER BY MS_Tinh, ten, ho ASC;

-- 3) Liệt kê các sinh viên nữ của tỉnh Long An
SELECT *
FROM SinhVien
JOIN Tinh ON SinhVien.tinh_id = Tinh.id
WHERE phai = 'No' AND Tinh.ten = 'Long An';

-- 4) Liệt kê các sinh viên có sinh nhật trong tháng giêng.
SELECT *
FROM SinhVien
WHERE MONTH(ngaySinh) = 1;

-- 5) Liệt kê các sinh viên có sinh nhật nhằm ngày 1/1.
SELECT *
FROM SinhVien
WHERE MONTH(ngaySinh) = 1 AND DAY(ngaySinh) = 1;

-- 6) Liệt kê các sinh viên có số điện thoại.
SELECT *
FROM SinhVien
WHERE dienThoai IS NOT NULL;

-- 7) Liệt kê các sinh viên có số điện thoại di động.
SELECT *
FROM SinhVien
WHERE DATALENGTH(dienThoai) = 10;

-- 8) Liệt kê các sinh viên tên ‘Minh’ học lớp ’99TH’
SELECT *
FROM SinhVien
WHERE ten = 'Minh' AND lop_id = '99TH';

-- 9) Liệt kê các sinh viên có địa chỉ ở đường ‘Tran Hung Dao’
SELECT *
FROM SinhVien
WHERE diaChi LIKE '%Tran Hung Dao%';

-- 10) Liệt kê các sinh viên có tên lót chữ ‘Van’ (không liệt kê người họ ‘Van’)
SELECT *
FROM SinhVien
WHERE ho LIKE '% Van%';

-- 11) Liệt kê MSSV, Họ Ten (ghép họ và tên thành một cột), Tuổi của các sinh viên ở tỉnh Long An.
SELECT SinhVien.id AS MSSV,
       CONCAT(ho, ' ', SinhVien.ten) AS HoTen,
       YEAR(GETDATE()) - YEAR(ngaySinh) AS Tuoi,
       tinh.ten AS Tinh
FROM SinhVien
JOIN Tinh ON SinhVien.tinh_id = Tinh.id
WHERE Tinh.ten = 'Long An';

-- 12) Liệt kê các sinh viên nam từ 23 đến 28 tuổi.
SELECT SinhVien.id AS MSSV,
       CONCAT(ho, ' ', SinhVien.ten) AS HoTen,
       YEAR(GETDATE()) - YEAR(ngaySinh) AS Tuoi
FROM SinhVien
WHERE phai = 'Yes'
  AND YEAR(GETDATE()) - YEAR(ngaySinh) BETWEEN 23 AND 28;

-- 13) Liệt kê các sinh viên nam từ 32 tuổi trở lên và các sinh viên nữ từ 27 tuổi trở lên.
SELECT SinhVien.id AS MSSV,
       CONCAT(ho, ' ', SinhVien.ten) AS HoTen,
       YEAR(GETDATE()) - YEAR(ngaySinh) AS Tuoi
FROM SinhVien
WHERE (phai = 'Yes'
       AND YEAR(GETDATE()) - YEAR(ngaySinh) >= 32)
  OR (phai = 'No'
      AND YEAR(GETDATE()) - YEAR(ngaySinh) >= 27);

-- 14) Liệt kê các sinh viên khi nhập học còn dưới 18 tuổi, hoặc đã trên 25 tuổi.
SELECT SinhVien.id AS MSSV,
       CONCAT(ho, ' ', SinhVien.ten) AS HoTen,
       YEAR(GETDATE()) - YEAR(ngaySinh) AS Tuoi
FROM SinhVien
WHERE (YEAR(ngayNhapHoc) - YEAR(ngaySinh) < 18)
  OR (YEAR(ngayNhapHoc) - YEAR(ngaySinh) > 25);

-- 15) Liệt kê danh sách các sinh viên của khóa 99 (MSSV có 2 ký tự đầu là ‘99’).
SELECT *
FROM SinhVien
WHERE id LIKE '99%';

-- 16) Liệt kê MSSV, Điểm thi lần 1 môn ‘Co so du lieu’ của lớp ’99TH’
SELECT SinhVien.id AS MSSV,
       diem,
       lanThi,
       MonHoc.ten
FROM SinhVien
JOIN BangDiem ON SinhVien.id = BangDiem.sinhVien_id
JOIN MonHoc ON MonHoc.id = BangDiem.monHoc_id
WHERE lanThi = 1
  AND MonHoc.ten = 'Co so du lieu'
  AND SinhVien.lop_id = '99TH'

-- 17) Liệt kê MSSV, Họ tên của các sinh viên lớp ’99TH’ thi không đạt lần 1 môn ‘Co so du lieu’
SELECT SinhVien.id AS MSSV,
       diem,
       lanThi,
       MonHoc.ten
FROM SinhVien
JOIN BangDiem ON SinhVien.id = BangDiem.sinhVien_id
JOIN MonHoc ON MonHoc.id = BangDiem.monHoc_id
WHERE lanThi = 1
  AND MonHoc.ten = 'Co so du lieu'
  AND SinhVien.lop_id = '99TH'
  AND diem < 4

-- 18) Liệt kê tất cả các điểm thi của sinh viên có mã số ’99TH001’ theo mẫu sau:
SELECT MonHoc.id AS MSMH, MonHoc.ten AS N'Tên MH', lanThi AS N'Lần thi', diem AS N'Điểm'
FROM SinhVien
JOIN BangDiem ON SinhVien.id = BangDiem.sinhVien_id
JOIN MonHoc ON MonHoc.id = BangDiem.monHoc_id
WHERE SinhVien.id = '99TH001';

-- 19) Liệt kê MSSV, họ tên, MSLop của các sinh viên có điểm thi lần 1 môn 
-- ‘Co so du lieu’ từ 8 điểm trở lên
SELECT SinhVien.id AS MSSV,
       CONCAT(ho, ' ', SinhVien.ten) AS HoTen,
       SinhVien.lop_id AS MSKLop
FROM SinhVien
JOIN BangDiem ON SinhVien.id = BangDiem.sinhVien_id
JOIN MonHoc ON MonHoc.id = BangDiem.monHoc_id
WHERE lanThi = 1
  AND MonHoc.ten = 'Co so du lieu'
  AND diem >= 8


-- 20) Liệt kê các tỉnh không có sinh viên theo học
SELECT *
FROM Tinh
WHERE id NOT IN
    (SELECT DISTINCT tinh_id
     FROM SinhVien);

-- 21) Liệt kê các sinh viên hiện chưa có điểm môn thi nào.
SELECT *
FROM SinhVien
WHERE id NOT IN
    (SELECT DISTINCT sinhVien_id
     FROM BangDiem);

-- 22) Thống kê số lượng sinh viên ở mỗi lớp theo mẫu sau: MSLop, TenLop, SoLuongSV
SELECT Lop.id, Lop.ten, COUNT(*) AS SoLuongSV
FROM SinhVien
JOIN Lop ON Lop.id = SinhVien.lop_id
GROUP BY Lop.id, Lop.ten
ORDER BY SoLuongSV;

-- 23) Thống kê số lượng sinh viên ở mỗi tỉnh theo mẫu sau:
SELECT tinh.id    AS MaTinh, 
       tinh.ten   AS TenTinh, 
       Count(CASE phai 
               WHEN 'Yes' THEN 1 
               ELSE NULL 
             END) AS N'Số SV Nam', 
       Count(CASE phai 
               WHEN 'No' THEN 1 
               ELSE NULL 
             END) AS N'Số SV Nữ', 
       Count(*)   AS N'Tổng cộng' 
FROM   sinhvien 
       JOIN tinh 
         ON sinhvien.tinh_id = tinh.id 
GROUP  BY tinh.id, 
          tinh.ten; 

-- 24) Thống kê kết quả thi lần 1 môn ‘Co so du lieu’ ở các lớp, theo mẫu sau
SELECT lop.id AS 'MaLop',
       lop.ten AS 'TenLop', 
       Count(CASE 
               WHEN diem >= 4 THEN 1 
               ELSE NULL 
             END)                      AS N'Số SV đạt', 
       ( Count(CASE 
                 WHEN diem >= 4 THEN 1 
                 ELSE NULL 
               END) * 100 / Count(*) ) AS N'Tỉ lệ đạt (%)', 
       Count(CASE 
               WHEN diem < 4 THEN 1 
               ELSE NULL 
             END)                      AS N'Số SV không đạt', 
       ( Count(CASE 
                 WHEN diem < 4 THEN 1 
                 ELSE NULL 
               END) * 100 / Count(*) ) AS N'Tỉ lệ không đạt (%)', 
       Count(*)                        AS TongSo 
FROM   bangdiem 
       JOIN monhoc 
         ON bangdiem.monhoc_id = monhoc.id 
       JOIN sinhvien 
         ON sinhvien.id = bangdiem.sinhvien_id 
       JOIN lop 
         ON sinhvien.lop_id = lop.id 
WHERE  lanthi = 1 
       AND monhoc.ten = 'Co so du lieu' 
GROUP  BY lop.id, 
          lop.ten; 

-- 25) Lọc ra điểm cao nhất trong các lần thi cho các sinh viên theo mẫu sau (điểm in ra của
-- mỗi môn là điểm cao nhất trong các lần thi của môn đó):
SELECT A.lanthi, 
       A.sinhvien_id        AS 'MSSV', 
       monhoc.id            AS 'MSMH', 
       monhoc.ten           AS N'Tên MH ', 
       monhoc.heso          AS N'Hệ số', 
       A.diem               AS N'Điểm', 
       A.diem * monhoc.heso AS 'KetQua' 
FROM   bangdiem A 
       JOIN monhoc 
         ON monhoc.id = A.monhoc_id 
WHERE  diem = (SELECT Max(diem) 
               FROM   bangdiem 
               WHERE  lanthi = A.lanthi)
ORDER BY A.lanThi ASC;

-- 26) Lập bảng tổng kết theo mẫu
SELECT SinhVien.id AS 'MSSV',
       CONCAT(SinhVien.ho, ' ', SinhVien.ten) AS 'HoTen',
       ROUND(SUM(diem * heSo) / SUM(heSo), 1) AS 'DTB'
FROM BangDiem
JOIN SinhVien ON SinhVien.id = BangDiem.sinhVien_id
JOIN MonHoc ON MonHoc.id = BangDiem.monHoc_id
GROUP BY SinhVien.id,
         SinhVien.ho,
         SinhVien.ten;

