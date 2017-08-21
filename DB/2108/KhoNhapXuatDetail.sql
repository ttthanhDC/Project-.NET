USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[KhoNhapXuatDetail]    Script Date: 22/08/2017 12:07:07 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KhoNhapXuatDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[NhapKhoId] [int] NULL,
	[XuatKhoId] [int] NULL,
	[Product_Code] [nvarchar](50) NULL,
	[Product_Name] [nvarchar](100) NULL,
	[SoLuong] [int] NULL,
	[DonVi] [int] NULL,
	[HanSuDung] [datetime] NULL,
	[Gia] [nvarchar](50) NULL,
	[Kho] [int] NULL
) ON [PRIMARY]

GO

