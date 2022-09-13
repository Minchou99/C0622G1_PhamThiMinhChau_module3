drop database if exists hang_hoa;
create database hang_hoa;
use hang_hoa;
create table phieu_xuat(
so_px int primary key auto_increment,
ngay_xuat date
);

create table phieu_nhap (
so_phieu_nhap int primary key,
ngay_nhap int
);

create table nha_cung_cap(
ma_nha_cung_cap int primary key,
ten_nha_cung_cap varchar(50),
dia_chi varchar(50)
);

create table so_dien_thoai(
so_dien_thoai int primary key,
foreign key (so_dien_thoai) references nha_cung_cap(ma_nha_cung_cap)
);

create table don_dat_hang(
so_dat_hang int primary key,
ngay_dat_hang date,
ma_nha_cung_cap int,
foreign key (ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);

create table vat_tu(
ma_vat_tu int primary key auto_increment,
ten_vat_tu varchar(50),
foreign key (ma_vat_tu) references don_dat_hang(so_dat_hang)
);

create table chi_tiet_phieu_xuat(
don_gia_phieu_xuat double,
so_luong_xuat double,
so_phieu_xuat int,
ma_vat_tu int,
primary key (so_phieu_xuat, ma_vat_tu),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key (so_phieu_xuat) references phieu_xuat(so_px)
);

create table chi_tiet_phieu_nhap(
ma_vat_tu int,
so_phieu_nhap int,
don_gia_nhap double,
so_luong_nhap double,
primary key (ma_vat_tu, so_phieu_nhap),
foreign key (so_phieu_nhap) references phieu_nhap(so_phieu_nhap),
foreign key (ma_vat_tu) references vat_tu(ma_vat_tu)
);
