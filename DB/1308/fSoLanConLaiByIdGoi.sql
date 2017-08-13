USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fSoLanConLaiByIdGoi]    Script Date: 08/13/2017 15:52:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[fSoLanConLaiByIdGoi] (@IdGoi int)
RETURNS  int
AS BEGIN	
	Declare @SolanconLai int;
	SET @SolanconLai = (select count(*) from NgayHoaDon where IDPackageChitietHD = @IdGoi and TrangThai != N'Hoàn Thành');
	Return @SolanconLai;
END



GO

