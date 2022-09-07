module "mongodb" {
  source = "../stack-mongodb"

  project_name    = var.project_name
  organization_id = var.organization_id
  name            = var.name
}
