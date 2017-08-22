USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vKD001]    Script Date: 23/08/2017 12:33:33 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vKD001]
(MaKH,ID,CustomerName,Address,BirthDay,Email,MaQuan,TenQuan,PhoneNumber,ThanhTien) 
AS
Select 'KH'+ CONVERT(varchar(10), sc.ID) as MaKH,sc.ID,sc.CustomerName,sc.Address,sc.BirthDay,sc.Email,sc.MaQuan,qh.TenQuan,sc.PhoneNumber,temp.ThanhTien FROM SYS_CUSTOMER sc
LEFT JOIN (
select sc.ID,SUM(pcthd.ThanhTien) as ThanhTien from SYS_CUSTOMER sc
LEFT JOIN ChiTietHoaDon cthd ON cthd.IdKhachHang = sc.ID
LEFT JOIN  PackageChiTietHoaDon pcthd ON pcthd.IDChiTietHD = cthd.ID
Where cthd.IsMaster = 1 and pcthd.TrangThai = N'Hoàn thành'
GROUP BY sc.ID) as temp ON temp.ID = sc.ID
LEFT JOIN QuanHuyen qh ON qh.MaQuan = sc.MaQuan




GO

