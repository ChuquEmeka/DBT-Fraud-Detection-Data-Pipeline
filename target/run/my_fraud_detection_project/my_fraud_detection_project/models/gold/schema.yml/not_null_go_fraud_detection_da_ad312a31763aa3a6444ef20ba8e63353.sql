select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_fraud_transactions
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.go_fraud_detection_dashboard_metrics
where total_fraud_transactions is null



      
    ) dbt_internal_test