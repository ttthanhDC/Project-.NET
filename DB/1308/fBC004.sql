USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fBC004]    Script Date: 08/13/2017 15:51:33 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [dbo].[fBC004] (@IdNguon int,@TuNgay nvarchar(50),@DenNgay nvarchar(50))
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    SoLuongDon int,
    SoluongShip int,
    DuKienThu decimal(18, 2)
)
AS BEGIN	
	insert into @rtnTable(SoLuongDon,SoluongShip,DuKienThu)
	Select SUM(SoLuongDon) as SoLuongDon ,0 as SoluongShip ,SUM(DuKienThu) as DuKienThu  FROM (
	select COUNT(ID) as SoLuongDon ,0 as SoluongShip ,SUM(HD.TongTien) as DuKienThu 
	from HoaDon HD where IDNguon = @IdNguon 
	AND convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),NgayTao , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103) 
	UNION 
	select 0 as SoluongDon , COUNT(ship.SHIPER_ID) as SoluongShip, 0 as  DuKienThu from SHIPER  ship
	left join NgayHoaDon NHD ON ship.SHIPER_ID = NHD.SHIPER_ID
	left join PackageChiTietHoaDon PCTHD ON NHD.IDPackageChitietHD = PCTHD.ID
	left join ChiTietHoaDon CTHD ON PCTHD.IDChiTietHD = CTHD.ID
	left join HoaDon HD  ON HD.ID = CTHD.IDHoaDon
	where HD.IDNguon = @IdNguon
	AND convert(date,CONVERT(VARCHAR(10),HD.NgayTao , 103),103) >= convert(date,CONVERT(VARCHAR(10),@TuNgay, 103),103) AND convert(date,CONVERT(VARCHAR(10),HD.NgayTao , 103),103) <= convert(date,CONVERT(VARCHAR(10),@DenNgay, 103),103) 
	) temp
	
	Return
END




GO

