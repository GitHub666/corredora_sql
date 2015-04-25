USE [corredora]
GO
/**** Object: StoredProcedure [dbo].[sp_CreaArrendatario] Script Date: 25-04-2015 1:51:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_CreaArrendatario]
	@rut INT,
	@dv CHAR(1),
	@nombre VARCHAR(50),
	@paterno VARCHAR(50),
	@materno VARCHAR(50),
	@fono INT,
	@direccion VARCHAR(200),
	@correo VARCHAR(200)
AS
	BEGIN
		DECLARE @count AS INT
			SET @count = (SELECT COUNT(1) FROM ARRENDATARIO WHERE RUTARRENDATARIO = @rut)
			IF @count = 0
			BEGIN
				INSERT INTO ARRENDATARIO VALUES (@rut, @dv, @nombre, @paterno, @materno, @fono, @direccion, @correo)
				SELECT 'ARRENDATARIO REGISTRADO' AS OK
			END
			IF @count = 1
			BEGIN
				SELECT 'ARRENDATERIO EXISTE' AS ERROR
			END
END