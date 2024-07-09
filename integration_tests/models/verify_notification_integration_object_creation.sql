{{
  config(
    materialized = 'table',
    pre_hook = "show notification integrations like '{{ dbt_alert.create_or_get_resource() }}'"
  )
}}

select *
from table(result_scan(last_query_id()))