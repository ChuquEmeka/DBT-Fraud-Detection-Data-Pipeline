

WITH devices_dimension AS (
    SELECT
        DeviceID,
        FIRST_VALUE(DeviceType) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS DeviceType,
        FIRST_VALUE(IP_Address) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS IP_Address
    FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.br_fraud_detection_raw_data_historical
    
        WHERE DeviceID > (SELECT MAX(DeviceID) FROM DEV_EMEKA_FRAUD_DETECTION.PUBLIC.si_devices_dimension)
    
)

SELECT DISTINCT * FROM devices_dimension