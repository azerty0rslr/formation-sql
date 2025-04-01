# 1 - Effacer la base de données si elle existe
DROP DATABASE IF EXISTS spa;
# 2 - Créer la base de données
CREATE DATABASE spa CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# 3 -Préciser la base de données sur laquelle je travaille
USE spa;
DROP TABLE IF EXISTS chat;
# 4 -Création de la table
CREATE TABLE IF NOT EXISTS chat(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    age TINYINT NOT NULL,
    couleur_id INT NULL, 
    CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS couleur;
CREATE TABLE IF NOT EXISTS couleur(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_couleur PRIMARY KEY (id)
)ENGINE=InnoDB;

ALTER TABLE chat ADD CONSTRAINT fk_couleur FOREIGN KEY (couleur_id) REFERENCES couleur(id);

INSERT INTO couleur (nom) VALUES
('marron'),
('bleu'),
('vert');

INSERT INTO chat (nom, age, couleur_id) VALUES
('Maine coon', '20', 1),
('Siamois', '15', 2),
('Bengal', '18', 1),
('Scottish Fold', '10', 1),
('Domestique', '21', null);

# 5 - TP partie 2 pour selectionner une partie du tableau
# SELECT * FROM chat WHERE id = 2
# SELECT * FROM chat ORDER BY nom, age
# SELECT * FROM chat WHERE age > 11 AND age < 19
# SELECT * FROM chat WHERE nom LIKE '%sia%'
# SELECT * FROM chat WHERE nom LIKE '%a%'
# SELECT AVG(age) AS AverageAge FROM chat
# SELECT COUNT(nom) AS CountCat FROM chat
# SELECT COUNT(nom) AS CountYeux FROM chat WHERE yeux LIKE 'marron'
# SELECT * FROM chat ORDER BY age ASC LIMIT 1 
# SELECT * FROM chat ORDER BY age DESC LIMIT 1 

# 6 - TP partie 3 pour JOIN deux tables
#	SELECT chat.id AS id,
#	chat.nom AS nom,
#	couleur.nom AS yeux,
#	chat.age AS age
#	FROM chat INNER JOIN couleur ON chat.couleur_id = couleur.id
#	SELECT * FROM chat WHERE id = 5;

#	SELECT couleur.nom AS couleur,
#	COUNT(chat.id) AS nb_chat FROM couleur INNER JOIN chat ON couleur.id = chat.couleur_id GROUP BY(couleur.id)

#	SELECT couleur.nom AS couleur,
#	COUNT(chat.id) AS nb_chat FROM couleur LEFT JOIN chat ON couleur.id = chat.couleur_id GROUP BY(couleur.id)
