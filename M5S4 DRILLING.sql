-- 1. Inserte los datos de una empresa.
INSERT INTO empresa
VALUES 
    ('76066058-2', 'Comercial Jioh', 'Direccion Genérica', '123456789', 'correo@generico.cl', 'web.generico.cl');

-- 2. Inserte 5 herramientas.
INSERT INTO herramienta
VALUES
    (1, 'Taladro 220V 13mm', 3990),
    (2, 'Rotomartillo 220V 2.6Kg', 4690),
    (3, 'Cincelador 7.4Kg', 8890),
    (4, 'Demoledor 14.5Kg', 10290),
    (5, 'Cepillo Eléctrico 220V 82mm', 4190);

-- 3. Inserte 3 clientes.
INSERT INTO cliente
VALUES
    ('11111111-1', 'Clientea', 'CorreoA', 'DireccionA', '111111111'),
    ('22222222-2', 'Clienteb', 'CorreoB', 'DireccionB', '222222222'),
    ('33333333-3', 'Clientec', 'CorreoC', 'DireccionC', '333333333');

-- 4. Elimina el último cliente.
DELETE FROM cliente
WHERE rut = '33333333-3';

-- 5. Elimina la primera herramienta.
DELETE FROM herramienta
WHERE idherramienta = 1;

-- 6. Inserte 2 arriendos para cada cliente.
INSERT INTO arriendo (folio, fecha, dias ,valordia, garantia, herramienta_idherramienta, cliente_rut)
VALUES
    (1, '2020-01-15', 5, 4190, 41900, 5, '11111111-1'),
    (2, '2020-01-15', 5, 10290, 102900, 4, '11111111-1'),
    (3, '2020-01-25', 15, 8890, 88900, 3, '22222222-2'),
    (4, '2020-01-25', 15, 4690, 46900, 2, '22222222-2');

-- 7. Modifique el correo electrónico del primer cliente.
UPDATE cliente 
SET correo = 'CorreoModificadoA'
WHERE rut = '11111111-1';

-- 8. Liste todas las herramientas.
SELECT * FROM herramienta;

-- 9. Liste los arriendos del segundo cliente.
SELECT * FROM arriendo
WHERE cliente_rut = '22222222-2';

-- 10. Liste los clientes cuyo nombre contenga una a.
SELECT * FROM cliente
WHERE nombre 
LIKE '%a%';

-- 11. Obtenga el nombre de la segunda herramienta insertada.
--* Dado que Postgres no guarda el orden de insert, simplemente mostré la segunda herramienta
--* por orden de idherramienta.
SELECT nombre FROM herramienta
ORDER BY idherramienta
desc limit 1 offset 2;

-- 12. Modifique los primeros 2 arriendos insertados con fecha 15/01/2020.
--* Modifique la cantidad de días en los arriendos que cumplen las condiciones,
UPDATE arriendo
SET dias = 10
WHERE fecha = '2020-01-15';

-- 13. Liste Folio, Fecha y ValorDia de los arriendos de enero del 2020.
SELECT folio, fecha, valordia FROM arriendo
WHERE fecha >= '2020-01-01' AND fecha <= '2020-01-31';