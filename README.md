# tf-elasticache-module
Terraform aws elasticache (AWS Redis Cache).

How to use it:
```
module "elasticache" {
  source            = "git::https://github.com/open-servus/tf-elasticache-module.git?ref=main"
  project_name      = "openservus"
  environment       = "prod"
  project_redis_specs  = module.data.project_redis_specs
  sg_elasticache     = module.sg.sg_elasticache
  availability_zone = module.data.aws_availability_zone
}
```