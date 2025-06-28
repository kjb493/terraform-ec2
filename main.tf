resource "aws_instance" "web" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.public_a.id
  associate_public_ip_address = true
  user_data                   = base64encode(file("user-data.sh"))
  user_data_replace_on_change = true
  tags = {
    Name : "Okhai web server"
  }
}


resource "aws_instance" "demo" {
  ami                         = data.aws_ami.ubuntu.id
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name
  vpc_security_group_ids      = [aws_security_group.main.id]
  subnet_id                   = aws_subnet.public_a.id
  associate_public_ip_address = true
  user_data                   = base64encode(file("user-data.sh"))
  user_data_replace_on_change = true
  tags = {
    Name : "demo server"
  }
}