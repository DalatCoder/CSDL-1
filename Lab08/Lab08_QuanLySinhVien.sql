------------------------------------------------
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

