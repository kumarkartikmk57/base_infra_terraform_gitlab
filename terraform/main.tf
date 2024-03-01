resource "google_vpc_access_connector" "connector" {
  name          = var.connectorname
  region        = var.region
  subnet {
    name = google_compute_subnetwork.custom_test.name
  }
  machine_type = "e2-standard-4"
}

resource "google_compute_subnetwork" "custom_test" {
  name          = "vpc-terraformb-subnet"
  ip_cidr_range = "10.2.0.0/28"
  region        = var.region
  network       = google_compute_network.custom_test.id
  depends_on = [ google_compute_network.custom_test ]
}

resource "google_compute_network" "custom_test" {
  name                    = "vpc-terraformb"
  auto_create_subnetworks = false
}