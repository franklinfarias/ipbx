USE asteriskcdrdb;
--
-- Functions
--
DELIMITER $$
CREATE FUNCTION asteriskcdrdb.fncTimeToInt (tTime TIME)
RETURNS int(11)
COMMENT 'Retorna Hora no formato inteiro'
BEGIN
    RETURN HOUR(tTime) * 3600 + MINUTE(tTime) * 60 + SECOND(tTime);
END$$

DELIMITER ;

DELIMITER $$
CREATE FUNCTION `fncIntToTime` (dtData INT)
RETURNS varchar(12)
COMMENT 'Retorna Hora no formato HH:MM:SS'
BEGIN
    DECLARE sumHoras INT;
    DECLARE horaCalc INT;
    DECLARE minutoCalc INT;
    DECLARE segundoCalc INT;
    /*-->> Método para cálculo de HORAS*/
    SET sumHoras = dtData;
    SET horaCalc = FLOOR(sumHoras / 3600);
    SET sumHoras = sumHoras - (horaCalc * 3600);
    SET minutoCalc = FLOOR(sumHoras / 60);
    SET sumHoras = sumHoras - (minutoCalc * 60);
    SET segundoCalc = sumHoras;
    RETURN CONCAT(lpad(horaCalc, length(horaCalc), '0'),':',lpad(minutoCalc, 2, '0'),':',lpad(segundoCalc, 2, '0'));
END$$

DELIMITER ;
