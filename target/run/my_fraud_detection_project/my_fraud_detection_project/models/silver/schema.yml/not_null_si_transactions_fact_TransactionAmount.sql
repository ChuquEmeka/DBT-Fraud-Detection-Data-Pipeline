select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select TransactionAmount
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact
where TransactionAmount is null



      
    ) dbt_internal_test