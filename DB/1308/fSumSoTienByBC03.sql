USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fSumSoTienByBC03]    Script Date: 08/13/2017 15:52:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fSumSoTienByBC03] (@IdGoi int)
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    SoTienThu decimal(18, 2),
    SoTienTong decimal(18, 2),
    SoTienThieu decimal(18, 2)
)
AS BEGIN	
	insert into @rtnTable(SoTienThu,SoTienTong,SoTienThieu) select SUM(SoTienThu) as SoTienThu ,SUM(TongTien) as SoTienTong ,SUM(SoTienConLai) as SoTienThieu from NgayHoaDon where IDPackageChitietHD = @IdGoi
	Return
END



GO

