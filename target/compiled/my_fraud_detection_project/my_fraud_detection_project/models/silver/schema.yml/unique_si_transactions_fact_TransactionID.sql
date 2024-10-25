
    
    

select
    TransactionID as unique_field,
    count(*) as n_records

from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
where TransactionID is not null
group by TransactionID
having count(*) > 1


