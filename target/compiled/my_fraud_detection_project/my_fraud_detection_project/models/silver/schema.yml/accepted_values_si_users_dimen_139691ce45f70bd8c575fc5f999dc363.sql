
    
    

with all_values as (

    select
        AccountStatus as value_field,
        count(*) as n_records

    from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_users_dimension
    group by AccountStatus

)

select *
from all_values
where value_field not in (
    'Active','Suspended','Closed'
)


