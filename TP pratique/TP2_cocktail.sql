# 1 - Effacer la base de données si elle existe
DROP DATABASE IF EXISTS invitation;
# 2 - Créer la base de données
CREATE DATABASE invitation CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# 3 -Préciser la base de données sur laquelle je travaille
USE invitation;
DROP TABLE IF EXISTS inv_personne;
# 4 -Création de la table
CREATE TABLE inv_personne(
	pers_id INT NOT NULL AUTO_INCREMENT,
    pers_prenom VARCHAR(100) NOT NULL,
    pers_nom VARCHAR(100) NOT NULL,
    pers_age INT NOT NULL,
    pers_inscription DATE NOT NULL,
    pers_statut TINYINT NOT NULL DEFAULT 1, -- 1 ok 0 pas ok
    pers_type ENUM ('membre','non membre') NOT NULL DEFAULT 'non membre',
    pers_description TEXT, #ou cv
    pers_salaire INT NOT NULL,
    CONSTRAINT pk_personne PRIMARY KEY (pers_id)
)ENGINE=InnoDB;

INSERT INTO inv_personne 
(pers_prenom, pers_nom, pers_age, pers_inscription, pers_statut, pers_type, pers_description, pers_salaire) VALUES
('Brad', 'PITT', '60', '1970-01-01', '1', 'non membre', 'lorem ipsum', '2000000'),
('George', 'CLONEY', '62', '1999-01-01', '1', 'membre', 'juste beau', '4000000'),
('Jean', 'DUJARDIN', '51', '1994-01-01', '0', 'membre', 'brice de nice', '1000000');

# SELECT MAX('pers_salaire') AS Salaire_Bas FROM inv_personne
# SELECT MIN('pers_salaire') AS Salaire_Bas FROM inv_personne
# SELECT pers_nom, pers_salaire FROM inv_personne ORDER BY pers_salaire ASC LIMIT 1 
# SELECT pers_nom, pers_salaire FROM inv_personne ORDER BY pers_salaire DESC LIMIT 1 
# SELECT AVG(pers_salaire) AS AverageSalaire FROM inv_personne
# SELECT COUNT(pers_nom) AS CountNb FROM inv_personne
# SELECT * FROM inv_personne WHERE pers_salaire BETWEEN 1000000 AND 4000000
# SELECT * FROM inv_personne WHERE pers_salaire BETWEEN UPPER('1000000') AND LOWER(4000000)
# SELECT * FROM inv_personne WHERE pers_prenom LIKE '%bra%'
# SELECT * FROM inv_personne ORDER BY pers_age
# SELECT COUNT(pers_nom) AS CountNbMb FROM inv_personne WHERE pers_type = 'membre'
# SELECT COUNT(pers_nom) AS CountNbMb FROM inv_personne WHERE pers_type = 'membre';
# SELECT COUNT(pers_nom) AS CountNbNMb FROM inv_personne WHERE pers_type = 'non membre'
