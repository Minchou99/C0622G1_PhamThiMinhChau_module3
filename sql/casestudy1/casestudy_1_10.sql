use furuma_management;
-- task 2
select ho_ten from nhan_vien where ( ho_ten regexp '^[HTK]') and (char_length(ho_ten)<=15);
-- task 3
-- cach 1
select *, year(CURDATE()) - year(ngay_sinh) as tuoi  from khach_hang
where  (year(CURDATE()) - year(ngay_sinh) between 18 and 50 ) and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');
-- cach 2
select* from khach_hang where (timestampdiff(year, ngay_sinh,curdate()) between 18 and 50) and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');
-- task 4
select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) so_lan_dat_phong from khach_hang kh
 inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
 where lk.ten_loai_khach = 'Diamond'
 group by kh.ma_khach_hang
 order by so_lan_dat_phong
 ;
 
 -- task 5
 select kh.ma_khach_hang, kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,
 dv.ten_dich_vu,hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(ifnull(dv.chi_phi_thue,0))+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)) tong_tien  from khach_hang kh 
 left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 group by hd.ma_hop_dong;
 
-- task 6
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu  from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (
select dv.ma_dich_vu from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and quarter(hd.ngay_lam_hop_dong) = 1
)
group by dv.ma_dich_vu
order by dv.ma_dich_vu;

-- task 7
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu  from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (
select dv.ma_dich_vu from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 
) and year(hd.ngay_lam_hop_dong) = 2020
group by dv.ma_dich_vu;

-- task 8
-- cach_1
select distinct kh.ho_ten from khach_hang kh;
-- cach_2
select kh.ho_ten from khach_hang kh
group by kh.ho_ten;
-- cach_3
select kh.ho_ten from khach_hang kh
union
select kh.ho_ten from khach_hang kh;

-- task 9
select month(hd.ngay_lam_hop_dong) thang, count(hd.ma_hop_dong) thong_ke_doanh_thu  
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- task 10
select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
hd.tien_dat_coc, hdct.so_luong, sum(ifnull(hdct.so_luong,0)) so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
order by ma_hop_dong;

-- task 11
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem  from khach_hang kh
inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
inner join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach like '%Diamond%' and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%')
order by dvdk.ma_dich_vu_di_kem;

-- task 12
select hd.ma_hop_dong, nv.ho_ten ho_ten_nhan_vien, kh.ho_ten ho_ten_khach_hang,kh.so_dien_thoai,dv.ten_dich_vu,sum(ifnull(hdct.so_luong,0)) so_luong_di_kem from hop_dong hd 
inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where ( year(hd.ngay_lam_hop_dong) = 2020 and quarter(4)) and dv.ma_dich_vu not in (
select dv.ma_dich_vu from hop_dong hd
inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong) = 2021 and quarter( 1 )
)
;

