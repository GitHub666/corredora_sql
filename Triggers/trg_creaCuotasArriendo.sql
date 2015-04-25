USE [corredora]
GO
/**** Object: Trigger [dbo].[tgr_CreaCuotasArriendo] Script Date: 25-04-2015 01:52:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
ALTER TRIGGER [dbo].[tgr_CreaCuotasArriendo]
ON [dbo].[CONTRATO]
FOR INSERT

AS 
--declaracion de las variables a utilizar
DECLARE @idContrato AS INT
DECLARE @fecha AS DATE

BEGIN

--creo la tabla temporal que obtendra el ultimo ID del contrato recien hecho
 SELECT IDCONTRATO,IDPROPIEDAD,VALORARRIENDO,RUTARRENDATARIO,FECHACONTRATO,FECHATERMINO
 INTO #tmpContrato
 FROM CONTRATO
 ORDER BY IDCONTRATO DESC
  
--Asignacion de los datos a las variables que se usaran

SET @idContrato = (SELECT TOP 1 IDCONTRATO FROM #tmpContrato ORDER BY IDCONTRATO DESC)
SET @fecha = (SELECT FECHACONTRATO FROM CONTRATO WHERE IDCONTRATO = @idContrato)

--instrucciones que se ejecutaran para cumplir el requerimiento

INSERT INTO CUOTASARRIENDO (IDCONTRATO, IDESTADOPAGO, FECHAPAGO, FECHA_PACTO)
SELECT * FROM fn_CalculoPagos (@idContrato,@fecha)
  

END
--eliminamos las tablas que se usaron y cuando se ejecute el trigger nuevamente no de error
DROP TABLE #tmpContrato