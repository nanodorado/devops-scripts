# RDS Audit Logging

This section provides guidance on enabling and using audit logs for Amazon RDS instances.

## âœ… Use Cases

- Track connections/disconnections
- Log long-running queries and failed authentications
- Improve visibility into database activity for security teams

## ðŸ” PostgreSQL (Parameter Group Settings)

Recommended parameters:

\\\
log_statement = 'all'
log_connections = 1
log_disconnections = 1
log_duration = 1
log_min_duration_statement = 500
log_statement_stats = 0
\\\

> These logs will be available in CloudWatch if log_destination = 'stderr' and enhanced monitoring is enabled.

## ðŸ“¤ Exporting Logs to CloudWatch

Make sure to:
- Enable **Enhanced Monitoring**
- Associate your DB instance with a role that has logs:PutLogEvents

## ðŸ”„ Rotation

CloudWatch logs can be set to expire automatically via retention settings.
You can also export them to S3 periodically using subscriptions or Lambda.

## ðŸ›¡ï¸ Additional Notes

- MySQL: use general_log, slow_query_log
- SQL Server: enable SQL Server Audit features via parameter groups
- Logging may impact performance slightly â€“ test in non-prod before enabling in prod.
