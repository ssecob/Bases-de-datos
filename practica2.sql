DELIMITER //
CREATE FUNCTION CALCULO_NIVEL(saldo DECIMAL(10,2))
RETURNS VARCHAR(10) 
deterministic no sql
BEGIN
    DECLARE nivel VARCHAR(10);
    
    IF saldo <= 5000 THEN
        SET nivel = 'PLATA';
    ELSEIF saldo > 5000 AND saldo <= 50000 THEN
        SET nivel = 'ORO';
    ELSE
        SET nivel = 'PLATINO';
    END IF;
    
    RETURN nivel;
END //
DELIMITER ;
