DELIMITER //
CREATE PROCEDURE spTypeDocDDL()
BEGIN
    SELECT doc_id AS Id, doc_tipo_documento AS TipoDocumento FROM tbl_tipo_documento;
END//
DELIMITER ;