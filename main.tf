terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.31.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5.3"
    }
  }
}

locals {
  app_service_name        = "${var.resource_group_name}-as"
  app_service_plan_name   = "${var.resource_group_name}-asp"
  app_service_plan_os     = var.app_service_plan_os
  app_service_plan_sku    = var.app_service_plan_sku
  resource_group_location = var.resource_group_location
  resource_group_name     = var.resource_group_name
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = local.resource_group_location
}

resource "azurerm_service_plan" "app_service_plan" {
  name                = local.app_service_plan_name
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  sku_name            = local.app_service_plan_sku
  os_type             = local.app_service_plan_os
}

resource "azurerm_windows_web_app" "app_sevice" {
  name                = local.app_service_name
  resource_group_name = local.resource_group_name
  location            = local.resource_group_location
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {}
}