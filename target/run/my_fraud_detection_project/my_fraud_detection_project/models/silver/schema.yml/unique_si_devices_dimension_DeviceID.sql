select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    DeviceID as unique_field,
    count(*) as n_records

from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_devices_dimension
where DeviceID is not null
group by DeviceID
having count(*) > 1



      
    ) dbt_internal_test