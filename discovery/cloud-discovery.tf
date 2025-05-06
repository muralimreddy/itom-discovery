resource "aws_iam_role" "snowcloud_discovery" {
  name = "SnowCloudDiscovery"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "snowcloud_discovery_policy" {
  name = "SnowCloudDiscoveryPolicy"
  role = aws_iam_role.snowcloud_discovery.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid = "PermissionsNeededForDiscovery"
      Effect = "Allow"
      Action = [
        "account:ListRegions",
        "apigateway:GET",
        "application-autoscaling:Describe*",
        "autoscaling-plans:Describe*",
        "autoscaling:Describe*",
        "autoscaling:DescribeAutoScalingGroups",
        "autoscaling:DescribeLaunchConfigurations",
        "cloudformation:Describe*",
        "cloudformation:DescribeStack*",
        "cloudformation:List*",
        "cloudwatch:Get*",
        "cloudwatch:List*",
        "config:ListDiscoveredResources",
        "dynamodb:Describe*",
        "dynamodb:DescribeTable",
        "dynamodb:ListGlobalTables",
        "dynamodb:ListTables",
        "ec2:Describe*",
        "ec2:ReportInstanceStatus",
        "ecs:Describe*",
        "ecs:List*",
        "eks:Describe*",
        "eks:List*",
        "elasticache:Describe*",
        "elasticache:List*",
        "elasticfilesystem:Describe*",
        "elasticloadbalancing:Describe*",
        "lambda:Get*",
        "lambda:List*",
        "organizations:Describe*",
        "organizations:DescribeOrganization",
        "organizations:List*",
        "rds:Describe*",
        "redshift:Describe*",
        "route53:GetHostedZone",
        "route53:List*",
        "s3:GetAccountPublicAccessBlock",
        "s3:GetBucket*",
        "s3:GetBucketLocation",
        "s3:List*",
        "sdb:GetAttributes",
        "sns:GetEndpointAttributes",
        "sns:GetSubscriptionAttributes",
        "sns:List*",
        "sns:ListPlatformApplications",
        "sns:ListSubscriptions",
        "sns:ListSubscriptionsByTopic",
        "sns:ListTopics"
      ]
      Resource = "*"
    }]
  })
}
