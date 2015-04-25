USE [corredora]
GO
/**** Object: StoredProcedure [dbo].[sp_CreaContrato] Script Date: 25-04-2015 01:50:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-Crea los contratos de Arriendo, con sus respectivo Detalle de Cuotas de Arriendo
--Se realizan Validaciones de Rut, Propiedad no sea = a la Arrendada(mismo inmueble)
USE [corredora]
GO
/**** Object: UserDefinedFunction [dbo].[fn_CalculoPagos] Script Date: 25-04-2015 01:50:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--la Funcion opera con solo 2 datos para construir IdContrato, FechaPactadaParaPago
ALTER FUNCTION [dbo].[fn_CalculoPagos](@id int, @i_fecha_inicial date)
RETURNS @Tabla TABLE
(
idCon int,
ePago int,
fec_pago date,
fecha_pago date
)

AS
BEGIN
DECLARE @idContrato int
DECLARE @estadoPago int
DECLARE @tmp date
  
  SELECT @idContrato=@id
  SELECT @estadoPago=3
  SELECT @tmp = NULL
   
 INSERT INTO @Tabla
 SELECT @idContrato,@estadoPago,@tmp,DATEADD(month,n,F.fecha_inicio)
 FROM NUMEROCUOTAS AS N
 CROSS JOIN (VALUES(@i_fecha_inicial)) AS F(fecha_inicio)
 WHERE N.n <= 12
  
 RETURN
END