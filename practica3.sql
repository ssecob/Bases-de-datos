SELECT 
    s.NombreCompania AS NombreCompaniaEnvio,
    COUNT(p.idEnvio) AS NumeroEnvios,
    UPPER(LEFT(c.Pais, 3)) AS PaisCliente
FROM 
    envios e
JOIN 
    companias_envio s ON e.idCompaniaEnvio = s.idCompaniaEnvio
JOIN 
    clientes c ON e.idCliente = c.idCliente
WHERE 
    c.Pais IN ('Alemania', 'México', 'Francia')
GROUP BY 
    s.NombreCompania, UPPER(LEFT(c.Pais, 3))
HAVING 
    COUNT(p.idEnvio) > 25;


SELECT 
    p.Cargo,
    CONCAT(p.Cantidad, ' €') AS Cantidad_con_Euro
FROM 
    pedidos p
JOIN 
    empleados e ON p.IDEmpleado = e.IDEmpleado
WHERE 
    UPPER(CONCAT(e.Nombre, ' ', e.Apellido)) = 'ANTONIO MORENO';
