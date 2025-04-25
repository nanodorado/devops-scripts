import boto3
import datetime

# Configurable variables
rds = boto3.client('rds')
RETENTION_DAYS = 7
INSTANCE_IDENTIFIER = 'my-rds-instance'

def lambda_handler(event, context):
    cutoff = datetime.datetime.utcnow() - datetime.timedelta(days=RETENTION_DAYS)
    
    snapshots = rds.describe_db_snapshots(
        DBInstanceIdentifier=INSTANCE_IDENTIFIER,
        SnapshotType='manual'
    )['DBSnapshots']
    
    for snapshot in snapshots:
        snapshot_time = snapshot['SnapshotCreateTime'].replace(tzinfo=None)
        snapshot_id = snapshot['DBSnapshotIdentifier']
        
        if snapshot_time < cutoff:
            print(f"Deleting snapshot: {snapshot_id} (Created: {snapshot_time})")
            rds.delete_db_snapshot(DBSnapshotIdentifier=snapshot_id)
