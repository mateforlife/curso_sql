/* MOSTRAR FUNCIONES */
SHOW FUNCTION STATUS WHERE db=DATABASE();

/* FUNCIONES */


/* POR SI HAY ERROR AL CREAR FUNCION */
SET GLOBAL log_bin_trust_function_creators = 1;

/*CREAR FUNCION */

DELIMITER //

CREATE FUNCTION agregar_dias(fecha DATE, dias INT)
RETURNS DATE /* tipo de dato que retornará la función */

BEGIN
    RETURN fecha + INTERVAL dias DAY;
END//

DELIMITER ;

/*CREAR FUNCION */

DELIMITER //

CREATE FUNCTION obtener_paginas()
RETURNS INT /* tipo de dato que retornará la función */

BEGIN
    SET @paginas = (SELECT (ROUND(RAND() * 100) * 4 ));
    RETURN @paginas;
END//

DELIMITER ;


DELIMITER //

CREATE FUNCTION disponible_prestamo(libro INT)
RETURNS VARCHAR(15)

BEGIN
    RETURN (SELECT IF(stock > 1, 'Disponible', 'No Disponible') FROM libros WHERE libro_id = libro);
END//

DELIMITER ;
