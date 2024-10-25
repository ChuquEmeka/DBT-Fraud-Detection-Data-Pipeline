select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select TransactionAmount
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
where TransactionAmount is null



      
    ) dbt_internal_test