terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_log_analytics_workspace" "law" {
  name = var.logAnalyticsWorkspace
  location = var.location
  resource_group_name = var.resourceGroupName
  sku = var.sku
  retention_in_days = var.retentionDays
}

resource "azurerm_sentinel_log_analytics_workspace_onboarding" "sentinel" {
  workspace_id = azurerm_log_analytics_workspace.law.id
}
