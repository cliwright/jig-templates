# Complete example: calls the module with every variable set.
# `task validate` runs `tofu validate` here so the example never drifts
# from the module's interface.

provider "aws" {
  region = "eu-central-1"
}

module "{{ .PROJECT_NAME | replace "-" "_" }}" {
  source = "../.."

  name = "example"
  tags = {
    Environment = "example"
  }
}

output "tags" {
  value = module.{{ .PROJECT_NAME | replace "-" "_" }}.tags
}
