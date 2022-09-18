use furuma_management;
-- task 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên 
-- bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT ho_ten
FROM nhan_vien
WHERE (ho_ten regexp '^[HTK]')
  AND (char_length(ho_ten)<=15);

-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

-- cach 1
SELECT *,
       year(CURDATE()) - year(ngay_sinh) AS tuoi
FROM khach_hang
WHERE (year(CURDATE()) - year(ngay_sinh) BETWEEN 18 AND 50)
  AND (dia_chi like '% Đà Nẵng'
       OR dia_chi like '% Quảng Trị');
       
-- cach 2
SELECT*
FROM khach_hang
WHERE (timestampdiff(YEAR, ngay_sinh, curdate()) BETWEEN 18 AND 50)
  AND (dia_chi like '%Đà Nẵng%'
       OR dia_chi like '%Quảng Trị%');
       
-- task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

SELECT kh.ma_khach_hang,
       kh.ho_ten,
       count(kh.ma_khach_hang) so_lan_dat_phong
FROM khach_hang kh
INNER JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
INNER JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
WHERE lk.ten_loai_khach = 'Diamond'
GROUP BY kh.ma_khach_hang
ORDER BY so_lan_dat_phong ;
 
 -- task 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
--  với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

 SELECT kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       sum(ifnull(dv.chi_phi_thue, 0))+sum(ifnull(hdct.so_luong, 0)*ifnull(dvdk.gia, 0)) tong_tien
FROM khach_hang kh
LEFT JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
LEFT JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
GROUP BY hd.ma_hop_dong;
 
-- task 6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).

SELECT dv.ma_dich_vu,
       dv.ten_dich_vu,
       dv.dien_tich,
       dv.chi_phi_thue,
       ldv.ten_loai_dich_vu
FROM dich_vu dv
INNER JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
INNER JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE dv.ma_dich_vu not in
    (SELECT dv.ma_dich_vu
     FROM dich_vu dv
     INNER JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
     INNER JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
     WHERE year(hd.ngay_lam_hop_dong) = 2021
       AND quarter(hd.ngay_lam_hop_dong) = 1 )
GROUP BY dv.ma_dich_vu
ORDER BY dv.ma_dich_vu;

-- task 7 Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

SELECT dv.ma_dich_vu,
       dv.ten_dich_vu,
       dv.dien_tich,
       dv.so_nguoi_toi_da,
       dv.chi_phi_thue,
       ldv.ten_loai_dich_vu
FROM dich_vu dv
INNER JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
INNER JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE dv.ma_dich_vu not in
    (SELECT dv.ma_dich_vu
     FROM dich_vu dv
     INNER JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
     INNER JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
     WHERE year(hd.ngay_lam_hop_dong) = 2021)
  AND year(hd.ngay_lam_hop_dong) = 2020
GROUP BY dv.ma_dich_vu;

-- task 8 Hiển thị thông tin ho_ten khách hàng có trong hệ thống, 
-- với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cach_1
SELECT DISTINCT kh.ho_ten
FROM khach_hang kh;

-- cach_2
SELECT kh.ho_ten
FROM khach_hang kh
GROUP BY kh.ho_ten;

-- cach_3
SELECT kh.ho_ten
FROM khach_hang kh
UNION
SELECT kh.ho_ten
FROM khach_hang kh;

-- task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(hd.ngay_lam_hop_dong) thang,
       count(hd.ma_hop_dong) thong_ke_doanh_thu
FROM hop_dong hd
WHERE year(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang;

-- task 10 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT hd.ma_hop_dong,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       hd.tien_dat_coc,
       hdct.so_luong,
       sum(ifnull(hdct.so_luong, 0)) so_luong_dich_vu_di_kem
FROM hop_dong hd
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong
ORDER BY ma_hop_dong;

-- task 11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

SELECT dvdk.ma_dich_vu_di_kem,
       dvdk.ten_dich_vu_di_kem
FROM khach_hang kh
INNER JOIN loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
INNER JOIN hop_dong hd ON kh.ma_khach_hang=hd.ma_khach_hang
INNER JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
INNER JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE lk.ten_loai_khach like '%Diamond%'
  AND (kh.dia_chi like '%Vinh%'
       OR kh.dia_chi like '%Quảng Ngãi%')
ORDER BY dvdk.ma_dich_vu_di_kem;

-- task 12  Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

SELECT hd.ma_hop_dong,
       nv.ho_ten ho_ten_nhan_vien,
       kh.ho_ten ho_ten_khach_hang,
       kh.so_dien_thoai,
       dv.ten_dich_vu,
       hd.tien_dat_coc,
       sum(ifnull(hdct.so_luong, 0)) so_luong_di_kem
FROM hop_dong hd
INNER JOIN nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
INNER JOIN khach_hang kh ON hd.ma_khach_hang = kh.ma_khach_hang
INNER JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
WHERE hd.ma_hop_dong in
    (SELECT hd.ma_hop_dong
     FROM hop_dong hd
     WHERE year(hd.ngay_lam_hop_dong) = 2020
       AND quarter(hd.ngay_lam_hop_dong) = 4)
  AND hd.ma_hop_dong not in
    (SELECT hd.ma_hop_dong
     FROM hop_dong hd
     WHERE year(hd.ngay_lam_hop_dong) = 2021
       AND (quarter(hd.ngay_lam_hop_dong) in (1,
                                              2)))
GROUP BY hd.ma_hop_dong;

-- task 13 Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các 
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT dvdk.ma_dich_vu_di_kem,
       dvdk.ten_dich_vu_di_kem,
       sum(hdct.so_luong) so_lan_su_dung
FROM dich_vu_di_kem dvdk
INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_lan_su_dung >= ALL
  (SELECT sum(hdct.so_luong) so_lan_su_dung
   FROM dich_vu_di_kem dvdk
   INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
   GROUP BY dvdk.ma_dich_vu_di_kem);

-- task 14 Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

SELECT hd.ma_hop_dong,
       ldv.ten_loai_dich_vu,
       dvdk.ten_dich_vu_di_kem,
       count(hdct.ma_dich_vu_di_kem) so_lan_su_dung
FROM hop_dong hd
JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
JOIN loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
GROUP BY hdct.ma_dich_vu_di_kem
HAVING so_lan_su_dung =1
ORDER BY hd.ma_hop_dong;

-- task 15 Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, 
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT nv.ma_nhan_vien,
       nv.ho_ten,
       td.ten_trinh_do,
       bp.ten_bo_phan,
       nv.so_dien_thoai,
       nv.dia_chi
FROM nhan_vien nv
JOIN trinh_do td ON nv.ma_trinh_do = td.ma_trinh_do
JOIN bo_phan bp ON nv.ma_bo_phan = bp.ma_bo_phan
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE year(hd.ngay_lam_hop_dong) in (2020,
                                     2021)
GROUP BY hd.ma_nhan_vien
HAVING count(hd.ma_hop_dong) <=3
ORDER BY hd.ma_nhan_vien;

-- task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- cach 1
CREATE VIEW nv_chua_co_hop_dong AS
SELECT nv.ma_nhan_vien
FROM nhan_vien nv
WHERE nv.ma_nhan_vien not in
    (SELECT nv.ma_nhan_vien
     FROM nhan_vien nv
     JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
     WHERE hd.ngay_lam_hop_dong BETWEEN '2019-01-01' AND '2021-12-31'
     GROUP BY nv.ma_nhan_vien) ;

SELECT*
FROM nv_chua_co_hop_dong;

DELETE nhan_vien
FROM nhan_vien
JOIN nv_chua_co_hop_dong ON nhan_vien.ma_nhan_vien = nv_chua_co_hop_dong.ma_nhan_vien;

-- cach 3
SET SQL_SAFE_UPDATES = 0;


DELETE
FROM nhan_vien
WHERE ma_nhan_vien not in
    (SELECT nv_tao_duoc_hop_dong.nv_mnv
     FROM
       (SELECT nv.ma_nhan_vien AS nv_mnv
        FROM nhan_vien nv
        JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
        WHERE hd.ngay_lam_hop_dong BETWEEN '2019-01-01' AND '2021-12-31'
        GROUP BY nv.ma_nhan_vien) AS nv_tao_duoc_hop_dong);

-- cach 2
SET SQL_SAFE_UPDATES = 0;


DELETE nhan_vien
FROM nhan_vien
LEFT JOIN hop_dong ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
WHERE EXISTS
    (SELECT*,
           hop_dong.ma_hop_dong
     WHERE hop_dong.ma_hop_dong IS NULL
     ORDER BY nhan_vien.ma_nhan_vien) ;


-- task 17 Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

SELECT*,
      ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdct.so_luong, 0)*ifnull(dvdk.gia, 0))
FROM hop_dong hd
LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong
HAVING hd.ma_hop_dong = 2; -- chi phí thuê 


UPDATE khach_hang kh
SET ma_loai_khach = '1'
WHERE ma_loai_khach = '2'
  AND kh.ma_khach_hang in
    (SELECT ma_khach_hang
     FROM
       (SELECT hd.ma_hop_dong,
               hd.ma_khach_hang,
               dv.chi_phi_thue + sum(ifnull(hdct.so_luong, 0)*ifnull(dvdk.gia, 0)) tong_tien
        FROM hop_dong hd
        LEFT JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE year(hd.ngay_lam_hop_dong) = 2021
        GROUP BY hd.ma_hop_dong) AS bang_tong
     GROUP BY ma_khach_hang
     HAVING sum(tong_tien) > 10000000);

-- task 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

SET FOREIGN_KEY_CHECKS = 0;


DELETE
FROM khach_hang
WHERE ma_khach_hang in
    (SELECT*
     FROM
       (SELECT kh.ma_khach_hang
        FROM khach_hang kh
        JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        WHERE year(hd.ngay_lam_hop_dong) <2021) AS minchou);


-- task 19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

UPDATE dich_vu_di_kem
SET gia = gia*2
WHERE ma_dich_vu_di_kem in
    (SELECT*
     FROM
       (SELECT dvdk.ma_dich_vu_di_kem
        FROM hop_dong hd
        JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        WHERE year(hd.ngay_lam_hop_dong) = 2020
        GROUP BY hdct.ma_dich_vu_di_kem
        HAVING sum(hdct.so_luong) > 10) AS minchou) ; 

-- task 20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT kh.ma_khach_hang AS `(ma_nhan_vien, ma_khach_hang)`,
       kh.ho_ten,
       kh.so_dien_thoai,
       kh.ngay_sinh,
       kh.email,
       kh.dia_chi
FROM khach_hang kh
UNION ALL
SELECT nv.ma_nhan_vien,
       nv.ho_ten,
       nv.so_dien_thoai,
       nv.ngay_sinh,
       nv.email,
       nv.dia_chi
FROM nhan_vien nv;

-- task 21 Tạo khung nhìn có tên là v_nhan_vien để lấy được 
-- thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì
-- với ngày lập hợp đồng là “12/12/2019”.

CREATE VIEW v_nhan_vien AS
SELECT nv.*
FROM nhan_vien nv
JOIN hop_dong hd ON nv.ma_nhan_vien = hd.ma_nhan_vien
WHERE hd.ngay_lam_hop_dong like '%2019-12-12%'
  AND dia_chi like '%Hải Châu%';

-- task 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

SET SQL_SAFE_UPDATES = 0;


UPDATE v_nhan_vien
SET dia_chi = 'Liên Chiểu';

-- task 23 Tạo Stored Procedure sp_xoa_khach_hang dùng để 
-- xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

DELIMITER //
CREATE PROCEDURE sp_xoa_khach_hang(in ma_khach_hang int) BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM khach_hang kh
WHERE kh.ma_khach_hang = ma_khach_hang ; END //
DELIMITER ;

CALL sp_xoa_khach_hang(1);


SELECT*
FROM khach_hang;

--  task 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để 
-- thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện 
-- kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính 
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. 

DELIMITER //
CREATE PROCEDURE sp_them_moi_hop_dong(ma_hop_dong int, ngay_lam_hop_dong datetime, ngay_ket_thuc datetime, tien_dat_coc DOUBLE, ma_nhan_vien int , ma_khach_hang int, ma_dich_vu int) BEGIN
SET SQL_SAFE_UPDATES = 0; IF EXISTS
  (SELECT hd.ma_hop_dong
   FROM hop_dong hd
   WHERE hd.ma_hop_dong = ma_hop_dong) THEN
SELECT 'mã hợp đồng bị trùng' AS message; elseif NOT EXISTS
  (SELECT hd.ma_nhan_vien
   FROM hop_dong hd
   WHERE hd.ma_nhan_vien = ma_nhan_vien) THEN
SELECT 'mã nhân viên không tồn tại' AS message; elseif NOT EXISTS
  (SELECT hd.ma_khach_hang
   FROM hop_dong hd
   WHERE hd.ma_khach_hang = ma_khach_hang) THEN
SELECT 'mã khách hàng không tồn tại' AS message; elseif NOT EXISTS
  (SELECT hd.ma_dich_vu
   FROM hop_dong hd
   WHERE hd.ma_dich_vu = ma_dich_vu) THEN
SELECT 'mã dịch vụ không tồn tại' AS message; ELSE
INSERT INTO hop_dong
VALUES (ma_hop_dong,
        ngay_lam_hop_dong,
        ngay_ket_thuc,
        tien_dat_coc,
        ma_nhan_vien,
        ma_khach_hang,
        ma_dich_vu) ; END IF; END //
DELIMITER ;

CALL sp_them_moi_hop_dong(14, '2020-12-08', '2020-12-08', 0, 14, 1, 3);

-- task 25 Tạo Trigger có tên tr_xoa_hop_dong khi 
-- xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

DROP TRIGGER tr_xoa_hop_dong;


DELIMITER //
CREATE TRIGGER tr_xoa_hop_dong AFTER
DELETE ON hop_dong
FOR EACH ROW BEGIN
INSERT INTO hop_dong_log (content, created_date)
SELECT count(*),
       sysdate()
FROM hop_dong; END //
DELIMITER ;


CREATE TABLE hop_dong_log (content varchar (50),
                                   created_date datetime);


DELETE
FROM hop_dong
WHERE ma_hop_dong = 11;


SELECT*
FROM hop_dong_log;

-- task 26 Tạo Trigger có tên tr_cap_nhat_hop_dong khi 
-- cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì 
-- in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” 
-- trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

DELIMITER //
CREATE TRIGGER tr_cap_nhat_hop_dong
BEFORE
UPDATE ON hop_dong
FOR EACH ROW BEGIN IF datediff(new.ngay_ket_thuc, old.ngay_lam_hop_dong)>2 THEN
INSERT INTO hop_dong_log (content, created_date)
VALUES('cập nhật thành công',
       sysdate()); ELSE
INSERT INTO hop_dong_log (content, created_date)
VALUES('cập nhật không thành công',
       sysdate()); END IF; END //
DELIMITER ;


UPDATE hop_dong
SET ngay_ket_thuc = '2020-07-17'
WHERE ma_hop_dong = 2;


SELECT*
FROM hop_dong_log;

-- task 27 Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: 
-- Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: 
-- Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng 
-- mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian 
-- dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.

-- cau b 
DELIMITER //
CREATE FUNCTION func_tinh_thoi_gian_hop_dong(ma_khach_hang int) RETURNS int DETERMINISTIC BEGIN RETURN
  (SELECT max(datediff(hd.ngay_ket_thuc, hd.ngay_lam_hop_dong)) ngay_lon_nhat
   FROM khach_hang kh
   JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
   GROUP BY kh.ma_khach_hang
   HAVING kh.ma_khach_hang = ma_khach_hang); END //
DELIMITER ;


SELECT func_tinh_thoi_gian_hop_dong(1);

-- tìm lớn nhất
SELECT max(datediff(hd.ngay_ket_thuc, hd.ngay_lam_hop_dong)) ngay_lon_nhat
FROM khach_hang kh
JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
GROUP BY kh.ma_khach_hang
HAVING kh.ma_khach_hang = 1;

-- cau a
SELECT count(*) 'tổng các dịch vụ '
FROM
  (SELECT sum(dv.chi_phi_thue) tong_tien
   FROM dich_vu dv
   JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
   GROUP BY dv.ma_dich_vu
   HAVING tong_tien > 2000000) AS minchou;


DELIMITER //
CREATE FUNCTION f_dem_tong_dich_vu() RETURNS int DETERMINISTIC BEGIN RETURN
  (SELECT count(*) 'tổng các dịch vụ '
   FROM
     (SELECT sum(dv.chi_phi_thue) tong_tien
      FROM dich_vu dv
      JOIN hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
      GROUP BY dv.ma_dich_vu
      HAVING tong_tien > 2000000) AS minchou); END //
DELIMITER ;


SELECT f_dem_tong_dich_vu();

-- task 28 Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để 
-- tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó 
-- (tức là xóa các bảng ghi trong bảng dich_vu) 
-- và xóa những hop_dong sử dụng dịch vụ liên quan 
-- (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.

DELETE
FROM dich_vu
WHERE ma_dich_vu in
    (SELECT*
     FROM
       (SELECT dv.ma_dich_vu
        FROM hop_dong hd
        JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        WHERE ldv.ten_loai_dich_vu = 'Room'
          AND hd.ngay_lam_hop_dong BETWEEN '2015-12-01' AND '2019-12-31') AS minchou) ;


DELIMITER //
CREATE PROCEDURE sp_dich_vu() BEGIN
SET SQL_SAFE_UPDATES = 0;
DELETE
FROM dich_vu
WHERE ma_dich_vu in
    (SELECT*
     FROM
       (SELECT dv.ma_dich_vu
        FROM hop_dong hd
        JOIN dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        JOIN loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        WHERE ldv.ten_loai_dich_vu = 'Room'
          AND hd.ngay_lam_hop_dong BETWEEN '2015-12-01' AND '2019-12-31') AS minchou) ; END //
DELIMITER ;

CALL sp_dich_vu();


