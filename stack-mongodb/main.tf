resource "mongodbatlas_project" "default" {
  name   = var.project_name
  org_id = var.organization_id
}

resource "mongodbatlas_project_ip_access_list" "default" {
  project_id = mongodbatlas_project.default.id
  ip_address = "0.0.0.0"
  comment    = "public ip address"
}

resource "mongodbatlas_cluster" "default" {
  project_id   = mongodbatlas_project.default.id
  name         = var.name
  cluster_type = "REPLICASET"

  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = "5.0"

  provider_name               = "AZURE"
  provider_disk_type_name     = "P4"
  provider_instance_size_name = "M0"

}
