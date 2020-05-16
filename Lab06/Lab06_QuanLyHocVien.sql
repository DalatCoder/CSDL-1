------------------------------------------------
/* Học phần: Cơ sở dữ liệu
   Ngày: 10/05/2020
   Người thực hiện: Nguyễn Trọng Hiếu
   MSSV: 1812756
   Lớp: CTK42
*/
------------------------------------------------

CREATE DATABASE Lab06_QuanLyHocVien;
USE Lab06_QuanLyHocVien;

CREATE TABLE GiaoVien
(
	id CHAR(4) PRIMARY KEY,
	ho NVARCHAR(30),
	ten NVARCHAR(30),
	dienThoai CHAR(6)
);

CREATE TABLE CaHoc
(
	id CHAR(1) PRIMARY KEY,
	gioBD TIME(0),
	gioKT TIME(0)
);

CREATE TABLE Lop
(
	id CHAR(4) PRIMARY KEY,
	ten NVARCHAR(30),
	ngayKG DATE,
	hocPhi INT, 
	ca_id CHAR(1),
	soTiet INT,
	soHV INT,
	giaoVien_id CHAR(4),
	FOREIGN KEY (ca_id) REFERENCES CaHoc(id),
	FOREIGN KEY (giaoVien_id) REFERENCES GiaoVien(id)
);

CREATE TABLE HocVien
(
	id CHAR(6) PRIMARY KEY,
	ho NVARCHAR(30),
	ten NVARCHAR(30),
	ngaySinh DATE,
	phai NVARCHAR(30),
	lop_id CHAR(4),
	FOREIGN KEY (lop_id) REFERENCES Lop(id) ON DELETE CASCADE
);

CREATE TABLE HocPhi
(
	id CHAR(4) PRIMARY KEY,
	hocVien_id CHAR(6),
	ngayThu DATE,
	soTien INT,
	noiDung NVARCHAR(30),
	nguoiThu NVARCHAR(30),
	FOREIGN KEY (hocVien_id) REFERENCES HocVien(id) ON DELETE CASCADE
);

/*
INSERT INTO GiaoVien(id, ho, ten, dienThoai)
VALUES ('G001', N'Lê Hoàng', N'Anh', '858963'),
	   ('G002', N'Nguyễn Ngọc', N'Lan', '845623'),
	   ('G003', N'Trần Minh', N'Hùng', '823456'),
	   ('G004', N'Võ Thanh', N'Trung', '841256');
*/

EXEC usp_Insert_GiaoVien 'G001', N'Lê Hoàng', N'Anh', '858963';
EXEC usp_Insert_GiaoVien 'G002', N'Nguyễn Ngọc', N'Lan', '845623';
EXEC usp_Insert_GiaoVien 'G003', N'Trần Minh', N'Hùng', '823456';
EXEC usp_Insert_GiaoVien 'G004', N'Võ Thanh', N'Trung', '841256';
SELECT * FROM GiaoVien;

/*
INSERT INTO CaHoc (id, gioBD, gioKT)
VALUES ('1', '7:30:00', '10:45:00'),
	   ('2', '13:30:00', '16:45:00'),
	   ('3', '17:30:00', '20:45:00');
*/
EXEC usp_Insert_CaHoc '1', '7:30:00', '10:45:00';
EXEC usp_Insert_CaHoc '2', '13:30:00', '16:45:00';
EXEC usp_Insert_CaHoc '3', '17:30:00', '20:45:00';
SELECT * FROM CaHoc;

SET DATEFORMAT dmy;

/*
INSERT INTO Lop(id, ten, ngayKG, hocPhi, ca_id, soTiet, soHV, giaoVien_id)
VALUES ('E114', N'Excel 3-5-7', '02/01/2008', 120000, '1', 45, 3, 'G003'),
	   ('E115', N'Excel 2-4-6', '22/01/2008', 120000, '3', 45, 0, 'G001'),
	   ('W123', N'Word 2-4-6', '18/02/2008', 100000, '3', 30, 1, 'G001'),
	   ('W124', N'Word 3-5-7', '01/03/2008', 100000, '1', 30, 0, 'G002'),
	   ('A075', N'Access 2-4-6', '18/12/2008', 150000, '3', 60, 3, 'G003');
*/
SET DATEFORMAT dmy;
EXEC usp_Insert_Lop 'E114', N'Excel 3-5-7', '02/01/2008', 120000, '1', 45, 3, 'G003';
EXEC usp_Insert_Lop 'E115', N'Excel 2-4-6', '22/01/2008', 120000, '3', 45, 0, 'G001';
EXEC usp_Insert_Lop 'W123', N'Word 2-4-6', '18/02/2008', 100000, '3', 30, 1, 'G001';
EXEC usp_Insert_Lop 'W124', N'Word 3-5-7', '01/03/2008', 100000, '1', 30, 0, 'G002';
EXEC usp_Insert_Lop 'A075', N'Access 2-4-6', '18/12/2008', 150000, '3', 60, 3, 'G003';
SELECT * FROM Lop;

/*
SET DATEFORMAT dmy;
INSERT INTO HocVien(id, ho, ten, ngaySinh, phai, lop_id)
VALUES ('A07501', N'Lê Văn', N'Minh', '10/06/1998', N'Nam', 'A075'),
	   ('A07502', N'Nguyễn Thị', N'Mai', '20/04/1998', N'Nữ', 'A075'),
	   ('A07503', N'Lê Ngọc', N'Tuấn', '10/06/1994', N'Nam', 'A075'),
	   ('E11401', N'Vương Tuấn', N'Vũ', '25/03/1999', N'Nam', 'E114'),
	   ('E11402', N'Lý Ngọc', N'Hân', '01/12/1995', N'Nữ', 'E114'),
	   ('E11403', N'Trần Mai', N'Linh', '04/06/1990', N'Nữ', 'E114'),
	   ('W12301', N'Nguyễn Ngọc', N'Tuyết', '12/05/1996', N'Nữ', 'W123');
*/

SET DATEFORMAT dmy;
EXEC usp_Insert_HocVien 'A07501', N'Lê Văn', N'Minh', '10/06/1998', N'Nam', 'A075';
EXEC usp_Insert_HocVien 'A07502', N'Nguyễn Thị', N'Mai', '20/04/1998', N'Nữ', 'A075';
EXEC usp_Insert_HocVien 'A07503', N'Lê Ngọc', N'Tuấn', '10/06/1994', N'Nam', 'A075';
EXEC usp_Insert_HocVien 'E11401', N'Vương Tuấn', N'Vũ', '25/03/1999', N'Nam', 'E114';
EXEC usp_Insert_HocVien 'E11402', N'Lý Ngọc', N'Hân', '01/12/1995', N'Nữ', 'E114';
EXEC usp_Insert_HocVien 'E11403', N'Trần Mai', N'Linh', '04/06/1990', N'Nữ', 'E114';
EXEC usp_Insert_HocVien 'W12301', N'Nguyễn Ngọc', N'Tuyết', '12/05/1996', N'Nữ', 'W123';
SELECT * FROM HocVien;

/*
SET DATEFORMAT dmy;
INSERT INTO HocPhi(id, hocVien_id, ngayThu, soTien, noiDung, nguoiThu)
VALUES ('0001', 'E11401', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân'),
	   ('0002', 'E11402', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân'),
	   ('0003', 'E11403', '02/01/2008', 80000, 'HP Excel 3-5-7', N'Vân'),
	   ('0004', 'W12301', '18/02/2008', 100000, 'HP Word 2-4-6', N'Lan'),
	   ('0005', 'A07501', '16/12/2008', 150000, 'HP Access 2-4-6', N'Lan'),
	   ('0006', 'A07502', '16/12/2008', 100000, 'HP Access 2-4-6', N'Lan'),
	   ('0007', 'A07503', '18/12/2008', 150000, 'HP Access 2-4-6', N'Vân'),
	   ('0008', 'A07502', '15/01/2009', 50000, 'HP Access 2-4-6', N'Vân');
*/

SET DATEFORMAT dmy;
EXEC usp_Insert_HocPhi '0001', 'E11401', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân';
EXEC usp_Insert_HocPhi '0002', 'E11402', '02/01/2008', 120000, 'HP Excel 3-5-7', N'Vân';
EXEC usp_Insert_HocPhi '0003', 'E11403', '02/01/2008', 80000, 'HP Excel 3-5-7', N'Vân';
EXEC usp_Insert_HocPhi '0004', 'W12301', '18/02/2008', 100000, 'HP Word 2-4-6', N'Lan';
EXEC usp_Insert_HocPhi '0005', 'A07501', '16/12/2008', 150000, 'HP Access 2-4-6', N'Lan';
EXEC usp_Insert_HocPhi '0006', 'A07502', '16/12/2008', 100000, 'HP Access 2-4-6', N'Lan';
EXEC usp_Insert_HocPhi '0007', 'A07503', '18/12/2008', 150000, 'HP Access 2-4-6', N'Vân';
EXEC usp_Insert_HocPhi '0008', 'A07502', '15/01/2009', 50000, 'HP Access 2-4-6', N'Vân';
SELECT * FROM HocPhi;

CREATE PROC usp_Insert_CaHoc
@id CHAR(1), @gioBD TIME, @gioKT TIME
AS
	IF EXISTS(SELECT * FROM CaHoc WHERE id = @id)
		PRINT N'Ca học có mã ' + @id + N' đã tồn tại trong CSDL!'
	ELSE
		BEGIN
			INSERT INTO CaHoc(id, gioBD, gioKT)
			VALUES (@id, @gioBD, @gioKT)
			PRINT N'Thêm ca học mới thành công!'
		END
GO

/*('G001', N'Lê Hoàng', N'Anh', '858963')*/
CREATE PROC usp_Insert_GiaoVien
@id CHAR(4), @ho NVARCHAR(30), @ten NVARCHAR(30), @dienThoai CHAR(6)
AS
	IF EXISTS(SELECT * FROM GiaoVien WHERE id = @id)
		PRINT N'Giáo viên có mã ' + @id + N' đã tồn tại trong CSDL!'
	ELSE
		BEGIN
			INSERT INTO GiaoVien (id, ho, ten, dienThoai)
			VALUES (@id, @ho, @ten, @dienThoai)
			PRINT N'Thêm giáo viên mới thành công!'
		END
GO

CREATE PROC usp_Insert_Lop 
@id CHAR(4), @ten NVARCHAR(30), @ngayKG DATE, @hocPhi INT, @ca_id CHAR(1), @soTiet INT, @soHV INT, @giaoVien_id CHAR(4)
AS
	IF EXISTS(SELECT * FROM Lop WHERE id = @id)
		PRINT N'Lớp học có mã ' + @id + N' đã tồn tại trong CSDL!'
	ELSE IF NOT EXISTS(SELECT * FROM CaHoc WHERE id = @ca_id)
		PRINT N'Không tồn tại ca học có mã ' + @ca_id + ' !'
	ELSE IF NOT EXISTS(SELECT * FROM GiaoVien WHERE id = @giaoVien_id)
		PRINT N'Không tồn tại giáo viên có mã ' + @giaoVien_id + ' !'
	ELSE
		BEGIN
			INSERT INTO Lop(id, ten, ngayKG, hocPhi, ca_id, soTiet, soHV, giaoVien_id)
			VALUES (@id, @ten, @ngayKG, @hocPhi, @ca_id, @soTiet, @soHV, @giaoVien_id)
			PRINT N'Thêm lớp học mới thành công!'
		END
GO

CREATE PROC usp_Insert_HocVien
@id CHAR(6), @ho NVARCHAR(30), @ten NVARCHAR(30), @ngaySinh DATE, @phai NVARCHAR(30), @lop_id CHAR(4)
AS
	IF EXISTS (SELECT * FROM HocVien WHERE id = @id)
		PRINT N'Học viên có mã ' + @id + N' đã tồn tại trong CSDL!'
	ELSE IF NOT EXISTS (SELECT * FROM Lop WHERE id = @lop_id)
		PRINT N'Không tồn tại lớp học có mã ' + @lop_id + ' !'
	ELSE
		BEGIN
			INSERT INTO HocVien(id, ho, ten, ngaySinh, phai, lop_id)
			VALUES (@id, @ho, @ten, @ngaySinh, @phai, @lop_id)
			PRINT N'Thêm học viên mới thành công!'
		END
GO

CREATE PROC usp_Insert_HocPhi
@id CHAR(4), @hocVien_id CHAR(6), @ngayThu DATE, @soTien INT, @noiDung NVARCHAR(30), @nguoiThu NVARCHAR(30)
AS
	IF EXISTS (SELECT * FROM HocPhi WHERE id = @id)
		PRINT N'Biên lai học phí có mã ' + @id + N' đã tồn tại trong CSDL!'
	ELSE IF NOT EXISTS (SELECT * FROM HocVien WHERE id = @hocVien_id)
		PRINT N'Không tồn tại học viên có mã ' + @hocVien_id + ' !'
	ELSE
		BEGIN
			INSERT INTO HocPhi(id, hocVien_id, ngayThu, soTien, noiDung, nguoiThu)
			VALUES (@id, @hocVien_id, @ngayThu, @soTien, @noiDung, @nguoiThu)
			PRINT N'Thêm biên lai học phí mới thành công!'
		END
GO

