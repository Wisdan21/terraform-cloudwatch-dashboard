variable "threshold" {
  default = 500000
  type    = number
}

variable "alarm_email" {
  description = "Email address to receive alarm notifications"
  type        = string
}

variable "prefix" {
  description = "Prefix for naming resources"
  type        = string
}
