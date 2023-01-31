#AWS ElasticCache
resource "aws_elasticache_parameter_group" "default" {
  name        = var.project_name
  family      = var.project_redis_specs.family
  description = "Redis Parameter group"

  parameter {
    name  = "maxmemory-policy"
    value = "allkeys-lru"
  }
}

resource "aws_elasticache_cluster" "cache" {
  cluster_id           = "${var.project_name}-${var.environment}"
  #keep the resources in the same az
  availability_zone = var.availability_zone
  
  security_group_ids   = [var.sg_elasticache]
  engine               = "redis"
  node_type            = var.project_redis_specs.cache_node_type
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.default.name
  engine_version       = var.project_redis_specs.engine_version
  port                 = 6379
  tags = {
    Environment = var.environment
  }
}