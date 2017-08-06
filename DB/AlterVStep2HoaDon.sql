USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vHoaDonStep2]    Script Date: 08/06/2017 14:11:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






ALTER VIEW [dbo].[vHoaDonStep2] AS
select hd.ID,cthd.ID as IdCTHD,pkcthd.ID as IdPCTHD,cthd.tabIndex,nhd.ID as IdNgayHD,sc.ID as IdKH,
sc.CustomerName as TenKH,sc.PhoneNumber as SoDienThoai,
sc.Address as DiaChi , sc.MaQuan , qh.TenQuan,
nhd.TrangThai, pkcthd.Loai,CONVERT(VARCHAR(10),nhd.Ngay ,103) as NgayHD,
pkcthd.ThanhTien,s.NAME as tenShipper,nhd.GhiChu,hd.TongTienThuDuoc,hd.TongTienConNo,hd.TongTien,
cthd.IsMaster,nhd.TongTien as TongTienNgay , nhd.SoTienThu as SoTienThuNgay ,
nhd.SoTienConLai as SoTienConLai, hdg.Name as TenGoi
from NgayHoaDon nhd
left join SHIPER s on s.SHIPER_ID = nhd.SHIPER_ID
left join PackageChiTietHoaDon pkcthd on nhd.IDPackageChitietHD = pkcthd.ID
left join ChiTietHoaDon cthd on cthd.ID = pkcthd.IDChiTietHD
left join HoaDon hd on hd.ID = cthd.IDHoaDon
left join SYS_CUSTOMER sc on sc.ID = pkcthd.IDKhachHang
left join QuanHuyen qh on qh.MaQuan = sc.MaQuan
left join HoaDonGoi hdg on hdg.ID = pkcthd.IDGoi




GO

