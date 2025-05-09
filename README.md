# 🚀 Low Code SaaS – On Prem 

This repository contains a Terraform configuration to deploy a containerized **Windmill workflow engine** on **Oracle Cloud Infrastructure (OCI)** using **OCI Container Instances**.

It includes all the necessary networking, container instance, and variable setup for automating Windmill deployment in a reproducible and cloud-native way.

---

## 🎯 Project Objective

To automate the provisioning of Windmill (a modern workflow orchestration engine) using **Terraform** on OCI without requiring a Kubernetes cluster or traditional compute VM, leveraging OCI’s lightweight **Container Instances** feature.

---

## 📦 Files Overview

| File | Description |
|------|-------------|
| `provider.tf` | Configures OCI provider and authentication |
| `network.tf` | Provisions VCN, subnet, and internet gateway |
| `container_instance.tf` | Defines the Windmill container instance setup |
| `variables.tf` | Defines input variables |
| `example.yaml` | Sample Windmill config schema |
| `schema.yaml` | Container job/workflow spec |
| `simple-rm.zip` | Sample ZIP payload (used inside the container)

---

## ⚙️ Requirements

- Terraform >= 1.3
- OCI CLI or credentials setup
- OCI Tenancy with permission to:
  - Create Container Instances
  - Create Networking resources (VCN, Subnet, IGW)
- [OCI Terraform Provider](https://registry.terraform.io/providers/oracle/oci/latest)

---

## 🔐 Setup `terraform.tfvars`

Create a `terraform.tfvars` file in the root directory with your values:

```hcl
# Authentication
tenancy_ocid         = "ocid1.tenancy.oc1..example"
user_ocid            = "ocid1.user.oc1..example"
fingerprint          = "xx:xx:xx:xx:xx"
private_key_path     = "~/.oci/oci_api_key.pem"

# Region
region               = "eu-frankfurt-1"

# Compartment
compartment_ocid     = "ocid1.compartment.oc1..example"
```

---

## 🚀 Deploy

```bash
terraform init
terraform plan
terraform apply
```

Once complete, the Windmill container will be running on a public subnet and accessible based on the container's port mappings.

---

## 🧪 Example Usage

The container image and startup arguments can be adapted in `container_instance.tf`:

```hcl
container {
  image_url = "ghcr.io/windmill-labs/windmill:main"
  command   = ["windmill", "server"]
  ...
}
```

---

## 🔄 Teardown

To destroy the infrastructure:

```bash
terraform destroy
```

---

## 🧱 Terraform Resources

- `oci_container_instances_container_instance`
- `oci_core_virtual_network`
- `oci_core_subnet`
- `oci_core_internet_gateway`
- `oci_core_route_table`

---

## 📘 References

- [OCI Container Instances Docs](https://docs.oracle.com/en-us/iaas/Content/ContInst/home.htm)
- [Windmill Docs](https://docs.windmill.dev)

---

## 📝 License

MIT License

---

## ✍️ Author

Built by [Your Name / Team] for reproducible cloud-native container automation on OCI.
