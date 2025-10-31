resource "aws_sns_topic" "user_updates" {
  name = "${var.prefix}-alarm-topic"
}

resource "aws_sns_topic_subscription" "user_updates_email" {
  topic_arn = aws_sns_topic.user_updates.arn
  protocol  = "email"
  endpoint  = var.alarm_email
}

resource "aws_cloudwatch_metric_alarm" "threshold" {
  alarm_name          = "${var.prefix}-bank-sum-threshold"
  namespace           = var.prefix
  metric_name         = "bank_sum.value"
  comparison_operator = "GreaterThanThreshold"
  threshold           = var.threshold
  evaluation_periods  = 2
  period              = 60
  statistic           = "Maximum"
  alarm_description   = "Triggered if the total amount of money in the bank exceeds threshold."
  alarm_actions       = [aws_sns_topic.user_updates.arn]
}
