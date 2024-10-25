
    
    

select
    TransactionID as unique_field,
    count(*) as n_records

from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical
where TransactionID is not null
group by TransactionID
having count(*) > 1


