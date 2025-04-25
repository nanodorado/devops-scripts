resource \"aws_cloudwatch_event_rule\" \"stop_rds_schedule\" {
  name                = \"stop-rds-dev-daily\"
  schedule_expression = \"cron(0 23 * * ? *)\" # 8pm Buenos Aires
}

resource \"aws_cloudwatch_event_target\" \"stop_rds_target\" {
  rule      = aws_cloudwatch_event_rule.stop_rds_schedule.name
  target_id = \"StopRDSInstance\"
  arn       = aws_lambda_function.stop_rds.arn
}

resource \"aws_lambda_permission\" \"allow_events\" {
  statement_id  = \"AllowExecutionFromCloudWatch\"
  action        = \"lambda:InvokeFunction\"
  function_name = aws_lambda_function.stop_rds.function_name
  principal     = \"events.amazonaws.com\"
  source_arn    = aws_cloudwatch_event_rule.stop_rds_schedule.arn
}
