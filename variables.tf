variable "app_service_plan_os" {
  description = "App Service plan OS type"
  type        = string
}

variable "app_service_plan_sku" {
  description = "App Service plan SKU"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "resource_group_location" {
  description = "Resource group location"
  type        = string
}

variable "subscription_id" {
  description = "Subscription ID"
  type        = string
}

variable "tenant_id" {
  description = "Tenant ID"
  type        = string
}