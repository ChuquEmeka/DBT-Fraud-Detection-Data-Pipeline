
    
    

with all_values as (

    select
        SuspiciousFlag as value_field,
        count(*) as n_records

    from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.br_fraud_detection_raw_data_historical
    group by SuspiciousFlag

)

select *
from all_values
where value_field not in (
    '0','1'
)


