-- Insertar un tipo de documento
DELIMITER //
create procedure spInsertTypeDoc(IN p_tipodoc VARCHAR(45))
begin
	insert into tbl_tipo_documento(doc_tipo_documento) 
    values(p_tipodoc);
end//
DELIMITER ;

-- Actualizar un tipo de documento
DELIMITER //
CREATE PROCEDURE spUpdateTypeDoc(IN p_docId INT, IN p_tipodoc VARCHAR(45))
BEGIN
    UPDATE tbl_tipo_documento
    SET doc_tipo_documento = p_tipodoc
    WHERE doc_id = p_docId;
END//
DELIMITER ;

-- Mostrar todos los tipos de documentos
DELIMITER //
CREATE PROCEDURE spGetAllTypeDoc()
BEGIN
    SELECT doc_id, doc_tipo_documento FROM tbl_tipo_documento;
END//
DELIMITER ;

-- Elimiar un tipo de documento
DELIMITER //
CREATE PROCEDURE spDeleteTypeDoc(IN p_docId INT)
BEGIN
    DELETE FROM tbl_tipo_documento
    WHERE doc_id = p_docId;
END//
DELIMITER ;