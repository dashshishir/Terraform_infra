terraform {
  cloud {
    organization = "VProfile"

    workspaces {
      name = "VprofileInfra"
    }
  }
}