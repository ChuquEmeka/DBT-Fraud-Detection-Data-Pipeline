select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select Currency
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_transactions_fact
where Currency is null



      
    ) dbt_internal_test