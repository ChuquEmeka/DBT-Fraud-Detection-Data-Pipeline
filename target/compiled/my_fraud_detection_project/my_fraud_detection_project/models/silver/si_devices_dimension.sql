

WITH devices_dimension AS (
    SELECT
        DeviceID,
        FIRST_VALUE(DeviceType) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS DeviceType,
        FIRST_VALUE(IP_Address) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS IP_Address
    FROM PROD_EMEKA_FRAUD_DETECTION2.PUBLIC.br_fraud_detection_raw_data_historical
    
)

SELECT DISTINCT * FROM devices_dimension