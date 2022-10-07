# Terraform development setup

## Required variables

|Name | Description | Value | Set by |
| -- | -- | -- | -- |
| cluster_name | The name of the OKE cluster. This will be appended to the label_prefix. | n/a |API via UI (customer)|
| compartment_ocid | The OCID of the compartment where the OKE cluster will be created.|ocid1.compartment.oc1..aaaaaaaaafkddic2env66xpdde3cg74fjn7tvaapf2hjd4zzsnxsmxfxudla|API via CloudTrust|
| tenancy_ocid | The OCID of the tenancy where the OKE cluster will be created.|ocid1.tenancy.oc1..aaaaaaaacg2kx2vh5y62jvq7bqpgmt7komml6rshkw4hlidt5y2su5gacyja|API via CloudTrust|
| home_region | The tenancy’s home region. Required to perform identity operations. |us-ashburn-1|API via CloudTrust|
| region | The OCI region where OKE resources will be created. |us-ashburn-1 |API via CloudTrust|
| kubernetes_version | The version of Kubernetes to provision. This is based on the available versions in [OKE](https://docs.oracle.com/en-us/iaas/Content/ContEng/Concepts/contengaboutk8sversions.htm). | v1.24.1| API via UI (customer) |
| node_pool_image_id | The OCID of custom image to use when provisioning worker nodes. |ocid1.image.oc1.iad.aaaaaaaa367tu3e7et5gdwux4lttgavlnqwy3v62hjjm22qwalshpvbi27oq | ?Static? |
| node_pool_image_type | The OCID of custom image to use when provisioning worker nodes. Accepted values are custom, oke, platform.| custom | ?Static? |
| node_pools | The number, shape of node pool, node_pool_size to create. |{np1 = { shape = "BM.GPU2.2", node_pool_size = "3", placement_ads = [1] }, np2 = { shape = "VM.Standard.E4.Flex", ocpus = 1, memory = 16, node_pool_size = 3, boot_volume_size = 150, label = { app = "frontend", pool = "np2" } }}| API via UI (customer) |
| ssh_private_key_path | The path to ssh private key. The same key will be used to access worker nodes using SSH. Required if bastion is enabled.| breakglass_id_rsa | ?CloudTrust? |
| ssh_public_key_path | The path to ssh public key. The same key will be used to access worker nodes using SSH. Required if bastion is enabled.|breakglass_id_rsa.pub | ?CloudTrust? |

## Optional variables

[Defaults](https://github.com/oracle-terraform-modules/terraform-oci-oke/blob/main/docs/terraformoptions.adoc#oke)
