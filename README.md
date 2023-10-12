# BLOG POST COMING SOON - Terraform Deployment with Az Devops Piepline Using Workload Identity Federation

| IMPORTANT NOTE:- |
| --------- |

Below is required for Terraform Code to run using Azure Devops Pipelines using Workload Identity Federation Service Connection:-

| __#__ | __REQUIREMENT__ |
| --------- | --------- |
| 1. | App Registration with Federated Credentails. |
| 2. | Azure Resource Manager Workload Identity Federation Service Connection. |
| 3. | App Registration with Federated Credentails should have __Contributor__ RBAC on Subscription or Resource Group. |
| 4. | App Registration with Federated Credentails should have __Storage Data Blob Contributor__" on Storage Account where terraform State file(s) will be stored. |
| 5. | __Microsoft DevLabs Terraform__ updated Terraform Tasks to support Workload Identity Federation (__- task: TerraformTaskV4@4__). |
| 6. | Along with Point 5, the environmental variable is required (__ARM_USE_AZUREAD: true__). This environment variable tells the backend to use AzureAD auth rather than trying a create a key. It means we can limit the permissions applied to the storage account and container to least priviledge: https://developer.hashicorp.com/terraform/language/settings/backends/azurerm#use_azuread_auth. |


| BELOW CODE BLOCK SHOWS HOW TO SET THE ENVIRONMENTAL VARIABLES (Point 6):- |
| --------- |

```
# Terraform Init:-
    - task: TerraformTaskV4@4
      displayName: TERRAFORM INIT
      inputs:
        provider: 'azurerm'
        command: 'init'
        workingDirectory: '$(workingDir)'
        backendServiceArm: '${{ parameters.ServiceConnection }}' 
        backendAzureRmResourceGroupName: '$(ResourceGroup)' 
        backendAzureRmStorageAccountName: '$(StorageAccount)'
        backendAzureRmContainerName: '$(Container)'
        backendAzureRmKey: '$(TfstateFile)'
      env:
        ARM_USE_AZUREAD: true
```

| BELOW IS HOW APP REGISTRATION WITH FEDERATED CREDENTIALS LOOKS LIKE:- |
| --------- |
| __App Registration with Federated Credetials.__ |
|  |











