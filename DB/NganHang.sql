USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[NganHang]    Script Date: 08/12/2017 17:09:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NganHang](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NULL,
	[IsShow] [int] NULL
) ON [PRIMARY]

GO


