-- Enable pg_stat_statements extension (if not already enabled)
CREATE EXTENSION IF NOT EXISTS pg_stat_statements;

-- View top 10 slowest queries by total time
SELECT
  query,
  calls,
  total_time,
  mean_time,
  rows
FROM
  pg_stat_statements
ORDER BY
  total_time DESC
LIMIT 10;
