variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "pub_cidr" {
  default = "10.0.4.0/24"
}
variable "av_zones" {
  type = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "prv_cidr" {
  default = "10.0.3.0/24"
}


variable "tag" {
  default = "Main"
}
