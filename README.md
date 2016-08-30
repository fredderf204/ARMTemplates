# ARM Templates
This is a collection of demo Azure Resource Manager Templates that I am working on.

## Key
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

#### Azure Powershell
1. `New-AzureRmResourceGroup -Name demo01 -Location "Australia East"`
2. `Test-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`
3. `New-AzureRmResourceGroupDeployment -ResourceGroupName demo01 -TemplateUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json' -TemplateParameterUri 'https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.parameters.json' -Verbose`

#### Azure CLI
1. `azure group create demo02 "australia east"`


