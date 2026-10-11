resource "google_iap_app_engine_version_iam_member" "iap_app_engine_version_iam_members" {
  for_each = var.iap_app_engine_version_iam_members

  app_id     = each.value.app_id
  member     = each.value.member
  role       = each.value.role
  service    = each.value.service
  version_id = each.value.version_id
  project    = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

