resource "oci_container_instances_container_instance" "docker_dpage_pgadmin" {
  compartment_id                       = var.compartment_ocid
  availability_domain                  = var.availability_domain
  display_name                         = "PGADMIN"
  container_restart_policy             = var.container_restart_policy
  graceful_shutdown_timeout_in_seconds = var.graceful_shutdown_timeout_in_seconds
  state                                = var.state

  shape = var.shape
  shape_config {
    memory_in_gbs = var.shape_config.memory_in_gbs
    ocpus         = var.shape_config.ocpus
  }

  containers {
    display_name = "container-1-pgadmin"
    environment_variables = {
      "PGADMIN_DEFAULT_EMAIL"              = "hariprasad.bantwal@avaloq.com"
      "PGADMIN_DEFAULT_PASSWORD"           = "changeme"
    }
    image_url                      = "docker.io/dpage/pgadmin4"
    is_resource_principal_disabled = "false"    
  }

  vnics {
       
    is_public_ip_assigned = "true"
    skip_source_dest_check = "true"
    subnet_id              = oci_core_subnet.windmill_subnet.id
  }
}
