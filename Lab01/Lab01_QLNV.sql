------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab01_QuanLyNhanVien;
USE Lab01_QuanLyNhanVien;

CREATE TABLE ChiNhanh (
	id INT PRIMARY KEY,
	tenCN NVARCHAR(100) UNIQUE
);

CREATE TABLE NhanVien (
	id INT PRIMARY KEY,
	ho NVARCHAR(100),
	ten NVARCHAR(100),
	ngaySinh DATE,
	ngayVaoLam DATE,
	chiNhanh_id INT,
	FOREIGN KEY (chiNhanh_id) REFERENCES chiNhanh(id) ON DELETE CASCADE
);

CREATE TABLE KyNang (
	id INT PRIMARY KEY,
	tenKN NVARCHAR(100) UNIQUE
);

CREATE TABLE NV_KN (
	id INT IDENTITY(1,1) PRIMARY KEY,
	mucDo INT CHECK (mucDo >= 1 AND mucDo <= 9),
	nhanVien_id INT,
	kyNang_id INT,
	FOREIGN KEY (nhanVien_id) REFERENCES NhanVien(id),
	FOREIGN KEY (kyNang_id) REFERENCES KyNang(id)
);

INSERT INTO ChiNhanh(id, tenCN) VALUES(01, N'Quận 1');
INSERT INTO ChiNhanh(id, tenCN) VALUES(02, N'Quận 5');
INSERT INTO ChiNhanh(id, tenCN) VALUES(03, N'Bình Thạnh');
SELECT * FROM ChiNhanh;

SET DATEFORMAT dmy;
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (1, N'Lê Văn', 'Minh', '10/06/1960', '02/05/1986', 1);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (2, N'Nguyễn Thị', 'Mai', '20/04/1970', '04/07/2001', 1);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (3, N'Lê Anh', 'Tuấn', '25/06/1975', '01/09/1982', 2);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (4, N'Vương Tuấn', 'Vũ', '25/03/1960', '12/01/1986', 2);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (5, N'Lý Anh', 'Hân', '01/12/1980', '15/05/2004', 2);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (6, N'Phan Lê', 'Tuấn', '04/06/1976', '25/10/2002', 3);
INSERT INTO NhanVien(id, ho, ten, ngaySinh, ngayVaoLam, chiNhanh_id) VALUES (7, N'Lê Tuấn', 'Tú', '15/08/1975', '15/08/2000', 3);
SELECT * FROM NhanVien;

INSERT INTO KyNang(id, tenKN) VALUES (1, N'Word');
INSERT INTO KyNang(id, tenKN) VALUES (2, N'Excel');
INSERT INTO KyNang(id, tenKN) VALUES (3, N'Access');
INSERT INTO KyNang(id, tenKN) VALUES (4, N'Power Point');
INSERT INTO KyNang(id, tenKN) VALUES (5, N'SPSS');
SELECT * FROM KyNang;

INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (1, 01, 2);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (1, 02, 1);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (2, 01, 2);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (2, 03, 2);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (3, 02, 1);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (3, 03, 2);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (4, 01, 5);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (4, 02, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (4, 03, 1);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (5, 02, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (5, 04, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (6, 05, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (6, 02, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (6, 03, 2);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (7, 03, 4);
INSERT INTO NV_KN(nhanVien_id, kyNang_id, mucDo) VALUES (7, 04, 3);
SELECT * FROM NV_KN;



