# {{.PROJECT_NAME}} — {{.DESCRIPTION}}
#
# Resources live here (or in topic files like s3.tf, iam.tf as the
# module grows). Keep variables in variables.tf and outputs in outputs.tf.

locals {
  name = var.name
  tags = merge(
    {
      Module = "{{.PROJECT_NAME}}"
    },
    var.tags,
  )
}
