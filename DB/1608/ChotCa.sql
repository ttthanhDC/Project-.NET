USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[ChotCa]    Script Date: 08/16/2017 00:14:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChotCa](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NgayChot] [datetime] NULL,
	[TienThuDuoc] [decimal](18, 2) NULL,
	[NguoiChot] [nvarchar](100) NULL,
	[GioChot] [nvarchar](100) NULL
) ON [PRIMARY]

GO

