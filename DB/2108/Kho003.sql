USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[Kho003]    Script Date: 22/08/2017 12:06:47 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kho003](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NhaCungCap] [int] NULL,
	[Ten] [nvarchar](100) NULL,
	[SoDT] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Ngay] [datetime] NULL,
	[Kho] [int] NULL,
	[GhiChu] [nvarchar](250) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL,
	[MaPhieuXuat] [nvarchar](50) NULL,
	[MaPhieuNhap] [nvarchar](50) NULL,
	[Type] [int] NULL
) ON [PRIMARY]

GO

