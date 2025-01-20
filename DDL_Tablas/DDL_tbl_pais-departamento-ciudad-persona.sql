DELIMITER //
CREATE PROCEDURE spSelectPaisDDL ()
BEGIN
    SELECT 
	pais_id as id,
	pais_codigo as codigo,
	pais_nombre as pais
	FROM tbl_pais WHERE pais_id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectDepartamentoDDL ()
BEGIN
    SELECT
	dep.dep_id as id,
	dep.dep_codigo as codigo,
	dep.dep_nombre as departamento,
	pai.pais_nombre as pais
	FROM tbl_departamento as dep
    INNER JOIN tbl_pais as pai ON dep.tbl_pais_pais_id=pai.pais_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectCiudadDDL ()
BEGIN
    SELECT
	ciu.ciu_id as id,
	ciu.ciu_codigo as codigo,
	ciu.ciu_nombre as ciudad,
	dep.dep_nombre as departamento
	FROM tbl_ciudad as ciu
    INNER JOIN tbl_departamento as dep ON ciu.tbl_departamento_dep_id=dep.dep_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE spSelectPersona (
 SELECT
	per.pers_id as id,
	per.pers_identificacion as Identidad, 
	CONCAT(per.pers_nombre_razonsocial, " ", per.pers_apellido) AS "Nombre Completo", 
	pai.pais_nombre as Pais
	FROM tbl_persona as per
    INNER JOIN tbl_tipo_documento as doc ON per.tbl_tipo_documento_doc_id=doc.doc_id
	INNER JOIN tbl_pais as pai ON per.tbl_pais_pais_id=pai.pais_id;
END //
DELIMITER ;