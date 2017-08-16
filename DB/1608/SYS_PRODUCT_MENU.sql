USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[SYS_PRODUCT_MENU]    Script Date: 08/17/2017 01:55:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SYS_PRODUCT_MENU](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuId] [int] NULL,
	[ProductId] [int] NULL
) ON [PRIMARY]

GO

