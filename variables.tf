variable "ext_port" {
  type    = number
  validation {
    condition     = var.ext_port <= 65535 && var.ext_port > 0
    error_message = "The external port must be in range of 0 to 65535."
  }
}
variable "int_port" {
  type    = number
  default = 6379
  validation {
    condition     = var.int_port == 6379
    error_message = "The internal port must be 6379."
  }
}

variable "container_count" {
  type    = number
  default = 1
}
