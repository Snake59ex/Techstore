-- models/categories.sql

SELECT
  ROW_NUMBER() OVER (ORDER BY categorie_produit) AS id_categorie,
  categorie_produit
FROM (
  SELECT DISTINCT categorie_produit
  FROM {{ source('techstore', 'produits') }}
) AS uniques
