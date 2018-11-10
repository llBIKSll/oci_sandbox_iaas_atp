variable "tenancy_ocid" {}

variable "user_ocid" {}

variable "fingerprint" {
	default = "c5:13:58:41:ed:6f:a7:78:50:f0:e5:d8:b0:5b:08:e0"
}

variable "compartment_ocid" {}

variable "region" {}

# variable "root_compartment_ocid" {}

variable "INTERNET_CIDR" {
  default = "0.0.0.0/0"
}

variable "CLOUD_CIDR" {
  default = "192.168.240.0/22"
}

variable "BST_SN1_CIDR" {
  default = "192.168.240.0/26"
}

variable "MGMT_SN1_CIDR" {
  default = "192.168.240.64/26"
}

variable "APP_SN1_CIDR" {
  default = "192.168.240.128/26"
}

variable "DB_SN1_CIDR" {
  default = "192.168.240.192/26"
}
variable "BST_SN2_CIDR" {
  default = "192.168.241.0/26"
}

variable "MGMT_SN2_CIDR" {
  default = "192.168.241.64/26"
}

variable "APP_SN2_CIDR" {
  default = "192.168.241.128/26"
}

variable "DB_SN2_CIDR" {
  default = "192.168.241.192/26"
}

variable "BST_SN3_CIDR" {
  default = "192.168.242.0/26"
}

variable "MGMT_SN3_CIDR" {
  default = "192.168.242.64/26"
}

variable "APP_SN3_CIDR" {
  default = "192.168.242.128/26"
}

variable "DB_SN3_CIDR" {
  default = "192.168.242.192/26"
}


# variable "ONPREMISES_STATIC_ROUTES" {
#   default = [ "10.10.2.0/24",
#               "10.10.11.0/24",
#               "10.10.12.0/24",
#               "10.10.13.0/24",
#               "10.10.15.0/24",
#               "192.168.9.0/24" ]
#}

variable "private_key_path" {
  default =".\\.oci\\oci_api_key.pem"
}
variable "ssh_public_key_path" {
  default = ".\\.ssh\\id_rsa.pub"
}

/*
variable "ssl_ca_certificate_path" {
  default = ".\\cert\\CSM-QuickStart-CA-Certificate.crt"
}
variable "ssl_private_key_path" {
  default = ".\\cert\\CSM-QuickStart-PrivateKey.key"
}

variable "ssl_public_certificate_path" {
  default = ".\\cert\\CSM-QuickStart-SSL-Certificate.crt"
}
*/

variable "tenancy" {
  default = "SandBox"
}

variable "domains" {
  type = "map"

  default = {
    AD1 = 0
    AD2 = 1
    AD3 = 2
  }
}

variable "fault_domains" {
  type = "map"

  default = {
    FD1 = "FAULT-DOMAIN-1"
    FD2 = "FAULT-DOMAIN-2"
    FD3 = "FAULT-DOMAIN-3"
  }
}

variable "regions" {
  type = "map"

  default = {
    PHX = "us-phoenix-1"   //Phoenix, AZ metropolitan area
    IAD = "us-ashburn-1"   //Ashburn, VA
    FRA = "eu-frankfurt-1" //Frankfurt, Germany
    LHR = "uk-london-1"    //London, United Kingdom
  }
}

variable "volume_group_backup_type" {
  default = "INCREMENTAL"
}

variable "Instances_privateIP" {
  type = "map"
  
  default = {
    BSTInstance01AD1 = "192.168.240.2"
	BSTInstance01AD2 = "192.168.241.2"
	BSTInstance01AD3 = "192.168.242.2"
	VPNInstance01AD1 = "192.168.240.3"
	VPNInstance01AD2 = "192.168.241.3"
	VPNInstance01AD3 = "192.168.242.3"
	APPInstance01AD1 = "192.168.240.130"
	APPInstance01AD2 = "192.168.241.130"
	APPInstance01AD3 = "192.168.242.130"
	}
}

variable "VPNBootStrapFile" {
  default = "./userdata/vpnbootstrap"
}
variable "APPBootStrapFile" {
  default = "./userdata/appbootstrap"
}
