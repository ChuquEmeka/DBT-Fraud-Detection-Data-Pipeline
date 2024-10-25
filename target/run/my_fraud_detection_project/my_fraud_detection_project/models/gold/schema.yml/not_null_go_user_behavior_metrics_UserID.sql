select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select UserID
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_user_behavior_metrics
where UserID is null



      
    ) dbt_internal_test