#Import AzureRM Resource module
Import-Module AzureRM.Resources

#Login
#Login-AzureRmAccount

#Create random strings for deployment
$par1 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par2 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par3 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

#GitHub parameters
$GHTempfile = "https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/gateway_webapp/parent.json"
$repoURL = "https://github.com/fredderf204/mfnode22.git"
$appInsights = "no"

#Create resource group
New-AzureRmResourceGroup -Name $par1 -Location "Australia East"

#Deploy azure resources from template
New-AzureRmResourceGroupDeployment -ResourceGroupName $par1 -TemplateFile $GHTempfile -appInsights $appInsights -appServicePlanName $par2 -repoURL $repoURL -webappname $par3 -Verbose