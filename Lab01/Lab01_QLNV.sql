------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/ ------------------------------------------------

CREATE DATABASE Lab01_QuanLyNhanVien;

USE Lab01_QuanLyNhanVien;


CREATE TABLE ChiNhanh (id INT PRIMARY KEY,
                                      tenCN NVARCHAR(100) UNIQUE);


CREATE TABLE NhanVien
  (id INT PRIMARY KEY,
                  ho NVARCHAR(100),
                     ten NVARCHAR(100),
                         ngaySinh DATE, ngayVaoLam DATE, chiNhanh_id INT,
   FOREIGN KEY (chiNhanh_id) REFERENCES chiNhanh(id) ON DELETE CASCADE);


CREATE TABLE KyNang (id INT PRIMARY KEY,
                                    tenKN NVARCHAR(100) UNIQUE);


CREATE TABLE NV_KN (id INT IDENTITY(1, 1) PRIMARY KEY,
                                                  mucDo INT CHECK (mucDo >= 1
                                                                   AND mucDo <= 9), nhanVien_id INT, kyNang_id INT,
                    FOREIGN KEY (nhanVien_id) REFERENCES NhanVien(id),
                    FOREIGN KEY (kyNang_id) REFERENCES KyNang(id));


INSERT INTO ChiNhanh(id, tenCN)
VALUES(01, N'Quận 1');


INSERT INTO ChiNhanh(id, tenCN)
VALUES(02, N'Quận 5');


INSERT INTO ChiNhanh(id, tenCN)
VALUES(03, N'Bình Thạnh');


SELECT *
FROM ChiNhanh;


SET DATEFORMAT dmy;


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (1, N'Lê Văn', N'Minh', '10/06/1960', '02/05/1986', 1);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (2, N'Nguyễn Thị', N'Mai', '20/04/1970', '04/07/2001', 1);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (3, N'Lê Anh', N'Tuấn', '25/06/1975', '01/09/1982', 2);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (4, N'Vương Tuấn', N'Vũ', '25/03/1960', '12/01/1986', 2);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (5, N'Lý Anh', N'Hân', '01/12/1980', '15/05/2004', 2);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (6, N'Phan Lê', N'Tuấn', '04/06/1976', '25/10/2002', 3);


INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id)
VALUES (7, N'Lê Tuấn', N'Tú', '15/08/1975', '15/08/2000', 3);


SELECT *
FROM NhanVien;


INSERT INTO KyNang(id, tenKN)
VALUES (1, N'Word');


INSERT INTO KyNang(id, tenKN)
VALUES (2, N'Excel');


INSERT INTO KyNang(id, tenKN)
VALUES (3, N'Access');


INSERT INTO KyNang(id, tenKN)
VALUES (4, N'Power Point');


INSERT INTO KyNang(id, tenKN)
VALUES (5, N'SPSS');


SELECT *
FROM KyNang;


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (1, 01, 2);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (1, 02, 1);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (2, 01, 2);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (2, 03, 2);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (3, 02, 1);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (3, 03, 2);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (4, 01, 5);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (4, 02, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (4, 03, 1);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (5, 02, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (5, 04, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (6, 05, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (6, 02, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (6, 03, 2);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (7, 03, 4);


INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo)
VALUES (7, 04, 3);


SELECT *
FROM NV_KN;

EXEC sp_columns NhanVien;

-- Q1: Hiển thị MSNV, HoTen (Ho + Ten as HoTen), số năm làm việc (SoNamLamViec).

SELECT id,
       CONCAT(ho, ' ', ten) AS HoTen,
       YEAR(GETDATE()) - YEAR(ngayVaoLam) AS SoNamLamViec
FROM NhanVien;

-- Q2: Liệt kê các thông tin về nhân viên: HoTen, NgaySinh, NgayVaoLam, TenCN (sắp xếp theo tên chi nhánh).

SELECT CONCAT(ho, ' ', ten) AS HoTen,
       ngaySinh,
       ngayVaoLam,
       tenCN
FROM NhanVien
JOIN ChiNhanh ON ChiNhanh.id = NhanVien.chiNhanh_id
ORDER BY tenCN ASC;

-- Q3: Liệt kê các nhân viên (HoTen, TenKN, MucDo) của những nhân viên biết sử dụng ‘Word’.

SELECT CONCAT(ho, ' ', ten) AS HoTen,
       tenKN,
       mucDo
FROM NhanVien
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
WHERE tenKN = N'word'
ORDER BY mucDo DESC;

-- Q4: Liệt kê các kỹ năng (TenKN, MucDo) mà nhân viên ‘Lê Anh Tuấn’ biết sử dụng.

SELECT CONCAT(ho, ' ', ten) AS HoTen,
       tenKN,
       mucDo
FROM NhanVien
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
WHERE ho = N'Lê Anh'
  AND ten = N'Tuấn'
ORDER BY mucDo DESC;

-- TRUY VAN LONG
-- Q5: Liệt kê MANV, HoTen, MSCN, TenCN của các nhân viên có mức độ thành thạo về ‘Excel’ cao nhất trong công ty .

SELECT NhanVien.id AS MaNV,
       CONCAT(ho, ' ', ten) AS HoTen,
       ChiNhanh.id AS MaCN,
       tenCN
FROM NhanVien
JOIN ChiNhanh ON ChiNhanh.id = NhanVien.chiNhanh_id
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
WHERE tenKN = N'Excel'
  AND mucDo =
    (SELECT MAX(mucDo)
     FROM KyNang
     JOIN NV_KN ON KyNang.id = NV_KN.kyNang_id
     WHERE tenKN = N'Excel' )
ORDER BY tenCN ASC;

-- Q6: Liệt kê MANV, HoTen, TenCN của các nhân viên vừa biết ‘Word’ vừa biết ‘Excel’ (dùng truy vấn lồng).

SELECT NhanVien.id AS MaNV,
       CONCAT(ho, ' ', ten) AS HoTen,
       ChiNhanh.id AS MaCN,
       tenCN
FROM NhanVien
JOIN ChiNhanh ON ChiNhanh.id = NhanVien.chiNhanh_id
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
WHERE tenKN = N'Word'
  AND NhanVien.id IN
    (SELECT nhanVien_id
     FROM KyNang
     JOIN NV_KN ON KyNang.id = NV_KN.kyNang_id
     WHERE tenKN = N'Excel' )
ORDER BY tenCN ASC;

-- Q7: Với từng kỹ năng, hãy liệt kê các thông tin (MANV, HoTen, TenCN, TenKN, MucDo) của những nhân viên thành thạo kỹ năng đó nhất.

SELECT NhanVien.id AS MaNV,
       CONCAT(ho, ' ', ten) AS HoTen,
       tenCN,
       tenKN,
       mucDo
FROM NhanVien
JOIN ChiNhanh ON ChiNhanh.id = NhanVien.chiNhanh_id
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
WHERE mucDo =
    (SELECT MAX(mucDo)
     FROM NV_KN
     WHERE NV_KN.kyNang_id = KyNang.id )
ORDER BY tenCN;

-- Q8: Liệt kê các chi nhánh (MSCN, TenCN) mà mọi nhân viên trong chi nhánh đó đều biết ‘Word’.
SELECT ChiNhanh.id AS MSCN,
       tenCN
FROM ChiNhanh
JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
GROUP BY ChiNhanh.id,
         tenCN
HAVING COUNT(NhanVien.id) -
  (SELECT COUNT(*)
   FROM NhanVien
   JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
   JOIN KyNang ON KyNang.id = NV_KN.kyNang_id
   WHERE NhanVien.chiNhanh_id = ChiNhanh.id
     AND tenKN = N'Word' ) = 0;

-- Q9: Với mỗi chi nhánh, hãy cho biết các thông tin sau TenCN, SoNV (số nhân viên của chi nhánh đó).
SELECT tenCN,
       COUNT(NhanVien.id) AS SoLuong
FROM ChiNhanh
JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
GROUP BY ChiNhanh.id,
         tenCN;


-- Q10: Với mỗi kỹ năng, hãy cho biết TenKN, SoNguoiDung (số nhân viên biết sử dụng kỹ năng đó).
SELECT tenKN,
       count(nhanVien_id) AS SoLuong
FROM KyNang
JOIN NV_KN ON KyNang.id = NV_KN.kyNang_id
GROUP BY KyNang.id,
         tenKN
ORDER BY tenKN ASC;

-- Q11: Cho biết TenKN có từ 3 nhân viên trong công ty sử dụng trở lên. 
SELECT tenKN,
       count(nhanVien_id) AS SoLuong
FROM KyNang
JOIN NV_KN ON KyNang.id = NV_KN.kyNang_id
GROUP BY KyNang.id,
         tenKN
HAVING count(nhanVien_id) >= 3
ORDER BY tenKN ASC;

-- Q12: Cho biết TenCN có nhiều nhân viên nhất. 
SELECT tenCN,
       COUNT(NhanVien.id) AS SoLuong
FROM ChiNhanh
JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
GROUP BY ChiNhanh.id,
         tenCN
HAVING COUNT(NhanVien.id) >= ALL
  (SELECT COUNT(NhanVien.id)
   FROM ChiNhanh
   JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
   GROUP BY ChiNhanh.id);

-- Q13: Cho biết TenCN có ít nhân viên nhất. 
SELECT tenCN,
       COUNT(NhanVien.id) AS SoLuong
FROM ChiNhanh
JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
GROUP BY ChiNhanh.id,
         tenCN
HAVING COUNT(NhanVien.id) <= ALL
  (SELECT COUNT(NhanVien.id)
   FROM ChiNhanh
   JOIN NhanVien ON ChiNhanh.id = NhanVien.chiNhanh_id
   GROUP BY ChiNhanh.id);

-- Q14: Với mỗi nhân viên, hãy cho biết số kỹ năng tin học mà nhân viên đó sử dụng được.
SELECT CONCAT(ho, ' ', ten) AS HoTen,
       COUNT(kyNang_id) AS SoLuongKyNang
FROM NhanVien
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
GROUP BY NhanVien.id,
         ho,
         ten
ORDER BY SoLuongKyNang DESC;

-- Q15: Cho biết HoTen, TenCN của nhân viên biết sử dụng nhiều kỹ năng nhất. 
SELECT CONCAT(ho, ' ', ten) AS HoTen,
       COUNT(kyNang_id) AS SoLuongKyNang
FROM NhanVien
JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
GROUP BY NhanVien.id,
         ho,
         ten
HAVING COUNT(kyNang_id) >= ALL
  (SELECT COUNT(kyNang_id)
   FROM NhanVien
   JOIN NV_KN ON NhanVien.id = NV_KN.nhanVien_id
   GROUP BY NhanVien.id)
ORDER BY ten ASC;
