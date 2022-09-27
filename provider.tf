provider "oci" {
  region           = var.region
}

provider "oci" {
  region           = var.home_region
  alias            = "home"
}
