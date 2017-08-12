USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[ChiTietThu]    Script Date: 08/12/2017 16:38:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ChiTietThu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[IdNgayHD] [int] NULL,
	[SoTien] [decimal](18, 2) NULL,
	[MaNganHang] [int] NULL,
	[MaGiaoDich] [nvarchar](100) NULL,
	[TinhTrang] [int] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[LoaiThu] [int] NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[IdKeToan] [int] NULL
) ON [PRIMARY]

GO


