--ephemeral.sql

{{ config(
materialized="table",
schema="dbt_teste",
database="customers_teste_criacao"
)
}}

SELECT * FROM {{source('sistema_curso','customers')}}
