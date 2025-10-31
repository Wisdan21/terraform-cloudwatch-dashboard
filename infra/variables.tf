variable "student_name" {
    type        = string
    description = "The namespace for CloudWatch metrics"
    default     = "wisdananes"
}

variable "alarm_email" {
  description = "Email address to receive alarm notifications"
  type        = string


}

