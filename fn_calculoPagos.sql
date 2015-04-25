CREATE FUNCTION fn_CalculoPagos(@id int, @i_fecha_inicial date)
RETURNS @Tabla TABLE
(
idCon  int,
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
 SELECT  @idContrato,@estadoPago,@tmp,DATEADD(month,n,F.fecha_inicio)
 FROM NUMEROCUOTAS AS N
 CROSS JOIN (VALUES(@i_fecha_inicial)) AS F(fecha_inicio)
 WHERE N.n <= 12
 
 RETURN
END
 
GO
