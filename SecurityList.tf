data "oci_identity_availability_domains" "AD" {
  compartment_id = "${var.compartment_ocid}"
}
#http://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml
resource "oci_core_security_list" "MGMT-SL" {
	#Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "MGMT-SL"

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

// allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

// allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

// allow inbound TCP 3389
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 3389
      "max" = 3389
    }
  }

// allow inbound TCP 3389
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 3389
      "max" = 3389
    }
  }
  
// allow inbound TCP 3389
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.BST_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 3389
      "max" = 3389
    }
  }
    
  // allow outbound TCP 80
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
   }
  }

// allow outbound TCP 80
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
   }
  }

// allow outbound TCP 80
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.APP_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

// allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

// allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 22
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

// allow outbound TCP 443
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
   }
  }

}

resource "oci_core_security_list" "BST-SL" {
	#Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "DMZ-SL"

  // allow outbound tcp traffic on all ports
	egress_security_rules {
		#Required
		destination = "${var.INTERNET_CIDR}"
		protocol = "all"
	}

  // allow inbound TCP 443 FROM any
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.INTERNET_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
    }
  }

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.INTERNET_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound TCP 22 from On Premises
  # ingress_security_rules {
  #   protocol = "all" // tcp
  #   source = "${var.ONPREMISES_STATIC_ROUTES[0]}"
  #   stateless = false
  # }
}

resource "oci_core_security_list" "APP-SL" {
	#Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "APP-SL"

  // allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN1_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

 // allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN2_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

 // allow outbound TCP 1521
  egress_security_rules {
    protocol = "6" // tcp
    destination = "${var.DB_SN3_CIDR}"
      
    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
   }
  }

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

// allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

// allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }
  // allow inbound TCP 80
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
    }
  }

// allow inbound TCP 80
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
    }
  }

// allow inbound TCP 80
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 80
      "max" = 80
    }
  }

  // allow inbound TCP 443
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
    }
  }

// allow inbound TCP 443
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
    }
  }

// allow inbound TCP 443
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 443
      "max" = 443
    }
  }



  // allow inbound ICMP
  ingress_security_rules {
    protocol = "1" // icmp_code
    source = "${var.CLOUD_CIDR}"
    stateless = false
  }

  // allow inbound All Protocols from On Premises
  # ingress_security_rules {
  #     source = "${var.ONPREMISES_STATIC_ROUTES[0]}"
  #     protocol = "all"
  # }
}

resource "oci_core_security_list" "DB-SL" {
	#Required
  compartment_id = "${var.compartment_ocid}"
  vcn_id = "${oci_core_virtual_network.DefaultVCN.id}"
  display_name = "DB-SL"

  // allow outbound tcp traffic on all ports
	#egress_security_rules {
		#Required
		#destination = "${var.CLOUD_CIDR}"
		#protocol = "all"
	#}

  // allow inbound TCP 22 
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

 // allow inbound TCP 22 
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

 // allow inbound TCP 22 
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound TCP 22
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 22
      "max" = 22
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.MGMT_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN1_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN2_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow inbound TCP 1521
  ingress_security_rules {
    protocol = "6" // tcp
    source = "${var.APP_SN3_CIDR}"
    stateless = false

    tcp_options {
      // These values correspond to the destination port range.
      "min" = 1521
      "max" = 1521
    }
  }

  // allow ICMP 
  #ingress_security_rules {
    #protocol = "1" // icmp_code
    #source = "${var.CLOUD_CIDR}"
    #stateless = false
  #}

  // allow inbound All Protocols from On Premises
  # ingress_security_rules {
  #   #Required
  #   source = "${var.ONPREMISES_STATIC_ROUTES[0]}"
  #   protocol = "all"
  # }
}
