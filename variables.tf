variable "iap_app_engine_version_iam_members" {
  description = <<EOT
Map of iap_app_engine_version_iam_members, attributes below
Required:
    - app_id
    - member
    - role
    - service
    - version_id
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    app_id     = string
    member     = string
    role       = string
    service    = string
    version_id = string
    project    = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

