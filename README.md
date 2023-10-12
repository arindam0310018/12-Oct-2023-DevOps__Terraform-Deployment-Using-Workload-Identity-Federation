# BLOG POST COMMING SOON - Terraform Deployment Using Workload Identity Federation

| IMPORTANT NOTE:- |
| --------- |

Below is required to for Terraform Code to run using Azure Devops Pipelines using Workload Identity Federation Service Connection:-

| __#__ | __REQUIREMENT__ |
| --------- | --------- |
| 1. | App Registration with Federated Credentails. |
| 2. | Azure Resource Manager Workload Identity Federation Service Connection. |
| 3. | App Registration with Federated Credentails should have __Contributor__ RBAC on Subscription or Resource Group. |
| 4. | App Registration with Federated Credentails should have __Storage Data Blob Contributor__" on Storage Account where terraform State file(s) will be stored. |


| BELOW IS HOW APP REGISTRATION WITH FEDERATED CREDENTIALS LOOKS LIKE:- |
| --------- |










