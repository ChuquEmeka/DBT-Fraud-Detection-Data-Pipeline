select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        AccountStatus as value_field,
        count(*) as n_records

    from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_users_dimension
    group by AccountStatus

)

select *
from all_values
where value_field not in (
    'Active','Suspended','Closed'
)



      
    ) dbt_internal_test