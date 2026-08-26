{{ config(
    materialized='table',
    schema='gold'
)}}

WITH AGRUPAR AS (SELECT CustomerID,count(*) AS QT_PEDIDOS FROM {{source('sistema_curso','orders')}}
GROUP BY 1)

SELECT
C.CompanyName,
QT_PEDIDOS
FROM {{source('sistema_curso','customers')}} C
LEFT JOIN AGRUPAR A
ON C.CustomerID = A.CustomerID