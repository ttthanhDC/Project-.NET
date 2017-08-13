USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fCheckStatusLoTrinh]    Script Date: 08/13/2017 15:52:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[fCheckStatusLoTrinh] (@input int,@trangThai nvarchar(50))
RETURNS int
AS BEGIN
    DECLARE @check int
	DECLARE @Count int
	DECLARE @Count1 int
    SET @Count = (Select Count(*) from NgayHoaDon where IdlotrinhShipper = @input);
	SET @Count1 = (Select Count(*) from NgayHoaDon where IdlotrinhShipper = @input and TrangThai = @trangThai);
    if @Count != @Count1
		BEGIN
			SET @check = 0;
		END
	ELSE
		BEGIN
			SET @check = 1;
		END
		
    RETURN @check
END
GO

