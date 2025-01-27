# Monitoramento CloudWatch
resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "cpu-utilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period             = "300"
  statistic          = "Average"
  threshold          = "80"
  alarm_description  = "Alta Utilizacao de CPU"
  alarm_actions      = [aws_sns_topic.alerts.arn]

  dimensions = {
    InstanceId = aws_instance.teamsoft_web_server.id
  }
}

# SNS Topic for Alerts
resource "aws_sns_topic" "alerts" {
  name = "server-alerts"
}