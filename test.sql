CREATE TABLE eleves nom, prenom, classe, age ;;
INSERT INTO eleves VALUES "guidado", "hairiya", "seconde" , 18 ;;
INSERT INTO eleves VALUES "granger", "theo", "seconde" , 16 ;;
INSERT INTO eleves VALUES "aviron", "alan", "seconde" , 17 ;;
INSERT INTO eleves VALUES "fournier", "max", "seconde" , 16 ;;
INSERT INTO eleves VALUES "Durand", "thomas", "premiere" , 18 ;; 
INSERT INTO eleves VALUES "Moreau", "elise", "terminale" , 19;;
SELECT * FROM eleves WHERE eleves.age <= 20 ;;
SELECT * FROM eleves WHERE eleves.age <= 18 ;;
SELECT eleves.nom FROM eleves WHERE eleves.age <= 17 ;;
SELECT eleves.nom, eleves.prenom FROM eleves WHERE eleves.age <= 20 ;;
UPDATE eleves SET nom = "aviro" WHERE eleve.nom = "aviron" ;;
SELECT * FROM eleves WHERE eleve.nom = "aviro" ;;