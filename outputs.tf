output "project_cache_endpoint" {
  value       = aws_elasticache_cluster.cache.cache_nodes[0].address
  description = "Project Elasticache Endpoint"
}