variable "allowed_ports" {
  description = "List of allowed ports"
  type        = list(any)
  default     = ["22", "9200"]
}

variable "vpc_id" {}

variable "environment" {}