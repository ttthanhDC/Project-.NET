USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vDetailKD003]    Script Date: 23/08/2017 12:33:06 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [dbo].[vDetailKD003] 
AS

select hd.ID as IDHD,cthd.tabIndex,pcthd.ID as IDPCTHD,nhd.ID as IDNHD,nhd.Ngay,nhd.TrangThai,nhd.SoTienThu,hdsp.* from NgayHoaDon nhd 
LEFT JOIN HoaDonSanPham hdsp ON hdsp.IDNgayHoaDon = nhd.ID
LEFT JOIN PackageChiTietHoaDon pcthd ON pcthd.ID = nhd.IDPackageChitietHD
LEFT JOIN ChiTietHoaDon cthd ON cthd.ID = pcthd.IDChiTietHD
LEFT JOIN HoaDon hd ON hd.ID = cthd.IDHoaDon
where hdsp.promotionCode <> '0' and hdsp.promotionCode <> ''



GO

