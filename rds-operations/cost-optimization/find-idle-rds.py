import boto3

client = boto3.client('rds')

def list_idle_instances():
    dbs = client.describe_db_instances()['DBInstances']
    for db in dbs:
        if db['DBInstanceStatus'] == 'available' and db['DBInstanceClass'] == 'db.t3.micro':
            print(f\"[IDLE] {db['DBInstanceIdentifier']} - {db['DBInstanceClass']} - {db['AllocatedStorage']}GB\")

if __name__ == \"__main__\":
    list_idle_instances()
