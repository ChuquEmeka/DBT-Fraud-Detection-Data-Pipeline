select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select total_transactions
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_user_behavior_metrics
where total_transactions is null



      
    ) dbt_internal_test