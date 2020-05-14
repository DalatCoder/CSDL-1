------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 10/05/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab04_QuanLyDatBao;
USE Lab04_QuanLyDatBao;

CREATE TABLE Bao
(
	id CHAR(4) PRIMARY KEY,
	ten NVARCHAR(100),
	dinhKy NVARCHAR(30),
	soLuong INT,
	giaBan INT
);

CREATE TABLE PhatHanh
(
	bao_id CHAR(4),
	soBao INT,
	ngayPH DATE

	FOREIGN KEY (bao_id) REFERENCES Bao(id) ON DELETE CASCADE
	PRIMARY KEY (bao_id, soBao)
);

CREATE TABLE KhachHang
(
	id CHAR(4) PRIMARY KEY,
	ten NVARCHAR(30),
	diaChi NVARCHAR(30)
);

CREATE TABLE DatBao
(
	khachHang_id CHAR(4),
	bao_id CHAR(4),
	soLuongMua INT,
	ngayDatMua DATE

	FOREIGN KEY (khachHang_id) REFERENCES KhachHang(id),
	FOREIGN KEY (bao_id) REFERENCES Bao(id),
	PRIMARY KEY (khachHang_id, bao_id)
);

INSERT INTO Bao(id, ten, dinhKy, soLuong, giaBan) VALUES ('TT01', N'Tuổi trẻ', N'Nhật báo', 1000, 1500);
INSERT INTO Bao(id, ten, dinhKy, soLuong, giaBan) VALUES ('KT01', N'Kiến thức ngày nay', N'Bán nguyệt san', 3000, 6000);
INSERT INTO Bao(id, ten, dinhKy, soLuong, giaBan) VALUES ('TN01', N'Thanh niên', N'Nhật báo', 1000, 2000);
INSERT INTO Bao(id, ten, dinhKy, soLuong, giaBan) VALUES ('PN01', N'Phụ nữ', N'Tuần báo', 2000, 4000);
INSERT INTO Bao(id, ten, dinhKy, soLuong, giaBan) VALUES ('PN02', N'Phụ nữ', N'Nhật báo', 1000, 2000);
SELECT * FROM Bao;

SET DATEFORMAT dmy;
INSERT INTO PhatHanh VALUES ('TT01', 123, '15/12/2005');
INSERT INTO PhatHanh VALUES ('KT01', 70, '15/12/2005');
INSERT INTO PhatHanh VALUES ('TT01', 124, '16/12/2005');
INSERT INTO PhatHanh VALUES ('TN01', 256, '17/12/2005');
INSERT INTO PhatHanh VALUES ('PN01', 45, '23/12/2005');
INSERT INTO PhatHanh VALUES ('PN02', 111, '18/12/2005');
INSERT INTO PhatHanh VALUES ('PN02', 112, '19/12/2005');
INSERT INTO PhatHanh VALUES ('TT01', 125, '17/12/2005');
INSERT INTO PhatHanh VALUES ('PN01', 46, '30/12/2005');
SELECT * FROM PhatHanh;

INSERT INTO KhachHang(id, ten, diaChi) VALUES ('KH01', N'LAN', N'2 NCT');
INSERT INTO KhachHang(id, ten, diaChi) VALUES ('KH02', N'NAM', N'32 THĐ');
INSERT INTO KhachHang(id, ten, diaChi) VALUES ('KH03', N'NGỌC', N'16 LHP');
SELECT * FROM KhachHang;

INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH01', 'TT01', 100, '12/01/2000');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH02', 'TN01', 150, '01/05/2001');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH01', 'PN01', 200, '25/06/2001');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH03', 'KT01', 50, '17/03/2002');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH03', 'PN02', 200, '26/08/2003');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH02', 'TT01', 250, '15/01/2004');
INSERT INTO DatBao(khachHang_id, bao_id, soLuongMua, ngayDatMua) VALUES ('KH01', 'KT01', 300, '14/10/2004');
SELECT * FROM DatBao;


-- 1) Cho biết các tờ báo, tạp chí (MABAOTC, TEN, GIABAN) có định kỳ phát hành hàng tuần (Tuần báo).
-- 2) Cho biết thông tin về các tờ báo thuộc loại báo phụ nữ (mã báo tạp chí bắt đầu bằng PN).
-- 3) Cho biết tên các khách hàng có đặt mua báo phụ nữ (mã báo tạp chí bắt đầu bằng PN), không liệt kê khách hàng trùng.
-- 4) Cho biết tên các khách hàng có đặt mua tất cả các báo phụ nữ (mã báo tạp chí bắt đầu bằng PN).
-- 5) Cho biết các khách hàng không đặt mua báo thanh niên.
-- 6) Cho biết số tờ báo mà mỗi khách hàng đã đặt mua.
-- 7) Cho biết số khách hàng đặt mua báo trong năm 2004.
-- 8) Cho biết thông tin đặt mua báo của các khách hàng 
-- (TenKH, TeN, DinhKy,
-- SLMua, SoTien), trong đó SoTien = SLMua  DonGia.
-- 9) Cho biết các tờ báo, tạp chí (Ten, DinhKy) và tổng số lượng đặt mua của các
-- khách hàng đối với tờ báo, tạp chí đó.
-- 10) Cho biết tên các tờ báo dành cho học sinh, sinh viên (mã báo tạp chí bắt đầu bằng HS).
-- 11) Cho biết những tờ báo không có người đặt mua.
-- 12) Cho biết tên, định kỳ của những tờ báo có nhiều người đặt mua nhất.
-- 13) Cho biết khách hàng đặt mua nhiều báo, tạp chí nhất.
-- 14) Cho biết các tờ báo phát hành định kỳ một tháng 2 lần.
-- 15) Cho biết các tờ báo, tạp chi có từ 3 khách hàng đặt mua trở lên.
