USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vRPBaoCao02]    Script Date: 31/08/2017 11:53:49 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vRPBaoCao02] AS
 select vBC.MaHD , vBC.CustomerName as KhachHang , 
 vBC.TenQuan as Quan , vBC.HinhThucThanhToan ,
 vBC.NguoiTao, vBC.NgayTao as Time , vBC.TongTien
from vBC0102 vBC Where vBC.TrangThai = N'Hủy Đơn'

GO

