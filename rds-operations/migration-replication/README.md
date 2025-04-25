# RDS Migration & Replication

This module contains examples of how to migrate and replicate RDS databases using AWS tools.

## ðŸ”„ AWS DMS (Database Migration Service)

**Files included:**

- \dms-task.json\: JSON definition for a full-load DMS task
- \	able-mappings.json\: Table mapping rules to migrate all tables
- Requires source/target endpoints and replication instance created via AWS DMS

Run using AWS CLI:

\\\ash
aws dms create-replication-task --cli-input-json file://dms-task.json
\\\

## ðŸ” Read Replication

**File: \ead-replica.tf\**

- Creates a read replica from a source RDS instance
- Useful for read-heavy workloads, backup offloading, or failover scenarios

> Use read replicas to scale reads or promote them for cross-region failover

## ðŸ“Œ Notes

- DMS supports full-load, CDC (change data capture), or both
- Replication source must support backups and required retention
- Always test mappings and performance before production cutovers
