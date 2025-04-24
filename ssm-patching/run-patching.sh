#!/bin/bash

# Example: Attach instance to patch group and schedule maintenance with AWS CLI

INSTANCE_ID=\
REGION="us-east-1"

# Tag instance to associate with patch group
aws ec2 create-tags --resources \ \\
  --tags Key=PatchGroup,Value=DevOpsGroup --region \

# Register existing patch baseline to the patch group
aws ssm register-patch-baseline-for-patch-group \\
  --baseline-id pb-xxxxxxxxxxxxxxxxx \\
  --patch-group DevOpsGroup --region \

# (Optional) Create a maintenance window
aws ssm create-maintenance-window \\
  --name "WeeklyPatchingWindow" \\
  --schedule "cron(0 3 ? * SUN *)" \\
  --duration 2 --cutoff 1 \\
  --allow-unassociated-targets \\
  --region \
