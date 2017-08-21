USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 22/08/2017 12:49:34 SA ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NhaCungCap](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNCC] [nvarchar](50) NULL,
	[TenNCC] [nvarchar](100) NULL,
	[SoDT] [nvarchar](20) NULL,
	[Tinh] [nvarchar](20) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[LoaiDichVu] [nvarchar](50) NULL,
	[GhiChu] [nvarchar](250) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](50) NULL
) ON [PRIMARY]

GO

