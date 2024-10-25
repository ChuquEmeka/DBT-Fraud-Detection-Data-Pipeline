
    
    

with all_values as (

    select
        IsFraud as value_field,
        count(*) as n_records

    from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical
    group by IsFraud

)

select *
from all_values
where value_field not in (
    '0','1'
)


