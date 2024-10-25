select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select AnomalyScore
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_real_time_fraud_detection
where AnomalyScore is null



      
    ) dbt_internal_test