output "aws_instance_public_ip" {
    value = aws_instance.s1.private_ip
}
