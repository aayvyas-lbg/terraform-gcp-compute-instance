variable "name" {
  description = "Name of the Compute Engine instance"
  type        = string

  validation {
    condition     = strcontains(var.name, "vm")
    error_message = "value must contain 'vm'."
  }
}

variable "network" {
  description = "Name of the VPC network to use"
  type        = string
}

variable "size" {
  description = "Size of the boot disk in GB"
  type        = number
  validation {
    condition     = var.size >= 10 && var.size <= 1000
    error_message = "value must be between 10 and 1000."
  }
}

variable "labels" {
  description = "Labels to apply to the instance"
  type        = map(string)
}

variable "machine_type" {
  description = "Machine type of the instance"
  type        = string
}

variable "app_type" {
  description = "must be either nodejs, spring-boot, flask, jenkins"
  type        = string
  validation {
    condition     = contains(["nodejs", "spring-boot", "flask", "jenkins"], var.app_type)
    error_message = "value must be either nodejs, spring-boot, flask, jenkins."
  }

}
