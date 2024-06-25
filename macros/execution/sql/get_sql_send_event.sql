{% macro get_sql_send_event(query) -%}
  {{ return(adapter.dispatch("get_sql_send_event", "dbt_alert")(query=query)) }}
{%- endmacro %}

{% macro default__get_sql_send_event(query) -%}

  {% set query = "TODO v2 use `SYSTEM$SEND_SNOWFLAKE_NOTIFICATION`" %}
  {{ exceptions.raise_compiler_error("NotImplemented") }}
  {{ return(query) }}

{%- endmacro %}