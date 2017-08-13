USE [DB_SYS_GREEN]
GO

/****** Object:  View [dbo].[vBC05]    Script Date: 08/13/2017 15:51:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vBC05] AS
 select lst.MaLoTrinh,s.SHIPER_ID,s.NAME,lst.NgayTao from  LoTrinhShipper lst
LEFT JOIN SHIPER s ON s.SHIPER_ID = lst.ShipID



GO

