USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fRPBaoCao04]    Script Date: 31/08/2017 11:53:09 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE FUNCTION [dbo].[fRPBaoCao04] ()
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    IdNguon int,
	TenNguon nvarchar(100),
	SoLuongDon int,
    SoluongShip int,
    DuKienThu decimal(18, 2)
)
AS BEGIN	
	
	Return
END






GO

