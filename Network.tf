resource "oci_core_virtual_network" "DefaultVCN" {
  cidr_block = "${var.CLOUD_CIDR}"
  dns_label = "${var.tenancy}VCN"
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.tenancy}VCN"
}

resource "oci_core_internet_gateway" "DefaultIGW" {
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.tenancy}IGW"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
}

data "oci_core_services" "OCIServices" {
  filter {
		name = "name"
		values = [".*Object.*Storage"]
		regex = true
	}
}

resource "oci_core_service_gateway" "DefaultSGW" {
	#Required
  compartment_id = "${var.compartment_ocid}"
  display_name = "${var.tenancy}SGW"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

	services {
		#Required
		service_id = "${lookup(data.oci_core_services.OCIServices.services[0], "id")}"
	}
}

resource "oci_core_nat_gateway" "DefaultNGW" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

    #Optional
    #block_traffic = "${var.nat_gateway_block_traffic}"
    #defined_tags = {"Operations.CostCenter"= "42"}
    #freeform_tags = {"Department"= "Finance"}
    display_name = "${var.tenancy}NGW"
}




resource "oci_core_route_table" "DMZ-RT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "DMZ-RT"
  route_rules {
      destination = "0.0.0.0/0"
      network_entity_id = "${oci_core_internet_gateway.DefaultIGW.id}"
  }
  
  route_rules {
    destination = "${lookup(data.oci_core_services.OCIServices.services[0], "cidr_block")}"
    destination_type = "SERVICE_CIDR_BLOCK"
    network_entity_id = "${oci_core_service_gateway.DefaultSGW.id}"
  }
}

resource "oci_core_route_table" "MGMT-RT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "MGMT-RT"

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = "${oci_core_nat_gateway.DefaultNGW.id}"
  }
  
  route_rules {
         destination = "${lookup(data.oci_core_services.OCIServices.services[0], "cidr_block")}"
 	       destination_type = "SERVICE_CIDR_BLOCK"
         network_entity_id = "${oci_core_service_gateway.DefaultSGW.id}"
  }
}

resource "oci_core_route_table" "APP-RT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "APP-RT"

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = "${oci_core_nat_gateway.DefaultNGW.id}"
  }
  
  route_rules {
         destination = "${lookup(data.oci_core_services.OCIServices.services[0], "cidr_block")}"
 	       destination_type = "SERVICE_CIDR_BLOCK"
         network_entity_id = "${oci_core_service_gateway.DefaultSGW.id}"
  }
}

resource "oci_core_route_table" "DB-RT" {
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "DB-RT"

  route_rules {
    destination = "0.0.0.0/0"
    network_entity_id = "${oci_core_nat_gateway.DefaultNGW.id}"
  }
  
  route_rules {
         destination = "${lookup(data.oci_core_services.OCIServices.services[0], "cidr_block")}"
 	       destination_type = "SERVICE_CIDR_BLOCK"
         network_entity_id = "${oci_core_service_gateway.DefaultSGW.id}"
  }
}

resource "oci_core_dhcp_options" "DMZ-DHCP" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = [ "${var.tenancy}vcn.oraclevcn.com" ]
    }

    vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

    #Optional
    display_name = "DMZ-DHCP"
}

resource "oci_core_dhcp_options" "MGMT-DHCP" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = [ "${var.tenancy}vcn.oraclevcn.com" ]
    }

    vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

    #Optional
    display_name = "MGMT-DHCP"
}

resource "oci_core_dhcp_options" "APP-DHCP" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = [ "${var.tenancy}vcn.oraclevcn.com" ]
    }

    vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

    #Optional
    display_name = "APP-DHCP"
}

resource "oci_core_dhcp_options" "DB-DHCP" {
    #Required
    compartment_id = "${var.compartment_ocid}"
    options {
        type = "DomainNameServer"
        server_type = "VcnLocalPlusInternet"
    }

    options {
        type = "SearchDomain"
        search_domain_names = [ "${var.tenancy}vcn.oraclevcn.com" ]
    }

    vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"

    #Optional
    display_name = "DB-DHCP"
}