USE [DB_SYS_GREEN]
GO

/****** Object:  Table [dbo].[LuuChuyenDongTien]    Script Date: 08/12/2017 16:38:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LuuChuyenDongTien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ngay] [datetime] NULL,
	[SoTien] [decimal](18, 2) NULL,
	[MaNganHangChi] [int] NULL,
	[MaNganHangThu] [int] NULL,
	[GhiChu] [nvarchar](255) NULL,
	[NgayTao] [datetime] NULL,
	[NguoiTao] [nvarchar](100) NULL,
	[IdKetoan] [int] NULL
) ON [PRIMARY]

GO


