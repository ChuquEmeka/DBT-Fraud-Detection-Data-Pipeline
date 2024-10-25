select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select IP_Address
from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_devices_dimension
where IP_Address is null



      
    ) dbt_internal_test