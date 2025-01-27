resource "oci_core_instance" "ocarm1" {

    availability_domain = data.oci_identity_availability_domains.homelab_availability_domains.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.A1.Flex"
    display_name = "ocarm1"

    shape_config {
    memory_in_gbs = 12
    ocpus         = 2
    }

    metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys,
    user_data = filebase64("${path.module}/scripts/init.sh")
    }

    create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.homelab_public_subnet.id
    assign_private_dns_record = true
    private_ip                = "10.0.0.11"
    hostname_label            = "ocarm1"
    }

    source_details {
    #Required
    source_id = var.ampere_source_image_id
    source_type = "image"
    boot_volume_size_in_gbs = var.ampere_boot_volume_size
    }
}

resource "oci_core_instance" "ocarm2" {

    availability_domain = data.oci_identity_availability_domains.homelab_availability_domains.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.A1.Flex"
    display_name = "ocarm2"

    shape_config {
    memory_in_gbs = 12
    ocpus         = 2
    }

    metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys,
    user_data = filebase64("${path.module}/scripts/init.sh")
    }

    create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.homelab_public_subnet.id
    assign_private_dns_record = true
    private_ip                = "10.0.0.12"
    hostname_label            = "ocarm2"
    }

    source_details {
    #Required
    source_id = var.ampere_source_image_id
    source_type = "image"
    boot_volume_size_in_gbs = var.ampere_boot_volume_size
    }
}

resource "oci_core_instance" "ocamd1" {

    availability_domain = data.oci_identity_availability_domains.homelab_availability_domains.availability_domains[0].name
    compartment_id = var.compartment_id
    shape = "VM.Standard.E2.1.Micro"
    display_name = "ocamd1"

    shape_config {
    memory_in_gbs = 1
    ocpus         = 1
    }

    metadata = {
    ssh_authorized_keys = var.ssh_authorized_keys,
    user_data = filebase64("${path.module}/scripts/init.sh")
    }

    create_vnic_details {
    assign_public_ip          = true
    subnet_id                 = oci_core_subnet.homelab_public_subnet.id
    assign_private_dns_record = true
    private_ip                = "10.0.0.13"
    hostname_label            = "ocamd1"
    }

    source_details {
    #Required
    source_id = var.amd_source_image_id
    source_type = "image"
    boot_volume_size_in_gbs = var.amd_boot_volume_size
    }
}