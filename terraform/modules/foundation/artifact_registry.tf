resource "google_artifact_registry_repository" "docker" {
  repository_id      = var.project_name
  format             = "DOCKER"

  cleanup_policies {
    id     = "keep-latest"
    action = "KEEP"

    most_recent_versions {
      package_name = "*"
      keep_count   = 1
    }
  }

  cleanup_policies {
    id     = "delete-others"
    action = "DELETE"

    condition {
      package_name = "*"
      tag_state    = "ANY"
    }
  }
}
