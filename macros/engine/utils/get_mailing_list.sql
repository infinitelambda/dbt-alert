{% macro get_mailing_list() -%}
  {{ return(adapter.dispatch('get_mailing_list', 'dbt_alert')()) }}
{%- endmacro %}

{% macro default__get_mailing_list() -%}

  {% set mailing_list = var("dbt_alert__mailing_list", "") %}
  {% if not mailing_list %}
    {{ exceptions.raise_compiler_error("Mailing list has not been configured yet!") }}
  {% endif %}
  
  {{ return(mailing_list) }}
  
{%- endmacro %}