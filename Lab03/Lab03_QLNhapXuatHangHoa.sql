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

-- 1) Liệt kê các mặt hàng thuộc loại đĩa cứng.
SELECT *
FROM HangHoa
WHERE id LIKE 'HDD%';

-- 2) Liệt kê các mặt hàng có số lượng tồn trên 10.
SELECT *
FROM HangHoa
WHERE soLuongTon > 10;

-- 3) Cho biết thông tin về các nhà cung cấp ở Thành phố Hồ Chí Minh
SELECT *
FROM DoiTac
WHERE diaChi LIKE '%HCM%';

-- 4) Liệt kê các hóa đơn nhập hàng trong tháng 5/2006, thông tin hiển thị gồm: 
-- sohd; ngaylaphd; tên, địa chỉ, và điện thoại của nhà cung cấp; số mặt hàng
SELECT HoaDon.id AS SoHD, ngayLap, DoiTac.ten, DoiTac.diaChi, DoiTac.dienThoai, soLuong
FROM HoaDon
JOIN DoiTac ON HoaDon.doiTac_id = DoiTac.id
JOIN CT_HoaDon ON CT_HoaDon.hoaDon_id = HoaDon.id
WHERE HoaDon.id LIKE 'N%' AND MONTH(ngayLap) = 5 AND YEAR(ngayLap) = 2006;

-- 5) Cho biết tên các nhà cung cấp có cung cấp đĩa cứng.
SELECT hangHoa_id AS MaHH, DoiTac.ten, DoiTac.diaChi, DoiTac.dienThoai
FROM KhaNang_CC
JOIN DoiTac ON KhaNang_CC.doiTac_id = DoiTac.id
WHERE hangHoa_id LIKE 'HDD%';

-- 6) Cho biết tên các nhà cung cấp có thể cung cấp tất cả các loại đĩa cứng.
SELECT DoiTac.ten,
       DoiTac.diaChi,
       DoiTac.dienThoai,
       COUNT(*) AS SoLoaiDiaCung
FROM KhaNang_CC
JOIN DoiTac ON KhaNang_CC.doiTac_id = DoiTac.id
WHERE hangHoa_id LIKE 'HDD%'
GROUP BY DoiTac.id,
         ten,
         diaChi,
         dienThoai
HAVING COUNT(*) =
  (SELECT COUNT(*)
   FROM HangHoa
   WHERE id LIKE 'HDD%');

-- 7) Cho biết tên nhà cung cấp không cung cấp đĩa cứng.
SELECT DISTINCT DoiTac.ten,
       DoiTac.diaChi,
       DoiTac.dienThoai
FROM KhaNang_CC
JOIN DoiTac ON KhaNang_CC.doiTac_id = DoiTac.id
AND DoiTac.id NOT IN
  (SELECT doiTac_id
   FROM KhaNang_CC
   WHERE hangHoa_id LIKE 'HDD%');

-- 8) Cho biết thông tin của mặt chưa bán được.
SELECT *
FROM HangHoa
WHERE HangHoa.id NOT IN
    (SELECT DISTINCT hangHoa_id
     FROM HoaDon
     JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
     WHERE HoaDon.id LIKE 'X%');

-- 9) Cho biết tên và tổng số lượng bán của mặt hàng bán chạy nhất (tính theo số lượng).
SELECT HangHoa.id AS MaHH,
       HangHoa.ten,
       SUM(soLuong) AS SoLuongBan
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN HangHoa ON CT_HoaDon.hangHoa_id = HangHoa.id
WHERE HoaDon.id LIKE 'X%'
GROUP BY HangHoa.id,
         HangHoa.ten
HAVING SUM(soLuong) >= ALL
  (SELECT SUM(soLuong)
   FROM HoaDon
   JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
   WHERE HoaDon.id LIKE 'X%'
   GROUP BY CT_HoaDon.hangHoa_id);

-- 10) Cho biết tên và tổng số lượng của mặt hàng nhập về ít nhất.
SELECT HangHoa.id AS MaHH,
       HangHoa.ten,
       SUM(soLuong) AS SoLuongNhap
FROM CT_HoaDon
JOIN HangHoa ON CT_HoaDon.hangHoa_id = HangHoa.id
WHERE hoaDon_id LIKE 'N%'
GROUP BY HangHoa.id,
         HangHoa.ten
HAVING SUM(soLuong) <= ALL
  (SELECT SUM(soLuong)
   FROM CT_HoaDon
   WHERE hoaDon_id LIKE 'N%'
   GROUP BY hangHoa_id);

-- 11) Cho biết hóa đơn nhập nhiều mặt hàng nhất.
SELECT HoaDon.id AS MaHD,
       ngayLap,
       DoiTac.ten,
       COUNT(*) AS SoLuongMatHang
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN DoiTac ON HoaDon.doiTac_id = DoiTac.id
WHERE HoaDon.id LIKE 'N%'
GROUP BY HoaDon.id,
         ngayLap,
         DoiTac.ten
HAVING COUNT(*) >= ALL
  (SELECT COUNT(*)
   FROM HoaDon
   JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
   WHERE HoaDon.id LIKE 'N%'
   GROUP BY HoaDon.id);

-- 12) Cho biết các mặt hàng không được nhập hàng trong tháng 1/2006
SELECT id AS MaHH,
       ten,
       dvt,
       soLuongTon
FROM HangHoa
WHERE id NOT IN
    (SELECT DISTINCT hangHoa_id
     FROM HoaDon
     JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
     WHERE HoaDon.id LIKE 'N%'
       AND MONTH(ngayLap) = 1
       AND YEAR(ngayLap) = 2006 );

-- 13) Cho biết tên các mặt hàng không bán được trong tháng 6/2006
SELECT id AS MaHH,
       ten,
       dvt,
       soLuongTon
FROM HangHoa
WHERE id NOT IN
    (SELECT DISTINCT hangHoa_id
     FROM HoaDon
     JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
     WHERE HoaDon.id LIKE 'X%'
       AND MONTH(ngayLap) = 6
       AND YEAR(ngayLap) = 2006);

-- 14) Cho biết cửa hàng bán bao nhiêu mặt hàng
SELECT COUNT(*) AS SoLuongMatHang FROM HangHoa;

-- 15) Cho biết số mặt hàng mà từng nhà cung cấp có khả năng cung cấp.
SELECT DoiTac.id AS MaDT,
       DoiTac.ten,
       DoiTac.diaChi,
       DoiTac.dienThoai,
       COUNT(*) AS SoLuongMatHang
FROM KhaNang_CC
JOIN DoiTac ON KhaNang_CC.doiTac_id = DoiTac.id
GROUP BY DoiTac.id,
         DoiTac.ten,
         DoiTac.diaChi,
         DoiTac.dienThoai
ORDER BY SoLuongMatHang DESC;

-- 16) Cho biết thông tin của khách hàng có giao dịch với của hàng nhiều nhất.
SELECT DoiTac.id AS MaDT,
       DoiTac.ten,
       DoiTac.diaChi,
       DoiTac.dienThoai,
       COUNT(*) AS SoLanGiaoDich
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN DoiTac ON HoaDon.doiTac_id = DoiTac.id
WHERE HoaDon.doiTac_id LIKE 'K%'
GROUP BY DoiTac.id,
         DoiTac.ten,
         DoiTac.diaChi,
         DoiTac.dienThoai
HAVING COUNT(*) >= ALL
  (SELECT COUNT(*)
   FROM HoaDon
   JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
   WHERE HoaDon.doiTac_id LIKE 'K%'
   GROUP BY doiTac_id);

-- 17) Tính tổng doanh thu năm 2006.
SELECT SUM(donGia * soLuong) AS TongDoanhThu
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
WHERE HoaDon.id LIKE 'X%' AND YEAR(ngayLap) = 2006;

-- 18) Cho biết loại mặt hàng bán chạy nhất.
SELECT HangHoa.id AS MaHH,
       HangHoa.ten,
       SUM(soLuong) AS SoLuongBan
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN HangHoa ON CT_HoaDon.hangHoa_id = HangHoa.id
WHERE HoaDon.id LIKE 'X%'
GROUP BY HangHoa.id,
         HangHoa.ten
HAVING SUM(soLuong) >= ALL
  (SELECT SUM(soLuong)
   FROM HoaDon
   JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
   WHERE HoaDon.id LIKE 'X%'
   GROUP BY CT_HoaDon.hangHoa_id);

-- 19) Liệt kê thông tin bán hàng của tháng 5/2006 bao gồm: 
-- mahh, tenhh, dvt, tổng số lượng, tổng thành tiền.
SELECT HangHoa.id AS MaHH, HangHoa.ten AS TenHH, dvt, SUM(CT_HoaDon.soLuong) AS TongSoLuong, SUM(donGia * soLuong) AS TongThanhTien 
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN HangHoa ON CT_HoaDon.hangHoa_id = HangHoa.id
WHERE MONTH(ngayLap) = 5 AND YEAR(ngayLap) = 2006
GROUP BY HangHoa.id, HangHoa.ten, dvt
ORDER BY TongSoLuong DESC;

-- 20) Liệt kê thông tin của mặt hàng có nhiều người mua nhất.
SELECT HangHoa.id AS MaHH,
       HangHoa.ten,
       SUM(soLuong) AS SoLuongBan
FROM HoaDon
JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
JOIN HangHoa ON CT_HoaDon.hangHoa_id = HangHoa.id
WHERE HoaDon.id LIKE 'X%'
GROUP BY HangHoa.id,
         HangHoa.ten
HAVING SUM(soLuong) >= ALL
  (SELECT SUM(soLuong)
   FROM HoaDon
   JOIN CT_HoaDon ON HoaDon.id = CT_HoaDon.hoaDon_id
   WHERE HoaDon.id LIKE 'X%'
   GROUP BY CT_HoaDon.hangHoa_id);

-- 21) Tính và cập nhật tổng trị giá của các hóa đơn.

