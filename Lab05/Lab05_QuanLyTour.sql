------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 10/05/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab05_QuanLyTour;
USE Lab05_QuanLyTour;

CREATE TABLE Tour
(
	id CHAR(4) PRIMARY KEY,
	tongSoNgay INT CHECK(tongSoNgay > 0)
);

CREATE TABLE ThanhPho
(
	id CHAR(2) PRIMARY KEY,
	ten NVARCHAR(30) UNIQUE
);

CREATE TABLE Tour_TP
(
	tour_id CHAR(4),
	thanhPho_id CHAR(2),
	soNgay INT CHECK(soNgay > 0),
	FOREIGN KEY (tour_id) REFERENCES Tour(id),
	FOREIGN KEY (thanhPho_id) REFERENCES ThanhPho(id),
	PRIMARY KEY (tour_id, thanhPho_id, soNgay)
);

CREATE TABLE LichTour
(
	tour_id CHAR(4),
	ngayKH DATE,
	tenHDV NVARCHAR(30),
	soNguoi INT CHECK (soNguoi > 0),
	tenKH NVARCHAR(30),
	FOREIGN KEY (tour_id) REFERENCES Tour(id) ON DELETE CASCADE,
	PRIMARY KEY (tour_id, ngayKH)
);

INSERT INTO Tour(id, tongSoNgay) VALUES ('T001', 3);
INSERT INTO Tour(id, tongSoNgay) VALUES ('T002', 4);
INSERT INTO Tour(id, tongSoNgay) VALUES ('T003', 5);
INSERT INTO Tour(id, tongSoNgay) VALUES ('T004', 7);
SELECT * FROM Tour;

INSERT INTO ThanhPho(id, ten) VALUES ('01', N'Đà Lạt');
INSERT INTO ThanhPho(id, ten) VALUES ('02', N'Nha Trang');
INSERT INTO ThanhPho(id, ten) VALUES ('03', N'Phan Thiết');
INSERT INTO ThanhPho(id, ten) VALUES ('04', N'Huế');
INSERT INTO ThanhPho(id, ten) VALUES ('05', N'Đà Nẵng');
SELECT * FROM ThanhPho;

INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T001', '01', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T001', '03', 1);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T002', '01', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T002', '02', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T003', '02', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T003', '01', 1);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T003', '04', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T004', '02', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T004', '05', 2);
INSERT INTO Tour_TP(tour_id, thanhPho_id, soNgay) VALUES ('T004', '04', 3);
SELECT * FROM Tour_TP;

SET DATEFORMAT dmy;
INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T001', '14/02/2017', N'Vân', 20, N'Nguyễn Hoàng');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T002', '14/02/2017', N'Nam', 30, N'Lê Ngọc');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T002', '06/03/2017', N'Hùng', 20, N'Lý Dũng');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T003', '18/02/2017', N'Dũng', 20, N'Lý Dũng');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T004', '18/02/2017', N'Hùng', 30, N'Dũng Nam');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T003', '10/03/2017', N'Nam', 45, N'Nguyễn An');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T002', '28/04/2017', N'Vân', 25, N'Ngọc Dung');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T004', '29/04/2017', N'Dũng', 35, N'Lê Ngọc');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T001', '30/04/2017', N'Nam', 25, N'Trần Nam');

INSERT INTO LichTour(tour_id, ngayKH, tenHDV, soNguoi, tenKH)
VALUES ('T003', '15/06/2017', N'Vân', 20, N'Trịnh Bá');
SELECT * FROM LichTour;

-- (a) Cho biết các tour du lịch có tổng số ngày của tour từ 3 đến 5 ngày.
SELECT * 
FROM Tour 
JOIN LichTour ON Tour.id = LichTour.tour_id
WHERE tongSoNgay BETWEEN 3 AND 5;

-- (b) Cho biết thông tin các tour được tổ chức trong tháng 2 năm 2017.
SELECT * 
FROM Tour 
JOIN LichTour ON Tour.id = LichTour.tour_id
WHERE MONTH(ngayKH) = 2 AND YEAR(ngayKH) = 2017;

-- (c) Cho biết các tour không đi qua thành phố 'Nha Trang'.
SELECT *
FROM Tour
WHERE Tour.id NOT IN
    (SELECT tour_id
     FROM Tour_TP
     JOIN ThanhPho ON ThanhPho.id = Tour_TP.thanhPho_id
     WHERE ten = N'Nha Trang');

-- (d) Cho biết số lượng thành phố mà mỗi tour du lịch đi qua.
SELECT Tour.id, tongSoNgay, COUNT(thanhPho_id) AS SoLuongThanhPho
FROM Tour
JOIN Tour_TP ON Tour.id = Tour_TP.tour_id
GROUP BY Tour.id, tongSoNgay;

-- (e) Cho biết số lượng tour du lịch mỗi hướng dẫn viên hướng dẫn.
SELECT tenHDV, COUNT(tour_id) AS SoLuongTour
FROM LichTour
GROUP BY tenHDV

-- (f) Cho biết tên thành phố có nhiều tour du lịch đi qua nhất.
SELECT ThanhPho.id AS MaTP,
       ThanhPho.ten,
       COUNT(tour_id) AS SoLuongTour
FROM Tour_TP
JOIN ThanhPho ON Tour_TP.thanhPho_id = ThanhPho.id
GROUP BY ThanhPho.id,
         ThanhPho.ten
HAVING COUNT(tour_id) >= ALL
  (SELECT COUNT(tour_id)
   FROM Tour_TP
   GROUP BY thanhPho_id)

-- (g) Cho biết thông tin của tour du lịch đi qua tất cả các thành phố.
SELECT Tour.id,
       tongSoNgay,
       COUNT(thanhPho_id) AS SoLuongThanhPho
FROM Tour
JOIN Tour_TP ON Tour.id = Tour_TP.tour_id
GROUP BY Tour.id,
         tongSoNgay
HAVING COUNT(thanhPho_id) -
  (SELECT COUNT(*)
   FROM ThanhPho) = 0;

-- (h) Lập danh sách các tour đi qua thành phố 'Ðà Lạt', thông tin cần hiển thị bao gồm:
-- Mã tour, Songay.
SELECT DISTINCT Tour_TP.tour_id AS MaTour, soNgay, ThanhPho.ten
FROM Tour_TP
JOIN ThanhPho ON ThanhPho.id = Tour_TP.thanhPho_id
WHERE ThanhPho.ten = N'Đà Lạt';

-- (i) Cho biết thông tin của tour du lịch có tổng số lượng khách tham gia nhiều nhất.
SELECT tour_id AS MaTour,
       SUM(soNguoi) AS SoKhach
FROM LichTour
GROUP BY tour_id
HAVING SUM(soNguoi) >= ALL
  (SELECT SUM(soNguoi)
   FROM LichTour
   GROUP BY tour_id)

-- (j) Cho biết tên thành phố mà tất cả các tour du lịch đều đi qua.
SELECT ThanhPho.id,
       thanhPho.ten,
       COUNT(DISTINCT tour_id) AS SoLuongTour
FROM Tour_TP
JOIN ThanhPho ON ThanhPho.id = Tour_TP.thanhPho_id
GROUP BY ThanhPho.id,
         thanhPho.ten
HAVING COUNT(DISTINCT tour_id) -
  (SELECT COUNT(*)
   FROM Tour) = 0;
