resource "oci_database_autonomous_database" "SandboxATP" {
    #Required
    admin_password = "ATP-Demo#2018"
    compartment_id = "${var.compartment_ocid}"
    cpu_core_count = "2"
    data_storage_size_in_tbs = "1"
    db_name = "Sandbox${random_integer.number.result}"

    #Optional
    # defined_tags = {"Operations.CostCenter"= "42"}
    # display_name = "${var.autonomous_database_display_name}"
    # freeform_tags = {"Department"= "DemoDepartment"}
    license_model = "LICENSE_INCLUDED"
  	#license_model = "BRING_YOUR_OWN_LICENSE"    
}

resource "random_integer" "number" {
  min     = 1
  max     = 99
}