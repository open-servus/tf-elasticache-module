variable "environment" {}

variable "project_name" {}

variable sg_elasticache {}

variable availability_zone {}

variable project_redis_specs {
  type = map
  default = {
    family                = "redis6.x"
    engine_version        = "6.x"
    cache_node_type       = "cache.t4g.small"
  }
}