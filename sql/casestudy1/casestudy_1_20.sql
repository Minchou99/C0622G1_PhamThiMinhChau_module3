use furuma_management;
-- task 2 Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên 
-- bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ho_ten 
from nhan_vien 
where ( ho_ten regexp '^[HTK]') 
and (char_length(ho_ten)<=15);

-- task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
-- và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.

-- cach 1
select *, 
year(CURDATE()) - year(ngay_sinh) as tuoi  
from khach_hang
where  (year(CURDATE()) - year(ngay_sinh) between 18 and 50 ) 
and (dia_chi like '% Đà Nẵng' or dia_chi like '% Quảng Trị');

-- cach 2
select* 
from khach_hang 
where (timestampdiff(year, ngay_sinh,curdate()) between 18 and 50) 
and (dia_chi like '%Đà Nẵng%' or dia_chi like '%Quảng Trị%');

-- task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select kh.ma_khach_hang, kh.ho_ten, count(kh.ma_khach_hang) so_lan_dat_phong 
from khach_hang kh
inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
order by so_lan_dat_phong ;
 
 -- task 5 Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, 
 -- ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
--  (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
--  với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
--  (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

 select kh.ma_khach_hang, kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,
 dv.ten_dich_vu,hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, sum(ifnull(dv.chi_phi_thue,0))+sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)) tong_tien 
 from khach_hang kh 
 left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
 left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
 left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
 left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
 left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
 group by hd.ma_hop_dong;
 
-- task 6 Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
-- của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 
-- (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu  
from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (
select dv.ma_dich_vu 
from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and quarter(hd.ngay_lam_hop_dong) = 1
)
group by dv.ma_dich_vu
order by dv.ma_dich_vu;

-- task 7 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
-- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
-- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich,dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu  
from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where dv.ma_dich_vu not in (
select dv.ma_dich_vu 
from dich_vu dv 
inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
inner join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021) 
and year(hd.ngay_lam_hop_dong) = 2020
group by dv.ma_dich_vu;

-- task 8 Hiển thị thông tin ho_ten khách hàng có trong hệ thống, 
-- với yêu cầu ho_ten không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.

-- cach_1
select distinct kh.ho_ten 
from khach_hang kh;
-- cach_2
select kh.ho_ten 
from khach_hang kh
group by kh.ho_ten;
-- cach_3
select kh.ho_ten 
from khach_hang kh
union
select kh.ho_ten 
from khach_hang kh;

-- task 9 Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
-- thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(hd.ngay_lam_hop_dong) thang, count(hd.ma_hop_dong) thong_ke_doanh_thu  
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) = 2021
group by thang
order by thang;

-- task 10 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, 
hd.tien_dat_coc, hdct.so_luong, sum(ifnull(hdct.so_luong,0)) so_luong_dich_vu_di_kem
from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
order by ma_hop_dong;

-- task 11 Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem  
from khach_hang kh
inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
inner join hop_dong hd on kh.ma_khach_hang=hd.ma_khach_hang
inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach like '%Diamond%' 
and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%')
order by dvdk.ma_dich_vu_di_kem;

-- task 12  12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select hd.ma_hop_dong, nv.ho_ten ho_ten_nhan_vien, kh.ho_ten ho_ten_khach_hang,
kh.so_dien_thoai,dv.ten_dich_vu, hd.tien_dat_coc,
sum(ifnull(hdct.so_luong,0)) so_luong_di_kem 
from hop_dong hd 
inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
inner join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
inner join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where hd.ma_hop_dong in (
select hd.ma_hop_dong 
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) = 2020 and quarter(hd.ngay_lam_hop_dong) = 4)
and hd.ma_hop_dong not in (
select hd.ma_hop_dong 
from hop_dong hd 
where year(hd.ngay_lam_hop_dong) = 2021 and (quarter(hd.ngay_lam_hop_dong) in (1,2)))
group by hd.ma_hop_dong;

-- task 13 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các 
-- Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, sum(hdct.so_luong) so_lan_su_dung 
from dich_vu_di_kem dvdk 
inner join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung >= all (
select sum(hdct.so_luong) so_lan_su_dung 
from dich_vu_di_kem dvdk 
inner join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
);

-- task 14 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
-- so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) so_lan_su_dung 
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung =1
order by hd.ma_hop_dong;

-- task 15 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, 
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi 
from nhan_vien nv
join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) in (2020,2021)
group by hd.ma_nhan_vien
having count(hd.ma_hop_dong) <=3
order by hd.ma_nhan_vien;

-- task 16 Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
-- cach 1
create view nv_chua_co_hop_dong as 
select nv.ma_nhan_vien from nhan_vien nv
 where nv.ma_nhan_vien not in(
 select nv.ma_nhan_vien 
from nhan_vien nv 
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ngay_lam_hop_dong between '2019-01-01' and '2021-12-31'
group by nv.ma_nhan_vien) 
;
select* 
from nv_chua_co_hop_dong;
delete nhan_vien 
from nhan_vien 
join nv_chua_co_hop_dong on nhan_vien.ma_nhan_vien = nv_chua_co_hop_dong.ma_nhan_vien;

-- cach 3
SET SQL_SAFE_UPDATES = 0;
delete from nhan_vien
where ma_nhan_vien not in( 
select nv_tao_duoc_hop_dong.nv_mnv 
from (
select nv.ma_nhan_vien as nv_mnv
from nhan_vien nv 
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where hd.ngay_lam_hop_dong 
between '2019-01-01' and '2021-12-31'
group by nv.ma_nhan_vien) 
as nv_tao_duoc_hop_dong);

-- cach 2
SET SQL_SAFE_UPDATES = 0;
delete nhan_vien 
from nhan_vien
left join hop_dong on nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
 where exists (
select*, hop_dong.ma_hop_dong
where hop_dong.ma_hop_dong is null
order by nhan_vien.ma_nhan_vien
) ;

-- task 17 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng 
-- với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

select*, ifnull(dv.chi_phi_thue,0) + sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0))
from hop_dong hd
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hd.ma_hop_dong
having hd.ma_hop_dong = 2; -- chi phí thuê 


update khach_hang kh 
set ma_loai_khach = '1' 
where ma_loai_khach = '2' 
and kh.ma_khach_hang 
in (
select ma_khach_hang 
from (
select hd.ma_hop_dong,hd.ma_khach_hang, dv.chi_phi_thue  + sum(ifnull(hdct.so_luong,0)*ifnull(dvdk.gia,0)) tong_tien  
from hop_dong hd
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2021
group by hd.ma_hop_dong) 
as bang_tong
group by ma_khach_hang
having sum(tong_tien)  > 10000000 );

-- task 18 Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

SET FOREIGN_KEY_CHECKS = 0;
delete from khach_hang 
 where ma_khach_hang 
 in (
 select* 
 from  (
select kh.ma_khach_hang 
from khach_hang kh 
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where year(hd.ngay_lam_hop_dong) <2021) as minchou );

-- task 19 Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

update dich_vu_di_kem set gia = gia*2 
where ma_dich_vu_di_kem in (
select*
from (
select dvdk.ma_dich_vu_di_kem 
from hop_dong hd 
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong) = 2020 
group by hdct.ma_dich_vu_di_kem
having sum(hdct.so_luong) > 10) as minchou) ; 

-- task 20 Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), 
-- ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select kh.ma_khach_hang 
as `(ma_nhan_vien, ma_khach_hang)`, kh.ho_ten,kh.so_dien_thoai, kh.ngay_sinh, kh.email, kh.dia_chi  
from khach_hang kh
union all
select nv.ma_nhan_vien, nv.ho_ten,nv.so_dien_thoai, nv.ngay_sinh, nv.email, nv.dia_chi 
from nhan_vien nv;

-- task 21 Tạo khung nhìn có tên là v_nhan_vien để lấy được 
-- thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì
-- với ngày lập hợp đồng là “12/12/2019”.


-- task 22 Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.


-- task 23 Tạo Stored Procedure sp_xoa_khach_hang dùng để 
-- xóa thông tin của một khách hàng nào đó 
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.


--  task 24 Tạo Stored Procedure sp_them_moi_hop_dong dùng để 
-- thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện 
-- kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính 
-- và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan. 


-- task 25 Tạo Trigger có tên tr_xoa_hop_dong khi 
-- xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại 
-- có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.


-- task 26 Tạo Trigger có tên tr_cap_nhat_hop_dong khi 
-- cập nhật ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì 
-- in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” 
-- trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.



-- task 27 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: 
-- Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo Function func_tinh_thoi_gian_hop_dong: 
-- Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng 
-- mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian 
-- dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.




-- task 28 Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để 
-- tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó 
-- (tức là xóa các bảng ghi trong bảng dich_vu) 
-- và xóa những hop_dong sử dụng dịch vụ liên quan 
-- (tức là phải xóa những bản gi trong bảng hop_dong) và những bản liên quan khác.





