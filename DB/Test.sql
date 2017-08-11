USE [DB_SYS_GREEN]
GO

/****** Object:  StoredProcedure [dbo].[PTest]    Script Date: 08/09/2017 08:27:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PTest]
	-- Add the parameters for the stored procedure here
	--@NgayHD Nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Test
	return
END



GO

