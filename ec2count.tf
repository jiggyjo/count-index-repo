variable "subnet_ids" {
  type = list(string)
}

resource "aws_instance" "server" {
  
  count = length(var.subnet_ids)

  ami           = "ami-08df646e18b182346"
  instance_type = "t2.micro"
  subnet_id     = var.subnet_ids[count.index]
  

  tags = {
    Name = "Server ${count.index}"
  }
}
