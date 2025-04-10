-- models/produits_normalises.sql

WITH categories AS (
  SELECT
    ROW_NUMBER() OVER (ORDER BY categorie_produit) AS id_categorie,
    categorie_produit
  FROM (
    SELECT DISTINCT categorie_produit
    FROM {{ source('techstore', 'produits') }}
  )
),
produits AS (
  SELECT *
  FROM {{ source('techstore', 'produits') }}
)

SELECT
  p.id_produit,
  p.nom_produit,
  c.id_categorie
FROM produits p
JOIN categories c
  ON p.categorie_produit = c.categorie_produit
