output "container_name" {
  value       = [for i in docker_container.redis_container[*] : i.name]
  description = "docker container name"
}


output "redis_process_running_at" {
  value = [
    for i in docker_container.redis_container[*] : join(":", [
      i.ip_address
    ], i.ports[*]["external"])
  ]
  description = "redis running at"
}
