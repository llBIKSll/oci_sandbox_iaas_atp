// Create Public subnets

resource "oci_core_subnet" "BST-SN-AD1" {
  // AD 3
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  cidr_block = "${var.BST_SN1_CIDR}"
# display_name = "BST-SN-AD1"
  display_name = "DMZ-Subnet-AD1"
  dns_label = "BSTSNAD1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  security_list_ids = ["${oci_core_security_list.BST-SL.id}"]

  route_table_id = "${oci_core_route_table.DMZ-RT.id}"
  dhcp_options_id = "${oci_core_dhcp_options.DMZ-DHCP.id}"
}

// Create Private subnets

resource "oci_core_subnet" "MGMT-SN-AD1" {
  // AD 2
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  cidr_block = "${var.MGMT_SN1_CIDR}"
  display_name = "MGMT-Subnet-AD1"
  dns_label = "MGMTSNAD1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  security_list_ids = ["${oci_core_security_list.MGMT-SL.id}"]

  route_table_id = "${oci_core_route_table.MGMT-RT.id}"
  dhcp_options_id = "${oci_core_dhcp_options.MGMT-DHCP.id}"
  prohibit_public_ip_on_vnic = true
}

resource "oci_core_subnet" "APP-SN-AD1" {
  // AD 2
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  cidr_block = "${var.APP_SN1_CIDR}"
# display_name = "APP-SN-AD1"
  display_name = "APP-Subnet-AD1"
  dns_label = "APPSNAD1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  security_list_ids = ["${oci_core_security_list.APP-SL.id}"]

  route_table_id = "${oci_core_route_table.APP-RT.id}"
  dhcp_options_id = "${oci_core_dhcp_options.APP-DHCP.id}"

  prohibit_public_ip_on_vnic = true
}


resource "oci_core_subnet" "DB-SN-AD1" {
  // AD 2
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  cidr_block = "${var.DB_SN1_CIDR}"
# display_name = "DB-SN-AD1"
  display_name = "DB-Subnet-AD1"
  dns_label = "DBSNAD1"
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  security_list_ids = ["${oci_core_security_list.DB-SL.id}"]

  route_table_id = "${oci_core_route_table.DB-RT.id}"
  dhcp_options_id = "${oci_core_dhcp_options.DB-DHCP.id}"

  prohibit_public_ip_on_vnic = true
}

