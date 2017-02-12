# ARM Templates
This is a collection of demo Azure Resource Manager Templates that I am working on :sweat_smile:

## Index

|Template Name                         |Description                                                                                                                    |
|:-------------------------------------|:------------------------------------------------------------------------------------------------------------------------------|
| **trafficmanager_2webapp** :octocat:          | Deploy 2 Azure Web Apps in different regions with a Traffic Manager Profile using weighted traffic Routing Method.            |
| **webapp_deploymentslot** :octocat:            | Deploy a demo Azure Web App with SCM integration to a deployment slot for staged deployments.                                 |
| **webapp_github** :octocat:                    | Deploy a demo Azure Web App with SCM integration with a Public GitHub Repo.                                                   |
| **webapp_github_appinsights** :octocat:        | Deploy a demo Azure Web App with SCM integration with a Public GitHub Repo and integration with Application Insights.         |
| **webapp_github_auto** :octocat:               | Deploy a demo Azure Web App with GitHub SCM integration and an Autoscaling profile.                                           |
| **webapp_localgit**                  | Deploy an Azure Web App with local Git SCM integration.                                                                       |
| **webapp_localgit_slot**             | Deploy an Azure Web App with local Git SCM integration to a deployment slot for staged deployments.                           |
| **webapp_localgit_slot_appinsights** | Deploy an Azure Web App with local Git SCM integration to a deployment slot for staged deployments with Application Insights. |
| **webapp_slot_appinsights**          | Deploy an Azure Web App to a deployment slot for staged deployments with Application Insights.                                |

## Installation
To deploy these ARM templates, you will need to have either Azure PowerShell or the Azure Xplat CLI installed. Please see links below;

#### Azure PowerShell 
https://azure.microsoft.com/en-us/documentation/articles/powershell-install-configure/

#### Azure Xplat CLI
https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

## Usage
Now have installed either Azure Powershell or the Azure Xplat CLI you are ready to deploy ARM templates. Please see the links below on how to deploy;

#### Azure PowerShell
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/

#### Azure Xplat CLI
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy-cli/

## Deployment Examples
Please see some deployment examples below;

### Deployment Script
Some of the ARM templates are accompanied by deploy.ps1 or deploy.sh scripts. These scripts can be used to facilitate the deployment of the ARM templates into Azure.

The reason I have started using these scripts for azure demos is because

1. When producing demos in azure, I find it quicker and eaiser to run a script then to type out multiple commands
2. When producing demos in azure, I use the script to randomise the names of my resource groups and resources.  

### Azure PowerShell
Below is one example on how to use PowerShell to deploy a new reosurce group in azure, followed by the command to test the ARM template and finally followed by a command to deploy the template to azure.

1. `New-AzureRmResourceGroup -Name demo01 -Location "Australia East"`
2. `Test-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`
3. `New-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`

### Azure Xplat CLI
Below is one example on how to use bash and the azure xplat cli to deploy a new reosurce group in azure, followed by the command to test the ARM template and finally followed by a command to deploy the template to azure.

1. `azure group create demo02 "australia east"`
2. `azure group template validate --template-uri https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json -g demo02 -p "{\"appServicePlanName\":{\"value\":\"mfappplan03\"},\"sku\":{\"value\":\"F1\"},\"workerSize\":{\"value\":\"0\"},\"numberworkers\":{\"value\":\"1\"},\"webappname\":{\"value\":\"mfdemo004\"},\"repoURL\":{\"value\":\"https://github.com/fredderf204/mfnode22.git\"},\"branch\":{\"value\":\"master\"}}"`
3. `azure group deployment create --template-uri https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json -g demo02 -p "{\"appServicePlanName\":{\"value\":\"mfappplan03\"},\"sku\":{\"value\":\"F1\"},\"workerSize\":{\"value\":\"0\"},\"numberworkers\":{\"value\":\"1\"},\"webappname\":{\"value\":\"mfdemo004\"},\"repoURL\":{\"value\":\"https://github.com/fredderf204/mfnode22.git\"},\"branch\":{\"value\":\"master\"}}"`

**Please note that you will need to change the repoURL and branch values to suit your needs. 

Also feel free to fork my demo app https://github.com/fredderf204/mfnode22