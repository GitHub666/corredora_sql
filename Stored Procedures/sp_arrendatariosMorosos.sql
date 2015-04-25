USE [corredora]
GO
/****** Object:  StoredProcedure [dbo].[sp_ArrendatariosMorosos]    Script Date: 25-04-2015 00:44:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Abdon Sandoval
-- Create date: 24-04-2015
-- Description: Valida que el Estado de Pago Exista, luego muestra los datos ordenador de forma descendente por Valor Arriedo
-- =============================================
CREATE PROCEDURE [dbo].[sp_ArrendatariosMorosos]
@estado AS VARCHAR(50)

AS
BEGIN
DECLARE @count AS INT
SET @count = (SELECT COUNT(1) FROM CUOTASARRIENDO AS CU JOIN ESTADOPAGO AS E ON CU.IDESTADOPAGO = E.IDESTADOPAGO WHERE E.DESCRIPCION=@estado)

IF @count = 0
SELECT 'ESTADO NO EXISTE'
ELSE
BEGIN
SELECT A.NOMBRE, CO.VALORARRIENDO, CU.FECHA_PACTO, CU.FECHAPAGO, E.DESCRIPCION
FROM CUOTASARRIENDO AS CU JOIN ESTADOPAGO AS E ON CU.IDESTADOPAGO = E.IDESTADOPAGO JOIN CONTRATO AS CO ON CO.IDCONTRATO = CU.IDCONTRATO JOIN ARRENDATARIO AS A ON A.RUTARRENDATARIO = CO.RUTARRENDATARIO
where E.DESCRIPCION=@estado ORDER BY CO.VALORARRIENDO DESC
END
END