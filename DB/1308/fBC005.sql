USE [DB_SYS_GREEN]
GO

/****** Object:  UserDefinedFunction [dbo].[fBC005]    Script Date: 08/13/2017 15:52:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE FUNCTION [dbo].[fBC005] (@IdLotrinh int)
RETURNS  @rtnTable TABLE 
(
    -- columns returned by the function
    Nhan int,
    Di int,
    TraVe int,
    SoTienThu decimal(18, 2)
)
AS BEGIN	
	insert into @rtnTable(Nhan,Di,TraVe,SoTienThu)
	Select COUNT(Nhan) as Nhan ,COUNT(Di) as Di , COUNT(TraVe) as TraVe , SUM(SoTienThu) as SoTienThu  FROM (
	select COUNT(NHD.ID) as Nhan ,0 as Di , 0 as TraVe , SUM(SoTienThu) as SoTienThu
	from NgayHoaDon NHD
	Left join LoTrinhShipper lst on lst.ID = NHD.IdLotrinhShipper
	where NHD.IdLotrinhShipper = @IdLotrinh
	UNION 
	select 0 as Nhan ,COUNT(NHD.ID) as Di , 0 as TraVe , 0 as SoTienThu
	from NgayHoaDon NHD 
	Left join LoTrinhShipper lst on lst.ID = NHD.IdLotrinhShipper
	where NHD.IdLotrinhShipper = @IdLotrinh 
	AND NHD.TrangThai = N'Đang xử lý' 
	UNION 
	select 0 as Nhan ,0 as Di , COUNT(NHD.ID) as TraVe , 0 as SoTienThu
	from NgayHoaDon NHD 
	Left join LoTrinhShipper lst on lst.ID = NHD.IdLotrinhShipper
	where NHD.IdLotrinhShipper = @IdLotrinh 
	AND NHD.TrangThai = N'Trả về' 
	 
	) temp
	
	Return
END





GO

