USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vHoaDonShiper]    Script Date: 7/29/2017 3:34:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vHoaDonShiper] AS
 select HD.ID as ID_HD, ('HD' + CAST(HD.ID AS varchar(100)) + '-' + CAST(CTHD.ID AS varchar(100))) as MaReservation,
 HD.IDKhachHang,KH.TenKH AS TenKH_HD,
 HD.IDNguon, SS.Source_Name,
 HD.TongTien,HD.TongTienThuDuoc,HD.TongTienConNo,HD.ChietKhau,HD.TrangThai as TrangThaiHD,
 HD.NgayTao as NgayTaoHD ,HD.NguoiTao 
 ,'---' as LabelHD,
 CTHD.ID as ID_CTHD,CTHD.IDHoaDon,CTHD.IsMaster,CTHD.IDKhachHang AS IdKH_CTHD,KH1.TenKH,
 CTHD.TrangThai as TrangThaiCTHD,
 '---' as LabelCTHD,
 PCTHD.ID as ID_PTCHD,PCTHD.IDChiTietHD,PCTHD.SoNgay,PCTHD.Loai,PCTHD.TrangThai as TrangThaiPCTD,
 PCTHD.Ship,PCTHD.HinhThucThanhToan,PCTHD.HinhThucGiaoHang,PCTHD.ThanhTien,
 '---' as LabelPCTHD,
 NHD.ID as ID_NHD, NHD.IDPackageChitietHD,NHD.Ngay,NHD.TrangThai as TrangThaiNHD,
 '---' as LabelNHD,
 HDSP.*,'---' as LabelHDSP, shiper.NAME shipName, shiper.NUMBER shipNo, sysUser.UserName userName from HoaDon HD
 left join KhachHang KH ON HD.IDKhachHang = KH.ID
 left join SYS_SOURCE SS ON SS.ID = HD.IDNguon 
 left join ChiTietHoaDon CTHD ON CTHD.IDHoaDon = HD.ID
 left join KhachHang KH1 ON CTHD.IDKhachHang = KH1.ID
 left join PackageChiTietHoaDon PCTHD ON PCTHD.IDChiTietHD = CTHD.ID
 left join NgayHoaDon NHD ON NHD.IDPackageChitietHD = PCTHD.ID
 left join HoaDonSanPham HDSP ON HDSP.IDNgayHoaDon = NHD.ID
 left join SHIPER shiper ON shiper.NGAYHOADON_ID = NHD.ID
 left join SYS_USER sysUser ON sysUSer.ID = NHD.USER_ID


GO


