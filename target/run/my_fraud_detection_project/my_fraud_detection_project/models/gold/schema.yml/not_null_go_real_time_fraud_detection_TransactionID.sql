select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select TransactionID
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_real_time_fraud_detection
where TransactionID is null



      
    ) dbt_internal_test