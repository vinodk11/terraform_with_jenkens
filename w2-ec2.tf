resource "aws_instance" "jenkins-vm" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.instancetype
    key_name = var.aws_keypair
    user_data = file("${path.module}/install.sh")
    vpc_security_group_ids = [ aws_security_group.ssh-sg.id, aws_security_group.jenkis-sg.id ]
    root_block_device {
      volume_size = 50
      volume_type = "gp2"
      delete_on_termination = true
    }
    tags = {
        Name = "jenkins-vm"
    }

  
}