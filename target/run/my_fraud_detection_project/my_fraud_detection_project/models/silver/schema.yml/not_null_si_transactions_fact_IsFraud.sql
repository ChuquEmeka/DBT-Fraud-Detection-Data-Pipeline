select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select IsFraud
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
where IsFraud is null



      
    ) dbt_internal_test