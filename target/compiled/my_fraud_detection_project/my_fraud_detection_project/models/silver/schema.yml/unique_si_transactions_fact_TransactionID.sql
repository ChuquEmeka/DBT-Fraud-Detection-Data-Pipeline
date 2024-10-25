
    
    

select
    TransactionID as unique_field,
    count(*) as n_records

from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact
where TransactionID is not null
group by TransactionID
having count(*) > 1


