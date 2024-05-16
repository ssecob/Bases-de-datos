create database if not exists examen;

use examen;

create table if not exists examen.expediente_alumno(
	dni char(9),
    Nombre varchar(30) not null,
    ape1 varchar(30),
    ape2 varchar(30),
    calific1 decimal(4,2),
    calific2 decimal(4,2)
);

INSERT INTO examen.expediente_alumno(dni,Nombre,ape1,ape2,calific1,calific2) VALUES
('12345678D', 'pepe', 'gomez','cobo',5.1, 6.7),
('19945666D', 'juan', 'lopez','perez',4.9,5.1);

select * from expediente_alumno;


DELIMITER //

CREATE FUNCTION LINEA_INFORME (dni_alumno VARCHAR(20))
RETURNS VARCHAR(250)
reads sql data
BEGIN
	DECLARE v_dni CHAR(9);
    DECLARE v_nombre VARCHAR(100);
    DECLARE v_ape1 VARCHAR(100);
    DECLARE v_ape2 VARCHAR(100);
    DECLARE v_calific1 INT;
    DECLARE v_calific2 INT;
    DECLARE v_media DECIMAL(5,2);
    DECLARE v_estado VARCHAR(20);

    -- Obtener datos del alumno
    SELECT dni,nombre, ape1, ape2, calific1, calific2 
    INTO v_dni,v_nombre, v_ape1, v_ape2, v_calific1, v_calific2 
    FROM expediente_alumno
    WHERE dni = dni_alumno;

    -- Calcular media de calificaciones
    SET v_media = (v_calific1 + v_calific2) / 2;

    -- Determinar estado (aprobado/suspenso)
    IF v_media >= 5 THEN
        SET v_estado = 'aprobado';
    ELSE
        SET v_estado = 'suspenso';
    END IF;

    -- Construir texto
    RETURN CONCAT(UPPER(v_dni), ' ',UPPER(v_ape1), ' ', UPPER(v_ape2), ', ', 
                  UPPER(v_nombre), ' (', v_estado, ': ', v_media, ')');
END //

DELIMITER ;


select linea_informe('12345678D') as linea
union
select linea_informe('19945666D');

