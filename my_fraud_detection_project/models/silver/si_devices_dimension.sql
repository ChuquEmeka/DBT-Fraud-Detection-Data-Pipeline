{{ config(
    materialized='incremental',
    unique_key='DeviceID'
) }}

WITH devices_dimension AS (
    SELECT
        DeviceID,
        FIRST_VALUE(DeviceType) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS DeviceType,
        FIRST_VALUE(IP_Address) OVER (PARTITION BY DeviceID ORDER BY TransactionDate) AS IP_Address
    FROM {{ ref('br_fraud_detection_raw_data_historical') }}
    {% if is_incremental() %}
        WHERE DeviceID > (SELECT MAX(DeviceID) FROM {{ this }})
    {% endif %}
)

SELECT DISTINCT * FROM devices_dimension
