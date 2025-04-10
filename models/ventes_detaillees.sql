SELECT
  v.id_vente,
  p.nom_produit,
  c.nom_client,
  r.nom_region,
  v.quantite,
  v.montant_total
FROM {{ source('techstore', 'ventes') }} v
JOIN {{ source('techstore', 'produits') }} p ON v.id_produit = p.id_produit
JOIN {{ source('techstore', 'clients') }} c ON v.id_client = c.id_client
JOIN {{ source('techstore', 'regions') }} r ON v.id_region = r.id_region
