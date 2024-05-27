
# Mini SQL INTERPRETER

Il s'agit d'un mini interpréteur SQL qui permet d'effectuer des requêtes simples sur une base de données. Vous pouvez créer des tables, y insérer des données, les modifier, les supprimer et supprimer les tables.

## Installation

Pour exécuter ce projet, il suffit de taper la commande :

```bash
./loop test.sql
```
où `test.sql` est un fichier qui contient des requêtes compatibles avec la syntaxe de notre langage.

## Syntaxe

### Créer une Table
Pour créer une table, utilisez la requête suivante : 
```SQL
CREATE TABLE nom_table nom_col1, nom_col2, ..., nom_coln ;;
```

### Insérer des Données
Les données à insérer peuvent être de type entier ou de type chaîne de caractères. Pour entrer une chaîne de caractères, il faut la mettre entre guillemets. La requête est la suivante : 
```SQL
INSERT INTO nom_table VALUES val1, "val2", ... , valn ;;
```

### Sélectionner des Données Particulières
Vous pouvez sélectionner les données de toutes les colonness de la table (en utilisant un `*`) ou les données de colonnes spécifiques. De plus, cette sélection se fait selon une ou plusieurs conditions.

```SQL
SELECT * FROM nom_table WHERE condition ;;  -- sélectionne toutes les colonnes
SELECT nom_col1 FROM nom_table WHERE condition1 AND condition2 ;;  -- sélectionne la colonne nom_col1 qui satisfait les conditions condition1 et condition2
SELECT nom_col1, nom_col2 FROM nom_table WHERE NOT condition ;;  -- sélectionne les colonnes nom_col1 et nom_col2 qui ne satisfont pas la condition
SELECT nom_col1 FROM nom_table WHERE (condition1 AND condition2) OR condition3 ;;  -- sélectionne la colonne nom_col1 qui satisfait condition1 et condition2 ensemble ou seulement condition3
```

### Mettre à Jour
Vous pouvez modifier les valeurs attribuées à certaines colonnes.

```SQL
UPDATE nom_table SET nom_col = valeur WHERE condition ;;
```

### Supprimer des Données
Vous pouvez supprimer une ligne dans une table.

```SQL
DELETE FROM nom_table WHERE condition ;;
```
Cette requête va supprimer la ligne de la table `nom_table` qui satisfait la condition.

### Supprimer une Table
Vous pouvez supprimer une table entière.

```SQL
DROP TABLE nom_table ;;
```
Cette requête va supprimer la table `nom_table`.

## Test
Le code est fourni avec deux fichiers `test.sql` et `test2.sql` qui permettent de tester l'ensemble des requêtes disponibles.
