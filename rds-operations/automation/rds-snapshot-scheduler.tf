resource "aws_db_snapshot" "daily_snapshot" {
  db_instance_identifier = "my-rds-instance"
  db_snapshot_identifier = "my-rds-snapshot-"
  depends_on             = []
}

resource "aws_cloudwatch_event_rule" "daily" {
  name                = "daily-rds-snapshot"
  schedule_expression = "cron(0 3 * * ? *)"  # Every day at 3am UTC
}

resource "aws_cloudwatch_event_target" "lambda_trigger" {
  rule      = aws_cloudwatch_event_rule.daily.name
  target_id = "rotate-secret"
  arn       = aws_lambda_function.rotate_secret.arn
}
