USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vDetailKD001]    Script Date: 23/08/2017 12:32:48 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO









CREATE VIEW [dbo].[vDetailKD001] 
(MaHD,ID,IDGoi,Name,TrangThai,ThanhTien,IdKH)
AS

Select MaHD,ID,IDGoi,Name,TrangThai,ThanhTien,IdKH FROM
(
select 'HD'+CONVERT(varchar(10), hd.ID) + '-' + CONVERT(varchar(10), cthd.tabIndex) + '-' + CONVERT(varchar(10), pcthd.ID) as MaHD,pcthd.ID,pcthd.IDGoi,hdg.Name,pcthd.TrangThai,pcthd.ThanhTien,scc.ID as IdKH from PackageChiTietHoaDon pcthd
left join ChiTietHoaDon cthd on cthd.ID = pcthd.IDChiTietHD
left join HoaDon hd on hd.ID = cthd.IDHoaDon
left join SYS_CUSTOMER scc ON scc.ID = pcthd.IDKhachHang
left join QuanHuyen qh on qh.MaQuan = scc.MaQuan
left join HoaDonGoi hdg on hdg.ID = pcthd.IDGoi
Where pcthd.TrangThai = N'Hoàn thành' and cthd.IsMaster = 1) Temp

GO

