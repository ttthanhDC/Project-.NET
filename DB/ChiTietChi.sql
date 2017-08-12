USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[ChiTietChi]    Script Date: 08/12/2017 16:38:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietChi](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[NoiDungChi] [nvarchar](255) NULL,
	[SoTien] [decimal](18, 2) NULL,
	[MaNganHang] [int] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[NgayTao] [datetime] NULL,
	[IdKeToan] [int] NULL
) ON [PRIMARY]

GO





