USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[Kho001]    Script Date: 21/08/2017 12:19:52 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kho001](
	[ID] [int] NULL,
	[Product_Name] [nchar](100) NULL,
	[Product_ID] [int] NULL,
	[Product_Unit] [int] NULL,
	[Product_Unit_DK] [int] NULL,
	[Product_Unit_CL] [int] NULL,
	[Ngay] [datetime] NULL
) ON [PRIMARY]

GO

