------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 19/04/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab03_QuanLyNhapXuatHangHoa;
USE Lab03_QuanLyNhapXuatHangHoa;

CREATE TABLE HangHoa
(
	id CHAR(5) PRIMARY KEY,
	ten NVARCHAR(100),
	dvt NVARCHAR(30),
	soLuongTon INT
);

CREATE TABLE DoiTac
(
	id CHAR(5) PRIMARY KEY,
	ten NVARCHAR(100),
	diaChi NVARCHAR(100),
	dienThoai NVARCHAR(100)
);

CREATE TABLE KhaNang_CC
(
	hangHoa_id CHAR(5),
	doiTac_id CHAR(5),
	FOREIGN KEY (hangHoa_id) REFERENCES HangHoa(id),
	FOREIGN KEY (doiTac_id) REFERENCES DoiTac(id),
	PRIMARY KEY (hangHoa_id, doiTac_id)
);

CREATE TABLE HoaDon
(
	id CHAR(5) PRIMARY KEY,
	ngayLap DATE,
	doiTac_id CHAR(5),
	tongTG FLOAT,
	FOREIGN KEY (doiTac_id) REFERENCES DoiTac(id) ON DELETE CASCADE
);

CREATE TABLE CT_HoaDon
(
	hoaDon_id CHAR(5),
	hangHoa_id CHAR(5),
	donGia INT,
	soLuong INT,
	FOREIGN KEY (hoaDon_id) REFERENCES HoaDon(id),
	FOREIGN KEY (hangHoa_id) REFERENCES HangHoa(id),
	PRIMARY KEY (hoaDon_id, hangHoa_id)
);

INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('CPU01', 'CPU INTEL,CELERON 600 BOX', 'CÁI', 5);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('CPU02', 'CPU INTEL,PIII 700', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('CPU03', 'CPU AMD K7 ATHL,ON 600', 'CÁI', 8);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('HDD01', 'HDD 10.2 GB QUANTUM', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('HDD02', 'HDD 13.6 GB SEAGATE', 'CÁI', 15);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('HDD03', 'HDD 20 GB QUANTUM', 'CÁI', 6);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('KB01', 'KB GENIUS', 'CÁI', 12);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('KB02', 'KB MITSUMIMI', 'CÁI', 5);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MB01', 'GIGABYTE CHIPSET INTEL', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MB02', 'ACOPR BX CHIPSET VIA', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MB03', 'INTEL PHI CHIPSET INTEL', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MB04', 'ECS CHIPSET SIS', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MB05', 'ECS CHIPSET VIA', 'CÁI', 10);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MNT01', 'SAMSUNG 14" SYNCMASTER', 'CÁI', 5);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MNT02', 'LG 14"', 'CÁI', 5);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MNT03', 'ACER 14"', 'CÁI', 8);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MNT04', 'PHILIPS 14"', 'CÁI', 6);
INSERT INTO HangHoa(id, ten, dvt, soLuongTon) VALUES ('MNT05', 'VIEWSONIC 14"', 'CÁI', 7);
SELECT * FROM HangHoa;

INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('CC001', N'Cty TNC', N'176 BTX Q1 - TPHCM', '08.8250259');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('CC002', N'Cty Hoàng Long', N'15A TTT Q1 – TP. HCM', '08.8250898');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('CC003', N'Cty Hợp Nhất', N'152 BTX Q1 – TP.HCM', '08.8252376');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('K0001', N'Nguyễn Minh Hải', N'91 Nguyễn Văn Trỗi Tp. Đà Lạt', '063.831129');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('K0002', N'Như Quỳnh', N'21 Điện Biên Phủ. N.Trang', '058.590270');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('K0003', N'Trần nhật Duật', N'Lê Lợi TP. Huế', '054.848376');
INSERT INTO DoiTac(id, ten, diaChi, dienThoai) VALUES ('K0004', N'Phan Nguyễn Hùng Anh', N'11 Nam Kỳ Khởi nghĩa- TP. Đà lạt', '063.823409');
SELECT * FROM DoiTac;

SET DATEFORMAT dmy;
INSERT INTO HoaDon(id, ngayLap, doiTac_id) VALUES('N0001', '25/01/2006', 'CC001');
INSERT INTO HoaDon(id, ngayLap, doiTac_id) VALUES('N0002', '01/05/2006', 'CC002');
INSERT INTO HoaDon(id, ngayLap, doiTac_id) VALUES('X0001', '12/05/2006', 'K0001');
INSERT INTO HoaDon(id, ngayLap, doiTac_id) VALUES('X0002', '16/06/2006', 'K0002');
INSERT INTO HoaDon(id, ngayLap, doiTac_id) VALUES('X0003', '20/04/2006', 'K0001');
SELECT * FROM HoaDon;

INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'CPU01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'HDD03');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'KB01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'MB02');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'MB04');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC001', 'MNT01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'CPU01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'CPU02');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'CPU03');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'KB02');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'MB01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'MB05');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC002', 'MNT03');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC003', 'HDD01');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC003', 'HDD02');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC003', 'HDD03');
INSERT INTO KhaNang_CC(doiTac_id, hangHoa_id) VALUES ('CC003', 'MB03');
SELECT * FROM KhaNang_CC;

INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0001', 'CPU01', 63, 10);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0001', 'HDD03', 97, 7);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0001', 'KB01', 3, 5);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0001', 'MB02', 57, 5);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0001', 'MNT01', 112, 3);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0002', 'CPU02', 115, 3);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0002', 'KB02', 5, 7);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('N0002', 'MNT03', 111, 5);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0001', 'CPU01', 67, 2);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0001', 'HDD03', 100, 2);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0001', 'KB01', 5, 2);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0001', 'MB02', 62, 1);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0002', 'CPU01', 67, 1);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0002', 'KB02', 7, 3);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0002', 'MNT01', 115, 2);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0003', 'CPU01', 67, 1);
INSERT INTO CT_HoaDon(hoaDon_id, hangHoa_id, donGia, soLuong) VALUES ('X0003', 'MNT03', 115, 2);
SELECT * FROM CT_HoaDon;