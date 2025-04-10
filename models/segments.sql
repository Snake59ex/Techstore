-- models/segments.sql

SELECT
  ROW_NUMBER() OVER (ORDER BY segment_client) AS id_segment,
  segment_client
FROM (
  SELECT DISTINCT segment_client
  FROM {{ source('techstore', 'clients') }}
) AS uniques
