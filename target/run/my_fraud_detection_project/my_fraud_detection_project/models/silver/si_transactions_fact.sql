-- back compat for old kwarg name
  
  begin;
    
        
            
            
        
    

    

    merge into EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact as DBT_INTERNAL_DEST
        using EMEKA_FRAUD_DETECTION_DATABASE.PUBLIC.si_transactions_fact__dbt_tmp as DBT_INTERNAL_SOURCE
        on (
                DBT_INTERNAL_SOURCE.TransactionID = DBT_INTERNAL_DEST.TransactionID
            )

    
    when matched then update set
        "TRANSACTIONID" = DBT_INTERNAL_SOURCE."TRANSACTIONID","USERID" = DBT_INTERNAL_SOURCE."USERID","TRANSACTIONDATE" = DBT_INTERNAL_SOURCE."TRANSACTIONDATE","TRANSACTIONAMOUNT" = DBT_INTERNAL_SOURCE."TRANSACTIONAMOUNT","TRANSACTIONTYPE" = DBT_INTERNAL_SOURCE."TRANSACTIONTYPE","MERCHANTID" = DBT_INTERNAL_SOURCE."MERCHANTID","CURRENCY" = DBT_INTERNAL_SOURCE."CURRENCY","TRANSACTIONSTATUS" = DBT_INTERNAL_SOURCE."TRANSACTIONSTATUS","DEVICETYPE" = DBT_INTERNAL_SOURCE."DEVICETYPE","IP_ADDRESS" = DBT_INTERNAL_SOURCE."IP_ADDRESS","PAYMENTMETHOD" = DBT_INTERNAL_SOURCE."PAYMENTMETHOD","SUSPICIOUSFLAG" = DBT_INTERNAL_SOURCE."SUSPICIOUSFLAG","ISFRAUD" = DBT_INTERNAL_SOURCE."ISFRAUD","ANOMALYSCORE" = DBT_INTERNAL_SOURCE."ANOMALYSCORE","AGE" = DBT_INTERNAL_SOURCE."AGE","GENDER" = DBT_INTERNAL_SOURCE."GENDER","ACCOUNTCREATIONDATE" = DBT_INTERNAL_SOURCE."ACCOUNTCREATIONDATE","LOCATION" = DBT_INTERNAL_SOURCE."LOCATION","LOCATIONCOORDINATES" = DBT_INTERNAL_SOURCE."LOCATIONCOORDINATES","ACCOUNTSTATUS" = DBT_INTERNAL_SOURCE."ACCOUNTSTATUS","DEVICEID" = DBT_INTERNAL_SOURCE."DEVICEID","USERPROFILECOMPLETENESS" = DBT_INTERNAL_SOURCE."USERPROFILECOMPLETENESS","PREVIOUSFRAUDATTEMPTS" = DBT_INTERNAL_SOURCE."PREVIOUSFRAUDATTEMPTS"
    

    when not matched then insert
        ("TRANSACTIONID", "USERID", "TRANSACTIONDATE", "TRANSACTIONAMOUNT", "TRANSACTIONTYPE", "MERCHANTID", "CURRENCY", "TRANSACTIONSTATUS", "DEVICETYPE", "IP_ADDRESS", "PAYMENTMETHOD", "SUSPICIOUSFLAG", "ISFRAUD", "ANOMALYSCORE", "AGE", "GENDER", "ACCOUNTCREATIONDATE", "LOCATION", "LOCATIONCOORDINATES", "ACCOUNTSTATUS", "DEVICEID", "USERPROFILECOMPLETENESS", "PREVIOUSFRAUDATTEMPTS")
    values
        ("TRANSACTIONID", "USERID", "TRANSACTIONDATE", "TRANSACTIONAMOUNT", "TRANSACTIONTYPE", "MERCHANTID", "CURRENCY", "TRANSACTIONSTATUS", "DEVICETYPE", "IP_ADDRESS", "PAYMENTMETHOD", "SUSPICIOUSFLAG", "ISFRAUD", "ANOMALYSCORE", "AGE", "GENDER", "ACCOUNTCREATIONDATE", "LOCATION", "LOCATIONCOORDINATES", "ACCOUNTSTATUS", "DEVICEID", "USERPROFILECOMPLETENESS", "PREVIOUSFRAUDATTEMPTS")

;
    commit;