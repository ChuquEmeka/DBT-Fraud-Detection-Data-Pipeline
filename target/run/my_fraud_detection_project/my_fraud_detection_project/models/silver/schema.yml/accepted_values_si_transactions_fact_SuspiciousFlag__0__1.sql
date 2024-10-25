select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        SuspiciousFlag as value_field,
        count(*) as n_records

    from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact
    group by SuspiciousFlag

)

select *
from all_values
where value_field not in (
    '0','1'
)



      
    ) dbt_internal_test