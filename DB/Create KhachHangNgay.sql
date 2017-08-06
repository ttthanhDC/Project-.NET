USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[KhachHangNgay]    Script Date: 08/06/2017 14:11:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[KhachHangNgay](
	[ID] [int] NULL,
	[CustomerName] [nvarchar](255) NULL,
	[BirthDay] [date] NULL,
	[PhoneNumber] [varchar](20) NULL,
	[Email] [varchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[MaQuan] [nvarchar](50) NULL,
	[NgayHoaDonId] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

