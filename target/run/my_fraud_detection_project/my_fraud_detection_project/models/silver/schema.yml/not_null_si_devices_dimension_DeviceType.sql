select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select DeviceType
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_devices_dimension
where DeviceType is null



      
    ) dbt_internal_test