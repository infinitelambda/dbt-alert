use role sysadmin;
use warehouse wh_compute;
create or replace database dbt_alert with comment = 'Database for dbt_alert';

use role accountadmin;
create or replace resource monitor rm_dbt_alert with
  credit_quota = 1
  frequency = daily
  start_timestamp = immediately
  notify_users = ("<YOUR_USER>")
  triggers
    on 100 percent do suspend_immediate
;

create or replace warehouse wh_dbt_alert with
  warehouse_type = 'standard'
  warehouse_size = 'xsmall'
  auto_suspend = 60
  auto_resume = true
  initially_suspended = true
  resource_monitor = rm_dbt_alert
  comment = 'Warehouse for dbt_alert';

use role securityadmin;
create or replace role role_dbt_alert with comment = 'Role for dbt_alert';

grant usage on warehouse wh_dbt_alert to role role_dbt_alert;
grant usage on database dbt_alert to role role_dbt_alert;
grant all privileges on database dbt_alert to role role_dbt_alert;
grant all privileges on all schemas in database dbt_alert to role role_dbt_alert;
grant all privileges on future schemas in database dbt_alert to role role_dbt_alert;
grant all privileges on all tables in database dbt_alert to role role_dbt_alert;
grant all privileges on future tables in database dbt_alert to role role_dbt_alert;
grant all privileges on all views in database dbt_alert to role role_dbt_alert;
grant all privileges on future views in database dbt_alert to role role_dbt_alert;
grant usage, create schema on database dbt_alert to role role_dbt_alert;
grant role role_dbt_alert to role sysadmin;

use role role_dbt_alert;
use database dbt_alert;
