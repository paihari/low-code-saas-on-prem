resource "oci_core_internet_gateway" "windmill_igw" {
  compartment_id = var.compartment_ocid
  display_name   = "WindmillIGW"
  vcn_id         = var.vcn_id

}

resource "oci_core_route_table" "windmill_rt" {

  compartment_id = var.compartment_ocid
  vcn_id         = var.vcn_id
  display_name   = "WindmillRouteTable"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.windmill_igw.id
  }
  
}
resource "oci_core_subnet" "windmill_subnet" {
  cidr_block                 = var.windmill_subnet_cidr
  display_name               = "WindmillSubnet"
  dns_label                  = "windmillsubnet"
  compartment_id             = var.compartment_ocid
  vcn_id                     = var.vcn_id
  route_table_id             = oci_core_route_table.windmill_rt.id 

}




