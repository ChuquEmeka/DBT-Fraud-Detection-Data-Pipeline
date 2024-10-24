-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_real_time_fraud_detection as DBT_INTERNAL_DEST
        using EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.go_real_time_fraud_detection__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.TransactionID = DBT_INTERNAL_DEST.TransactionID
            )

    
    when matched then update set
        "TRANSACTIONID" = DBT_INTERNAL_SOURCE."TRANSACTIONID","TRANSACTIONDATE" = DBT_INTERNAL_SOURCE."TRANSACTIONDATE","TRANSACTIONAMOUNT" = DBT_INTERNAL_SOURCE."TRANSACTIONAMOUNT","TRANSACTIONTYPE" = DBT_INTERNAL_SOURCE."TRANSACTIONTYPE","USERID" = DBT_INTERNAL_SOURCE."USERID","MERCHANTID" = DBT_INTERNAL_SOURCE."MERCHANTID","DEVICEID" = DBT_INTERNAL_SOURCE."DEVICEID","IP_ADDRESS" = DBT_INTERNAL_SOURCE."IP_ADDRESS","ANOMALYSCORE" = DBT_INTERNAL_SOURCE."ANOMALYSCORE","ISFRAUD" = DBT_INTERNAL_SOURCE."ISFRAUD","FRAUD_RISK_LEVEL" = DBT_INTERNAL_SOURCE."FRAUD_RISK_LEVEL"
    

    when not matched then insert
        ("TRANSACTIONID", "TRANSACTIONDATE", "TRANSACTIONAMOUNT", "TRANSACTIONTYPE", "USERID", "MERCHANTID", "DEVICEID", "IP_ADDRESS", "ANOMALYSCORE", "ISFRAUD", "FRAUD_RISK_LEVEL")
    values
        ("TRANSACTIONID", "TRANSACTIONDATE", "TRANSACTIONAMOUNT", "TRANSACTIONTYPE", "USERID", "MERCHANTID", "DEVICEID", "IP_ADDRESS", "ANOMALYSCORE", "ISFRAUD", "FRAUD_RISK_LEVEL")

;
    commit;