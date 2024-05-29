locals {
  tags = merge(
    {
      Managed_by = "terraform"
    },
    var.additional_tags
  )
}

variable "additional_tags" {
  description = "Additional tags for managed resources"
  type        = map(string)
  default     = {}
}