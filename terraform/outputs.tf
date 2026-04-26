output "ec2_public_ip" {
  value       = aws_instance.main.public_ip
  description = "Public IP of the EC2 instance"
}
