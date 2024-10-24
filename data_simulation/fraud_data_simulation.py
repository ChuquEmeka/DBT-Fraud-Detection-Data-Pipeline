import pandas as pd
import numpy as np
import random
import json
from datetime import datetime, timedelta
from faker import Faker
import boto3
import os

# Initialize Faker for realistic data generation
fake = Faker()

# Constants
num_records = 5000
end_date = datetime.today()  # End date is today
start_date = end_date - timedelta(days=730)  # Start date is two years back
transaction_types = ['Purchase', 'Refund', 'Transfer']
payment_methods = ['Credit Card', 'PayPal', 'Bank Transfer']
merchants = ['Amazon', 'Walmart', 'Target', 'eBay', 'Best Buy']
# bucket_name = 'fraud-detection-raw-data1'
# bucket_name = 'databricks-workspace-stack-84074-bucket'


# Generate user data
user_ids = [f'user_{i}' for i in range(1, 1001)]
user_data = {
    'UserID': [],
    'Age': [],
    'Gender': [],
    'AccountCreationDate': [],
    'Location': [],
    'AccountStatus': [],
    'DeviceID': [],
    'UserProfileCompleteness': [],
    'PreviousFraudAttempts': []
}

for user_id in user_ids:
    user_data['UserID'].append(user_id)
    user_data['Age'].append(random.randint(18, 75))
    user_data['Gender'].append(random.choice(['Male', 'Female']))
    user_data['AccountCreationDate'].append(fake.date_between(start_date=start_date, end_date=end_date).strftime('%Y-%m-%d'))
    user_data['Location'].append(fake.city())
    user_data['AccountStatus'].append(random.choice(['Active', 'Suspended', 'Closed']))
    user_data['DeviceID'].append(fake.uuid4())
    user_data['UserProfileCompleteness'].append(random.randint(70, 100))
    user_data['PreviousFraudAttempts'].append(random.randint(0, 5))

user_df = pd.DataFrame(user_data)

# Generate transactions data
transaction_data = {
    'TransactionID': [],
    'UserID': [],
    'TransactionDate': [],
    'TransactionAmount': [],
    'TransactionType': [],
    'MerchantID': [],
    'Currency': [],
    'TransactionStatus': [],
    'DeviceType': [],
    'IP_Address': [],
    'PaymentMethod': [],
    'LocationCoordinates': [],
    'SuspiciousFlag': [],
    'IsFraud': [],
    'ReviewStatus': [],
    'AnomalyScore': [],
    'TransactionTime': []
}

for i in range(num_records):
    user_id = random.choice(user_ids)
    transaction_date = fake.date_time_between(start_date=start_date, end_date=end_date)
    amount = round(random.uniform(1.0, 1000.0), 2)
    transaction_type = random.choice(transaction_types)
    merchant = random.choice(merchants)
    currency = 'USD'
    device_type = random.choice(['Mobile', 'Desktop'])
    ip_address = fake.ipv4()
    payment_method = random.choice(payment_methods)
    suspicious_flag = random.choice([0, 1])
    
    # Introduce some fraud cases
    if suspicious_flag == 1 and random.random() < 0.3:  # 30% chance of fraud when suspicious
        is_fraud = 1
        transaction_status = 'Under Review'
        anomaly_score = round(random.uniform(0.7, 1.0), 2)
    else:
        is_fraud = 0
        transaction_status = 'Completed'
        anomaly_score = round(random.uniform(0.0, 0.3), 2)

    transaction_data['TransactionID'].append(f'transaction_{i + 1}')
    transaction_data['UserID'].append(user_id)
    transaction_data['TransactionDate'].append(transaction_date.strftime('%Y-%m-%d'))
    transaction_data['TransactionAmount'].append(amount)
    transaction_data['TransactionType'].append(transaction_type)
    transaction_data['MerchantID'].append(merchant)
    transaction_data['Currency'].append(currency)
    transaction_data['TransactionStatus'].append(transaction_status)
    transaction_data['DeviceType'].append(device_type)
    transaction_data['IP_Address'].append(ip_address)
    transaction_data['PaymentMethod'].append(payment_method)
    transaction_data['LocationCoordinates'].append(f"{fake.latitude()}, {fake.longitude()}")
    transaction_data['SuspiciousFlag'].append(suspicious_flag)
    transaction_data['IsFraud'].append(is_fraud)
    transaction_data['ReviewStatus'].append(random.choice(['Approved', 'Denied']) if is_fraud else 'N/A')
    transaction_data['AnomalyScore'].append(anomaly_score)
    transaction_data['TransactionTime'].append(transaction_date.strftime('%H:%M:%S'))

# Create a DataFrame for transactions
transaction_df = pd.DataFrame(transaction_data)

# Merge user and transaction data in bulk (avoiding the loop)
merged_df = transaction_df.merge(user_df, on='UserID')

# Convert the DataFrame to a list of records for partitioned uploads
nested_data = merged_df.to_dict(orient='records')

# Group data by year for batch uploading
data_by_year = {}
for record in nested_data:
    year = record['TransactionDate'][:4]  # Extract year from the transaction date
    if year not in data_by_year:
        data_by_year[year] = []
    data_by_year[year].append(record)

import boto3
import json
import os

# Initialize the S3 client with the Frankfurt region
s3_client = boto3.client('s3', region_name='eu-central-1')

# Specify your bucket name and the folder path
bucket_name = 'fraud-detection-raw-data'
folder_name = 'raw_data'
# Assuming data_by_year is already defined
for year, records in data_by_year.items():
    # Create the partition path based on the year
    partition_path = f"{folder_name}/year={year}/"
    
    # Convert the list of records to JSON
    json_records = json.dumps(records)
    
    # Upload all records for the year as a single file
    s3_client.put_object(
        Bucket=bucket_name,
        Key=os.path.join(partition_path, f"transactions_{year}.json"),
        Body=json_records
    )

print("Synthetic data generation completed and uploaded to S3 in batch files, partitioned by year.")
