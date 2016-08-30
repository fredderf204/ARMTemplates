# ARM Templates
This is a collection of demo Azure Resource Manager Templates that I am working on.

## Index
webapp_github - Deploy a demo Azure Web App with SCM integration with a Public GitHub Repo

webapp_github_auto - Deploy a demo Azure Web App with GitHub SCM integration and an Autoscaling profile

webapp_localgit - Deploy an Azure Web App with local Git SCM integration  

## Installation
To deploy these ARM templates, you will need to have either Azure PowerShell or the Azure CLI installed. Please see links below;

#### Azure PowerShell 
https://azure.microsoft.com/en-us/documentation/articles/powershell-install-configure/

#### Azure CLI
https://azure.microsoft.com/en-us/documentation/articles/xplat-cli-install/

## Usage
Now have installed either Azure Powershell or the Azure CLI you are ready to deploy ARM templates. Please see the links below on how to deploy;

#### Azure PowerShell
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy/

#### Azure CLI
https://azure.microsoft.com/en-us/documentation/articles/resource-group-template-deploy-cli/

## Example
Please see some examples below;

#### Azure PowerShell
1. `New-AzureRmResourceGroup -Name demo01 -Location "Australia East"`
2. `Test-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`
3. `New-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`

#### Azure CLI
1. `azure group create demo02 "australia east"`
2. `azure group template validate --template-uri https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json -g demo02 -p "{\"appServicePlanName\":{\"value\":\"mfappplan03\"},\"sku\":{\"value\":\"F1\"},\"workerSize\":{\"value\":\"0\"},\"numberworkers\":{\"value\":\"1\"},\"webappname\":{\"value\":\"mfdemo004\"},\"repoURL\":{\"value\":\"https://github.com/fredderf204/mfnode22.git\"},\"branch\":{\"value\":\"master\"}}"`
3. `azure group deployment create --template-uri https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json -g demo02 -p "{\"appServicePlanName\":{\"value\":\"mfappplan03\"},\"sku\":{\"value\":\"F1\"},\"workerSize\":{\"value\":\"0\"},\"numberworkers\":{\"value\":\"1\"},\"webappname\":{\"value\":\"mfdemo004\"},\"repoURL\":{\"value\":\"https://github.com/fredderf204/mfnode22.git\"},\"branch\":{\"value\":\"master\"}}"`

**Please note that you will need to change the repoURL and branch values to suit your needs. 

Also feel free to fork my demo app https://github.com/fredderf204/mfnode22