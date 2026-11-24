# Remote state — uncomment and configure for real deployments:
#
# terraform {
#   backend "s3" {
#     bucket       = "your-tofu-state-bucket"
#     key          = "{{.PROJECT_NAME}}/terraform.tfstate"
#     region       = "{{.AWS_REGION}}"
#     encrypt      = true
#     use_lockfile = true
#   }
# }
#
# Until then, state stays local (terraform.tfstate, git-ignored).
# `task validate` initializes with -backend=false and works either way.
