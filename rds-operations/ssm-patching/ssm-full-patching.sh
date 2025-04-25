#!/bin/bash

# Full SSM patching automation script
# ------------------------------------

REGION="us-east-1"
INSTANCE_ID="i-xxxxxxxxxxxxxxxxx"
PATCH_GROUP="DevOpsPatchGroup"
PATCH_BASELINE_ID="pb-xxxxxxxxxxxxxxxxx"
MAINTENANCE_WINDOW_NAME="WeeklyPatchWindow"
TASK_NAME="PatchLinuxInstances"
SSM_DOCUMENT="AWS-RunPatchBaseline"

echo "[1/6] Tagging EC2 instance with Patch Group..."
aws ec2 create-tags \
  --resources $INSTANCE_ID \
  --tags Key=PatchGroup,Value=$PATCH_GROUP \
  --region $REGION

echo "[2/6] Registering Patch Group with Patch Baseline..."
aws ssm register-patch-baseline-for-patch-group \
  --baseline-id $PATCH_BASELINE_ID \
  --patch-group $PATCH_GROUP \
  --region $REGION

echo "[3/6] Creating Maintenance Window..."
WINDOW_ID=$(aws ssm create-maintenance-window \
  --name "$MAINTENANCE_WINDOW_NAME" \
  --schedule "cron(0 4 ? * SUN *)" \
  --duration 2 \
  --cutoff 1 \
  --allow-unassociated-targets \
  --region $REGION \
  --query 'WindowId' --output text)

echo "[4/6] Registering EC2 instance as target for the maintenance window..."
TARGET_ID=$(aws ssm register-target-with-maintenance-window \
  --window-id $WINDOW_ID \
  --resource-type INSTANCE \
  --targets "Key=InstanceIds,Values=$INSTANCE_ID" \
  --region $REGION \
  --query 'WindowTargetId' --output text)

echo "[5/6] Registering Patch Task with Maintenance Window..."
TASK_ID=$(aws ssm register-task-with-maintenance-window \
  --window-id $WINDOW_ID \
  --targets "Key=InstanceIds,Values=$INSTANCE_ID" \
  --task-arn $SSM_DOCUMENT \
  --service-role-arn arn:aws:iam::123456789012:role/SSMMaintenanceRole \
  --task-type RUN_COMMAND \
  --name "$TASK_NAME" \
  --max-concurrency 1 \
  --max-errors 1 \
  --region $REGION \
  --query 'WindowTaskId' --output text)

echo "[6/6] âœ… Patch automation setup complete."
echo "Window ID: $WINDOW_ID"
echo "Task ID: $TASK_ID"
