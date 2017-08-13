USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vBC03]    Script Date: 08/13/2017 15:51:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vBC03] AS
 select ('HD' + CAST(HD.ID AS varchar(100))+ '-' + CAST(cthd.ID AS varchar(100))) as MaHD,
 PCTHD.Loai,
sc.CustomerName,qh.TenQuan,sc.PhoneNumber,hd.NguoiTao, hd.NgayTao,PCTHD.ID
from PackageChiTietHoaDon PCTHD 
left join ChiTietHoaDon cthd on cthd.ID = PCTHD.IDChiTietHD
left join HoaDon hd on hd.ID = cthd.IDHoaDon
left join SYS_CUSTOMER sc on sc.ID = hd.IDKhachHang
left join QuanHuyen qh  on qh.MaQuan = sc.MaQuan

GO

