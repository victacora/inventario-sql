DELIMITER //

CREATE PROCEDURE spSelectPersona()
BEGIN
    SELECT 
        p.pers_identificacion AS Identificacion,
        p.pers_nombre_razonsocial AS Nombres,
        p.pers_apellido AS Apellido,
        p.pers_telefono AS Telefono,
        p.pers_direccion AS Direccion,
        p.pers_correo_electronico AS Email,
        td.doc_tipo_documento AS TipoDocumento,
        pa.pais_nombre AS Pais,
        d.dep_nombre AS Departamento,
        c.ciu_nombre AS Ciudad
    FROM tbl_persona p
    INNER JOIN tbl_tipo_documento td ON p.tbl_tipo_documento_doc_id = td.doc_id
    INNER JOIN tbl_ciudad c ON p.tbl_ciudad_ciu_id = c.ciu_id
    INNER JOIN tbl_departamento d ON c.tbl_departamento_dep_id = d.dep_id
    INNER JOIN tbl_pais pa ON d.tbl_pais_pais_id = pa.pais_id;
END//

DELIMITER ;
