USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vKhachHang]    Script Date: 23/08/2017 12:33:48 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vKhachHang]
(MaKH,ID,CustomerName,Address,BirthDay,Email,MaQuan,TenQuan,PhoneNumber)
 AS
select 'KH'+ CONVERT(varchar(10), sc.ID) as MaKH,sc.ID,sc.CustomerName,sc.Address,sc.BirthDay,sc.Email,sc.MaQuan,qh.TenQuan,sc.PhoneNumber from SYS_CUSTOMER sc
LEFT JOIN QuanHuyen qh ON qh.MaQuan = sc.MaQuan

GO

