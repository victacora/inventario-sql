DELIMITER //
CREATE PROCEDURE spDeleteProduct(IN p_product_id INT)
BEGIN
    DELETE FROM tbl_producto
    WHERE prod_id = p_product_id;
END //
DELIMITER ;