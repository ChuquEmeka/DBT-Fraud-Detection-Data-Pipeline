
    
    

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


