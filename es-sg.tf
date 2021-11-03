resource "aws_elasticsearch_domain" "es" {
  domain_name = local.elk_domain
  elasticsearch_version = "7.10"

  cluster_config {
      instance_count = 2

      instance_type = "r6g.large.elasticsearch"

      zone_awareness_enabled = true

      zone_awareness_config {
        availability_zone_count = 2
      }
  }

  vpc_options {
      subnet_ids = [
        aws_subnet.public-subnet-1.id,
        aws_subnet.public-subnet-2.id,
      ]

      security_group_ids = [
          aws_security_group.es.id
      ]
  }

  ebs_options {
      ebs_enabled = true
      volume_size = 10
  }

  access_policies = <<CONFIG
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Action": "es:*",
          "Principal": "*",
          "Effect": "Allow",
          "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${local.elk_domain}/*"
      }
  ]
}
  CONFIG

  snapshot_options {
      automated_snapshot_start_hour = 23
  }

  tags = {
      Domain = local.elk_domain
  }
}

output "elk_endpoint" {
  value = aws_elasticsearch_domain.es.endpoint
}

output "elk_kibana_endpoint" {
  value = aws_elasticsearch_domain.es.kibana_endpoint
}