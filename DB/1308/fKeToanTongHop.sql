USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fKeToanTongHop]    Script Date: 08/13/2017 15:52:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [dbo].[fKeToanTongHop] (@MaNganHang int,@TuNgay nvarchar(50),@DenNgay nvarchar(50))
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    SoTienThu decimal(18, 2),
    SoTienChi decimal(18, 2),
    SoTienLuuChuyenThu decimal(18, 2),
    SoTienLuuChuyenChi decimal(18, 2)
)
AS BEGIN	
	insert into @rtnTable(SoTienThu,SoTienChi,SoTienLuuChuyenThu,SoTienLuuChuyenChi) Select SUM(SoTienThu) as SoTienThu ,SUM(SoTienChi) as SoTienChi,SUM(SoTienLuuChuyenThu) as SoTienLuuChuyenThu,SUM(SoTienLuuChuyenChi) as SoTienLuuChuyenChi  FROM (
	select SUM(SoTien) as SoTienThu, null as SoTienChi , null as SoTienLuuChuyenThu , null as SoTienLuuChuyenChi from ChiTietThu ctc
	LEFT JOIN NganHang nh ON nh.ID = ctc.MaNganHang
	where MaNganHang = @MaNganHang AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103)
	UNION 
	select null as SoTienThu ,SUM(SoTien) as SoTienChi, null as SoTienLuuChuyenThu , null as SoTienLuuChuyenChi from ChiTietChi ctc
	LEFT JOIN NganHang nh ON nh.ID = ctc.MaNganHang
	where MaNganHang = @MaNganHang AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103)
	UNION
	select null as SoTienThu ,null as SoTienChi,SUM(SoTien) as SoTienLuuChuyenThu,null as SoTienLuuChuyenChi from LuuChuyenDongTien ctc
	LEFT JOIN NganHang nh ON nh.ID = ctc.MaNganHangThu
	where MaNganHangThu = @MaNganHang AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103)
	UNION 
	select null as SoTienThu ,null as SoTienChi,null as SoTienLuuChuyenThu,SUM(SoTien) as SoTienLuuChuyenChi from LuuChuyenDongTien ctc
	LEFT JOIN NganHang nh ON nh.ID = ctc.MaNganHangChi
	where MaNganHangChi = @MaNganHang AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),ctc.Ngay , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103)) temp
	Return
END


GO

