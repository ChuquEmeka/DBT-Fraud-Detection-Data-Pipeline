-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_devices_dimension as DBT_INTERNAL_DEST
        using DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_devices_dimension__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.DeviceID = DBT_INTERNAL_DEST.DeviceID
            )

    
    when matched then update set
        "DEVICEID" = DBT_INTERNAL_SOURCE."DEVICEID","DEVICETYPE" = DBT_INTERNAL_SOURCE."DEVICETYPE","IP_ADDRESS" = DBT_INTERNAL_SOURCE."IP_ADDRESS"
    

    when not matched then insert
        ("DEVICEID", "DEVICETYPE", "IP_ADDRESS")
    values
        ("DEVICEID", "DEVICETYPE", "IP_ADDRESS")

;
    commit;