-- =============================================
-- Author:		Christopher Ruz
-- Create date: 23-04-2015
-- Description:	Vista encargada de obtener a los
--				dueños con mas de 2 propiedades
-- =============================================

--Crear vista
CREATE VIEW vw_masDeDosPropiedades AS
--Definir select a los campos necesarios
SELECT D.RUTDUENO, D.NOMBRE, D.APATERNO
--Definir from a las tablas necesarias
FROM DUENO D, PROPIEDAD C
--Definir condicion de consulta 
WHERE D.RUTDUENO = C.RUTDUENO
--Definir agrupacion de datos
GROUP BY D.RUTDUENO, D.NOMBRE, D.APATERNO, D.AMATERNO
--Definir condicion para la agrupacion
HAVING COUNT(DISTINCT C.IDPROPIEDAD) >=2;