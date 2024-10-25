select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    TransactionID as unique_field,
    count(*) as n_records

from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact
where TransactionID is not null
group by TransactionID
having count(*) > 1



      
    ) dbt_internal_test