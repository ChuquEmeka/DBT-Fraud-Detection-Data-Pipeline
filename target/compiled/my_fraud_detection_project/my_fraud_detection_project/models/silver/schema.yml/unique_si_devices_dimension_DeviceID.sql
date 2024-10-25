
    
    

select
    DeviceID as unique_field,
    count(*) as n_records

from EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_devices_dimension
where DeviceID is not null
group by DeviceID
having count(*) > 1


