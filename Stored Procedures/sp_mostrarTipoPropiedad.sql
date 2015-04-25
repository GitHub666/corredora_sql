USE [corredora]
GO
/****** Object:  StoredProcedure [dbo].[sp_MuestraTipoPropiedad]    Script Date: 25-04-2015 02:48:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[sp_MuestraTipoPropiedad]
		@descripcion VARCHAR(50)
AS

BEGIN
DECLARE @desc VARCHAR(50)
	set @desc = @descripcion

IF @desc = @descripcion
		SELECT * FROM fn_TipoPropiedad(@desc)
	
ELSE IF	@desc = @descripcion
		SELECT  * FROM fn_TipoPropiedad(@desc)
	
ELSE IF	@desc = @descripcion
		SELECT * FROM fn_TipoPropiedad(@desc)
	
END