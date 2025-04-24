# SSM Patching Automation

This folder contains an example script to automate patch management using AWS Systems Manager (SSM).

## What it does

- Tags the instance with a Patch Group
- Registers that Patch Group to a Patch Baseline
- Optionally creates a maintenance window for scheduled patching

## How to use

1. Ensure the EC2 instance has the \AmazonSSMManagedInstanceCore\ IAM role.
2. SSH into the instance and run \un-patching.sh\.
3. Verify patch compliance in the AWS Systems Manager console.

> Note: Replace \pb-xxxxxxxxxxxxxxxxx\ with your actual Patch Baseline ID.
