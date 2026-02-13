output "ami_id" {
  description = "AMI ID used for EC2 instances"
  value       = data.aws_ami.ubuntu.id
}

output "webapp_public_ip" {
  description = "Public IP of the webapp instance"
  value       = aws_instance.webapp.public_ip
}

output "bench_public_ip" {
  description = "Public IP of the benchmarker instance"
  value       = aws_instance.bench.public_ip
}

output "ssh_webapp" {
  description = "SSH command for webapp instance"
  value       = "ssh -i ${local_sensitive_file.private_key.filename} ubuntu@${aws_instance.webapp.public_ip}"
}

output "ssh_bench" {
  description = "SSH command for benchmarker instance"
  value       = "ssh -i ${local_sensitive_file.private_key.filename} ubuntu@${aws_instance.bench.public_ip}"
}

output "ssh_config_snippet" {
  description = "SSH config snippet for ~/.ssh/config (host names match provisioning/hosts)"
  value       = <<-EOT
    Host isu-app
      HostName ${aws_instance.webapp.public_ip}
      User ubuntu
      IdentityFile ${abspath(local_sensitive_file.private_key.filename)}

    Host isu-bench
      HostName ${aws_instance.bench.public_ip}
      User ubuntu
      IdentityFile ${abspath(local_sensitive_file.private_key.filename)}
  EOT
}
