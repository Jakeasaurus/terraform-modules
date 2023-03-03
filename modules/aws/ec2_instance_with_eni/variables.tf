variable "ami" {
  description = "ID of AMI to use for the instance"
}

variable "associate_public_ip_address" {
  description = "If true, the EC2 instance will have associated public IP address"
  default     = false
}

variable "availability_zone" {
  description = "The AZ to start the instance in"
  default     = ""
}

variable "number" {
  description = "Number of instances to launch"
  default     = 1
}

variable "eni_number" {
  description = "Number of instances to launch"
  default     = 1
}

variable "description" {
  type        = string
  description = "(Optional) A description for the network interface"
}

variable "disable_api_termination" {
  description = "If true, enables EC2 Instance Termination Protection"
  default     = false
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
  default     = false
}

variable "key_name" {
  description = "The key name to use for the instance"
  default     = ""
}

variable "monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  default     = false
}

variable "name" {
  description = "Name to be used on all resources as prefix"
}

variable "placement_group" {
  description = "The Placement Group to start the instance in"
  default     = ""
}

variable "private_ips" {
  type        = list(any)
  description = "(Optional) List of private IPs to assign to the ENI."
}

variable "tenancy" {
  description = "The tenancy of the instance (if the instance is running in a VPC). Available values: default, dedicated, host."
  default     = "default"
}

variable "instance_initiated_shutdown_behavior" {
  type        = string
  description = "(Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information. https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/terminating-instances.html#Using_ChangingInstanceInitiatedShutdownBehavior"
  default     = "stop"
  validation {
    condition     = can(regex("stop|terminate", var.instance_initiated_shutdown_behavior))
    error_message = "The value must be either stop or terminate."
  }
}

variable "instance_type" {
  description = "The type of instance to start"
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(any)
}

variable "subnet_id" {
  description = "(Required) Subnet ID to create the ENI and EC2 instance in."
  default     = ""
}

variable "source_dest_check" {
  description = "Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs."
  default     = true
}

variable "user_data" {
  description = "The user data to provide when launching the instance"
  default     = ""
}

variable "iam_instance_profile" {
  description = "The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default     = ""
}

variable "ipv6_address_count" {
  description = "A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
  default     = 0
}

variable "ipv6_addresses" {
  description = "Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
  default     = []
}

variable "tags" {
  description = "A mapping of tags to assign to the resource"
  default     = {}
}

variable "region" {
  type        = string
  description = "(Required) VPC Region the resources exist in"
}

variable "http_endpoint" {
  type        = string
  description = "(Optional) Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled."
  default     = "enabled"
  validation {
    condition     = can(regex("^(enabled|disabled)$", var.http_endpoint))
    error_message = "The value must be either enabled or disabled."
  }
}

variable "http_tokens" {
  type        = string
  description = "(Optional) Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional."
  default     = "required"
  validation {
    condition     = can(regex("^(optional|required)$", var.http_tokens))
    error_message = "The value must be either optional or required."
  }
}

variable "root_block_device" {
  description = "Customize details about the root block device of the instance. See Block Devices below for details"
  default     = []
}

variable "ebs_block_device" {
  description = "Additional EBS block devices to attach to the instance"
  default     = []
}

variable "ephemeral_block_device" {
  description = "Customize Ephemeral (also known as Instance Store) volumes on the instance"
  default     = []
}

variable "network_interface" {
  description = "Customize network interfaces to be attached at instance boot time"
  default     = []
}

variable "private_ips_count" {
  description = "Number of private IPs to assign to the eni"
  default     = 0
}

variable "attachment" {
  description = "Attachment block for assigning the eni to an instance"
  default     = []
}

variable "device_index" {
  description = "eni index to attach the eni to on the instance"
}

variable "delete_on_termination" {
  description = "whether or not to delete the eni on instance termination"
  default     = false
}
