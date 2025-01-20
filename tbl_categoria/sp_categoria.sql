
# Procedimiento Crear una Categoria 

DELIMITER $$
CREATE PROCEDURE spCreateCategory(
    IN p_descripcion VARCHAR(45)
)
BEGIN
    INSERT INTO tbl_categoria (cat_descripcion)
    VALUES (p_descripcion);
END $$
DELIMITER ;


# Procedimiento mostrar categoria

DELIMITER //
CREATE PROCEDURE spGetCategory()
BEGIN
    SELECT 
		cat_id AS Id,
        cat_descripcion AS Descripcion,
    FROM tbl_categoria;
END //
DELIMITER ;


# Procedimiento actualizar categoria 

DELIMITER //
CREATE PROCEDURE spUpdateCategory(
    IN p_cat_id INT,
    IN p_descripcion VARCHAR(45)
)
BEGIN
    UPDATE tbl_categoria 
    SET cat_descripcion = p_descripcion
    WHERE cat_id = p_cat_id;
END //
DELIMITER ;


# Delete Procedure 


DELIMITER $$
CREATE PROCEDURE spDeleteCategory(
    IN p_cat_id INT
)
BEGIN
    DELETE FROM tbl_categoria
    WHERE cat_id = p_cat_id;
END $$
DELIMITER ;


# Select Procedure DDL #


DELIMITER //
CREATE PROCEDURE spGetCategoryDDL()
BEGIN
    SELECT 
		cat_id AS Id,
        cat_descripcion AS Descripcion,
    FROM tbl_categoria;
END //
DELIMITER ;