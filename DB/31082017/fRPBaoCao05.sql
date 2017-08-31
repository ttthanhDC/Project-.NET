USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fRPBaoCao05]    Script Date: 31/08/2017 11:53:20 CH ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE FUNCTION [dbo].[fRPBaoCao05] ()
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    MaChuyenDi nvarchar(100),
	MaLoTrinhId int,
	MaShipper nvarchar(100),
    HoTen nvarchar(100),
    Nhan int,
	Di int,
	Trave int,
	DuKienThu decimal(18,2)
)
AS BEGIN	
	
	Return
END






GO

