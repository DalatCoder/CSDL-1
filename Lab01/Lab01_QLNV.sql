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
	tenCN VARCHAR(100)
);

CREATE TABLE NhanVien (
	id INT PRIMARY KEY,
	ho VARCHAR(100),
	ten VARCHAR(100),
	ngaySinh DATE,
	ngayVaoLam DATE,
	chiNhanh_id INT,
	FOREIGN KEY (chiNhanh_id) REFERENCES chiNhanh(id) ON DELETE CASCADE
);

CREATE TABLE KyNang (
	id INT PRIMARY KEY,
	tenKN VARCHAR(100)
);

CREATE TABLE NV_KN (
	id INT IDENTITY(1,1) PRIMARY KEY,
	mucDo INT,
	nhanVien_id INT,
	kyNang_id INT,
	FOREIGN KEY (nhanVien_id) REFERENCES NhanVien(id),
	FOREIGN KEY (kyNang_id) REFERENCES KyNang(id)
);

