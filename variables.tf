variable "enabled" {
  default     = true
  description = "Set to `false` to prevent the module from creating any resources"
  type        = bool
}


variable "publish" {
  default     = false
  description = "Set to `false` to prevent the module from publishing the version"
  type        = bool
}
variable "role" {
  type = string
  description = "(optional) describe your variable"
  default = ""
}

variable "environment" {
  type = map
  default = {}
}
variable "function_name" {
  default = ""
}

variable "handler" {
  default = "lambda"
}

variable "description" {
  default = ""
}

variable "runtime" {
  type = string
  default = ""
}
variable "source_code_hash" {
  type = string
  default = ""
}

variable "filename" {
  type = string
  default = ""
}
variable "tags" {
  type = map
  default = {}

}

variable "timeout" {
  type = string
  description = "(optional) describe your variable"
  default = "420"
}
# --- New VPC-related variables ---

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "List of subnet IDs for the Lambda function VPC config (leave empty for no VPC)"
}

variable "security_group_ids" {
  type        = list(string)
  default     = []
  description = "List of security group IDs for the Lambda function VPC config (leave empty for no VPC)"
}
