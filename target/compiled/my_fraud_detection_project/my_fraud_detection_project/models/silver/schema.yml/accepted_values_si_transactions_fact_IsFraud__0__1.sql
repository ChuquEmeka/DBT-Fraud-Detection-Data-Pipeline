
    
    

with all_values as (

    select
        IsFraud as value_field,
        count(*) as n_records

    from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact
    group by IsFraud

)

select *
from all_values
where value_field not in (
    '0','1'
)


