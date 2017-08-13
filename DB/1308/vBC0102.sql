USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vBC0102]    Script Date: 08/13/2017 15:50:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vBC0102] AS
 select ('HD' + CAST(HD.ID AS varchar(100))) as MaHD,
sc.CustomerName,qh.TenQuan,hd.NguoiTao , hd.NgayTao , hd.TongTien,
hd.GhiChu,hd.TrangThai
from HoaDon hd 
left join ChiTietHoaDon cthd on hd.ID = cthd.IDHoaDon
left join SYS_CUSTOMER sc on sc.ID = hd.IDKhachHang
left join QuanHuyen qh  on qh.MaQuan = sc.MaQuan



GO

