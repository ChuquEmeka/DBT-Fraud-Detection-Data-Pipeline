select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select UserID
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical
where UserID is null



      
    ) dbt_internal_test