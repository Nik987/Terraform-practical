provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://52.66.15.186:8200"
  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id = "669737a3-9be3-b37d-ab38-f87d404d34ff"
      secret_id = "66da3984-2a7e-2c9c-a592-1dd217d083ad"
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "kv" // change it according to your mount
  name  = "test-secret" // change it according to your secret
}

resource "aws_instance" "my_instance" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"

  tags = {
    Name = "test"
    Secret = data.vault_kv_secret_v2.example.data["name"]
  }
}