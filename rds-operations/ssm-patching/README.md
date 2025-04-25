# AWS SSM Patch Management Automation

This script configures automated OS patching on EC2 instances using AWS Systems Manager (SSM).

## ðŸ”§ What It Does

1. Tags your instance into a patch group
2. Associates that patch group with a Patch Baseline
3. Creates a recurring Maintenance Window
4. Registers your instance as a target
5. Links the patching task (`AWS-RunPatchBaseline`) to the window
6. Schedules patching on Sundays at 4am UTC

## ðŸ“‹ Requirements

- EC2 instance must have SSM agent installed and IAM role allowing SSM
- Predefined Patch Baseline ID (or use default)
- IAM role with `AmazonSSMMaintenanceWindowRole` for task execution

## ðŸ’¡ Usage

1. Update the script variables: `INSTANCE_ID`, `REGION`, `PATCH_BASELINE_ID`, `SSM_DOCUMENT`
2. Run the script from any host with AWS CLI and credentials

## ðŸ§ª Optional Enhancements

- Extend the logic to support multiple instances via tag filters
- Add SNS notifications after task execution
- Monitor patch compliance via `ssm describe-instance-patch-states`

## âœ… Output

On success, the script outputs the Window ID and Task ID for your records.
