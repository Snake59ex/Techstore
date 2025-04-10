-- models/clients_normalises.sql
{{ config(materialized='table') }}
WITH segments AS (
  SELECT
    ROW_NUMBER() OVER (ORDER BY segment_client) AS id_segment,
    segment_client
  FROM (
    SELECT DISTINCT segment_client
    FROM {{ source('techstore', 'clients') }}
  )
),
clients AS (
  SELECT *
  FROM {{ source('techstore', 'clients') }}
)

SELECT
  c.id_client,
  c.nom_client,
  c.email_client,
  s.id_segment
FROM clients c
JOIN segments s
  ON c.segment_client = s.segment_client
