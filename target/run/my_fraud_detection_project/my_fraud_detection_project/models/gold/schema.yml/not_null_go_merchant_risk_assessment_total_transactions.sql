select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_transactions
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.go_merchant_risk_assessment
where total_transactions is null



      
    ) dbt_internal_test