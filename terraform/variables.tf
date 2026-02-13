variable "key_pair_name" {
  description = "Name of the SSH key pair to create in AWS"
  type        = string
  default     = "private-isu-key"
}

variable "private_key_path" {
  description = "Local path to save the generated private key"
  type        = string
  default     = "private-isu-key.pem"
}

variable "webapp_instance_type" {
  description = "EC2 instance type for webapp"
  type        = string
  default     = "c7a.large"
}

variable "bench_instance_type" {
  description = "EC2 instance type for benchmarker"
  type        = string
  default     = "c7a.xlarge"
}

variable "root_volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 20
}
