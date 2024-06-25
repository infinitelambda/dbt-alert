{% macro create_or_get_resource(create=false, usage_role=none) -%}
  {{ return(adapter.dispatch('create_or_get_resource', 'dbt_alert')(create=create, usage_role=usage_role)) }}
{%- endmacro %}

{% macro default__create_or_get_resource(create=false, usage_role=none) -%}

  {% set integration_id = var("dbt_alert_notification_integration_id", "ni_dbt_alert__" ~ project_name ~ "__" ~ target.name) %}
  {% set usage_role = var("dbt_alert_notification_integration_usage_role", target.role) %}
  {% set allowed_emails = dbt_alert.get_mailing_list() %}
  
  {% set query -%}

    use role accountadmin;
    create or replace notification integration {{ integration_id }}
      type = email
      allowed_recipients = ('{{ allowed_emails }}')
      enabled = true
      comment = "{{ target.name | upper }} Notification Integration object used for {{ project_name }} dbt project";
    grant usage on integration {{ integration_id }} to role {{ usage_role }};

  {%- endset %}

  {{ log("query: " ~ query, info=True) if create }}
  {{ return(integration_id) }}
  
{%- endmacro %}