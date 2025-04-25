# RDS Performance Analysis

This folder contains tools to help analyze and improve the performance of PostgreSQL RDS instances.

## ðŸ” pg_stat_statements

- Enables tracking of executed SQL statements.
- Helps identify slow or frequently called queries.
- Useful for proactive database tuning.

### ðŸ“„ File: \query-stats.sql\

SQL script to:
- Enable the \pg_stat_statements\ extension
- List the top 10 queries by total execution time

## ðŸ“ Prerequisites

- Your PostgreSQL RDS parameter group must have:
  - \shared_preload_libraries = 'pg_stat_statements'\
- Restart may be required after applying changes.

## âœ… Benefits

- Helps you identify query bottlenecks
- Aids in query optimization and index tuning
- Can be integrated into performance dashboards

## ðŸ”„ Maintenance Tip

To reset stats periodically:

\\\sql
SELECT pg_stat_statements_reset();
\\\
