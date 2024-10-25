select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_transactions
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_fraud_detection_dashboard_metrics
where total_transactions is null



      
    ) dbt_internal_test