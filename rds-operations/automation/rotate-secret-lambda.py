import boto3
import os
import json

def lambda_handler(event, context):
    secret_name = os.environ['SECRET_NAME']
    region_name = os.environ['AWS_REGION']
    
    client = boto3.client('secretsmanager', region_name=region_name)

    # Example: rotate secret manually or trigger password change
    try:
        response = client.rotate_secret(SecretId=secret_name)
        return {
            'statusCode': 200,
            'body': json.dumps(f"Rotation triggered for {secret_name}")
        }
    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps(f"Error rotating secret: {str(e)}")
        }
