select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select MerchantID
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_merchant_risk_assessment
where MerchantID is null



      
    ) dbt_internal_test