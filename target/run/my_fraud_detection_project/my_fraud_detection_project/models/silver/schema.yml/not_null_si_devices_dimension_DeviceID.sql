select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DeviceID
from DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_devices_dimension
where DeviceID is null



      
    ) dbt_internal_test