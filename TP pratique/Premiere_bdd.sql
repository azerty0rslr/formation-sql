# 1 - Effacer la base de données si elle existe
DROP DATABASE IF EXISTS zoo;
# 2 - Créer la base de données
CREATE DATABASE zoo CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
# 3 -Préciser la base de données sur laquelle je travaille
USE zoo;
# 4 -Création de la table
CREATE TABLE chat(
	id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    yeux VARCHAR(20) NOT NULL,
    age INT NOT NULL,
    CONSTRAINT pk_chat PRIMARY KEY (id)
)ENGINE=InnoDB;
