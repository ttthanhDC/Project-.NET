USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fK001]    Script Date: 21/08/2017 12:20:06 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE FUNCTION [dbo].[fK001] (@productCode nvarchar(50),@Ngay nvarchar(50))
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    SoLuongChai int,
    TheTich int,
	sugar int
)
AS BEGIN	
	insert into @rtnTable(SoLuongChai,TheTich,sugar) Select SUM(SoLuongChai) as SoLuongChai ,SUM(TheTich) as TheTich ,SUM(sugar) as sugar FROM (
	select SUM(hdsp.quantity) as SoLuongChai, SUM(hdsp.quantity*sp.Product_Unit) as TheTich, SUM(hdsp.sugar) as sugar from HoaDonSanPham hdsp
	LEFT JOIN NgayHoaDon nhd ON nhd.ID = hdsp.IDNgayHoaDon
	LEFT JOIN SYS_PRODUCT sp ON sp.Product_Code = hdsp.product
	where  convert(date,CONVERT(VARCHAR(10),nhd.Ngay , 103),103) = convert(date,CONVERT(VARCHAR(10),@Ngay, 103),103) 
	) temp
	Return
END


GO

