# 1 - Effacer la base de données si elle existe
DROP DATABASE IF EXISTS netflix;
# 2 - Créer la base de données
CREATE DATABASE netflix CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# 3 - Préciser la base de données sur laquelle je travaille
USE netflix;
DROP TABLE IF EXISTS film;
# 4 - Création des tables
CREATE TABLE IF NOT EXISTS film(
	id INT NOT NULL AUTO_INCREMENT,
    titre VARCHAR(50) NOT NULL,
    sortie DATE NOT NULL,
    categ_id INT NOT NULL, 
    CONSTRAINT pk_film PRIMARY KEY (id)
)ENGINE=InnoDB;

DROP TABLE IF EXISTS categ;
CREATE TABLE IF NOT EXISTS categ(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    CONSTRAINT pk_categ PRIMARY KEY (id)
)ENGINE=InnoDB;

# 5 - Clés étrangères
ALTER TABLE film ADD CONSTRAINT fk_categ FOREIGN KEY (categ_id) REFERENCES categ(id);

INSERT INTO categ (nom) VALUES
('Science Fiction'),
('Thriller');

INSERT INTO film (titre, sortie, categ_id) VALUES
('STAR WARS', '1977-05-25', 1),
('THE MATRIX', '1999-06-23', 1),
('PULP FICTION', '1994-10-26', 2);

# SELECT film.id AS id,
# film.titre AS titre,
# film.sortie AS sortie,
# categ.nom AS categorie
# FROM film INNER JOIN categ ON film.categ_id = categ.id WHERE categ.nom = 'Science Fiction'

# SELECT categ.nom AS categorie,
# COUNT(film.id) AS nb_film FROM categ INNER JOIN film ON categ.id = film.categ_id GROUP BY(categ.id)
