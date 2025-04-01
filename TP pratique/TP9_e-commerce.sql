DROP DATABASE IF EXISTS commerce;
CREATE DATABASE commerce CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE commerce;

CREATE TABLE article (
  id INT  NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  prix FLOAT NOT NULL,
  CONSTRAINT pk_article PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE commande (
  id INT NOT NULL AUTO_INCREMENT,
  id_clients INT NOT NULL,
  date_achat DATETIME NOT NULL,
  id_article INT NOT NULL,
  nombre INT NOT NULL,
  CONSTRAINT pk_commande PRIMARY KEY(id)
)ENGINE=INNODB;

CREATE TABLE clients (
  id INT NOT NULL AUTO_INCREMENT,
  nom VARCHAR(100) NOT NULL,
  prenom VARCHAR(100) NOT NULL,
  CONSTRAINT pk_clients PRIMARY KEY (id)
)ENGINE=INNODB;

ALTER TABLE commande ADD CONSTRAINT fk_clients FOREIGN KEY (id_clients) REFERENCES clients (id);
ALTER TABLE commande ADD CONSTRAINT fk_article FOREIGN KEY (id_article) REFERENCES article (id);

##############
## Les données
##############

INSERT INTO article (nom, prix) VALUES
('PlayStation 5', 400),
('X box', 350),
('Machine à café', 300),
('PlayStation 3', 100);

INSERT INTO clients (nom, prenom) VALUES 
('PITT', 'Brad'), 
('CLONEY', 'George'), 
('DUJARDIN', 'Jean');

INSERT INTO commande (id_clients, date_achat, id_article, nombre) VALUES
(1, '2024-09-08 10:15:00', 2, 1),
(1, '2024-09-08 10:15:00', 3, 1),
(1, '2024-09-08 10:15:00', 4, 2);


#################
## Les sélections
#################

# 4- Afficher la commande de Brad PITT
SELECT clients.nom AS nom,
clients.prenom AS prenom,
commande.date_achat AS date_achat,
article.nom AS produit,
article.prix AS prix,
commande.nombre AS nb,
article.prix * commande.nombre AS total 
FROM commande
INNER JOIN clients ON commande.id_clients = clients.id
INNER JOIN article ON commande.id_article = article.id
WHERE clients.nom = 'PITT' AND clients.prenom = 'Brad';
