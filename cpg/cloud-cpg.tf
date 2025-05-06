resource "aws_iam_role" "snowcloud_cpg" {
  name = "SnowCloudCPG"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"  # Adjust as necessary
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "snowcloud_cpg_discovery" {
  name = "SnowCloudCPGDiscovery"
  role = aws_iam_role.snowcloud_cpg.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "PermissionsNeededForCPG"
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

resource "aws_iam_role_policy" "snowcloud_cpg_provisioning" {
  name = "SnowCloudCPGProvisioning"
  role = aws_iam_role.snowcloud_cpg.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = "MinimalPermissionsNeededForEc2ProvisioningThroughCloudFormation"
      Effect = "Allow"
      Action = [
        "cloudformation:CreateStack",
        "cloudformation:CreateUploadBucket",
        "cloudformation:DeleteStack",
        "cloudformation:DescribeStackEvents",
        "cloudformation:DescribeStackResources",
        "cloudformation:DescribeStacks",
        "cloudformation:GetTemplate",
        "cloudformation:GetTemplateSummary",
        "cloudformation:List*",
        "cloudformation:UpdateStack",
        "cloudformation:ValidateTemplate",
        "ec2:*",
        "s3:CreateBucket",
        "s3:DeleteBucket",
        "s3:DeleteObject",
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject"
      ]
      Resource = "*"
    }]
  })
}
