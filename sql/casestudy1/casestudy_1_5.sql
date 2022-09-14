use furuma_management;
-- task 2
select ho_ten from nhan_vien where ( ho_ten regexp '^[HTK]') and (char_length(ho_ten)<=15);
-- task 3
select *, year(CURDATE()) - year(ngay_sinh) as tuoi  from khach_hang
where  (year(CURDATE()) - year(ngay_sinh) between 18 and 50 ) and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');