variable "name" {
  description = "Name prefix for the resources this module creates."
  type        = string

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]*$", var.name))
    error_message = "name must be lowercase letters, digits and hyphens, starting with a letter."
  }
}

variable "tags" {
  description = "Tags applied to every taggable resource."
  type        = map(string)
  default     = {}
}
