resource "oci_core_volume_group" "AppInstance01AD1VolGroup" {
	#Required
	availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
	compartment_id = "${var.compartment_ocid}"
	source_details {
		#Required
		type = "volumeIds"
		volume_ids = [ "${oci_core_instance.AppInstance01AD1.boot_volume_id}",
                   "${oci_core_volume.AppInstance01AD1-BV-01.id}"]
	}
}

resource "oci_core_volume_group_backup" "AppInstance01AD1VolGroupBackup" {
	#Required
	volume_group_id = "${oci_core_volume_group.AppInstance01AD1VolGroup.id}"

	#Optional
	type = "${var.volume_group_backup_type}"
}

resource "oci_core_volume" "AppInstance01AD1-BV-01" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "AppInstance01AD1-BV-01"
  size_in_gbs = "50"
}

resource "oci_core_instance" "AppInstance01AD1" {
  availability_domain = "${lookup(data.oci_identity_availability_domains.AD.availability_domains[var.domains["AD1"]],"name")}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "AppInstance01AD1"
  shape = "VM.Standard1.2"
  fault_domain = "${var.fault_domains["FD1"]}"

  create_vnic_details {
	subnet_id = "${oci_core_subnet.APP-SN-AD1.id}"
    display_name = "AppInstance01AD1VNIC"
    hostname_label = "AppInstance01AD1"
	private_ip = "${var.Instances_privateIP["APPInstance01AD1"]}"
    assign_public_ip = false
    skip_source_dest_check = false
  }

  source_details {
    source_type = "image"
    source_id = "${var.image-Oracle-Linux-7-5-2018-08-14-0[var.region]}"
    boot_volume_size_in_gbs = "50"
  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  preserve_boot_volume = true

	metadata {
		ssh_authorized_keys = "${file(var.ssh_public_key_path)}"
		user_data = "${base64encode(file(var.APPBootStrapFile))}"
	}

  timeouts {
    create = "60m"
  }
}

data "oci_core_vnic_attachments" "AppInstance01AD1Vnics" {
    compartment_id = "${var.compartment_ocid}"
    instance_id = "${oci_core_instance.AppInstance01AD1.id}"
}

data "oci_core_vnic" "AppInstance01AD1Vnic" {
    vnic_id = "${lookup(data.oci_core_vnic_attachments.AppInstance01AD1Vnics.vnic_attachments[0],"vnic_id")}"
}

resource "oci_core_volume_attachment" "AppInstance01AD1Vol01Attachment" {
	#Required
	instance_id = "${oci_core_instance.AppInstance01AD1.id}"
	attachment_type = "iscsi"
	volume_id = "${oci_core_volume.AppInstance01AD1-BV-01.id}"

	#Optional
	display_name = "AppInstance01AD1Vol01Attachment"
}

output "AppInstance01AD1 Block Volume Attachment" {
  #value = "${lookup( data.oci_identity_swift_passwords.SP.password[0], "swift_password")}"
  value = ["sudo iscsiadm -m node -o new -T ${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.iqn} -p ${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.ipv4}:${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.port}",
    "sudo iscsiadm -m node -o update -T ${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.iqn} -n node.startup -v automatic",
    "sudo iscsiadm -m node -T ${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.iqn} -p ${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.ipv4}:${oci_core_volume_attachment.AppInstance01AD1Vol01Attachment.port} -l"
  ]
}
