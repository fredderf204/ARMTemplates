#Import AzureRM Resource module
Import-Module AzureRM.Resources

#Login
#Login-AzureRmAccount

#Create random strings for deployment
$par1 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par2 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par3 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par4 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

#GitHub parameters
#$GHTempfile = "https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json"
$GHTempfile = 'C:\Users\mifrie\Documents\Code\ARM\scm\ARMTemplates\webapp_linux_github\azuredeploy.json'
$repoURL = "https://github.com/fredderf204/mfnode22.git"
$branch = "master"

#Create resource group
New-AzureRmResourceGroup -Name $par1 -Location "Southeast Asia"

#Deploy azure resources from template
New-AzureRmResourceGroupDeployment -ResourceGroupName $par1 -TemplateFile $GHTempfile -appServicePlanName $par2 -sku S1 -workersize 0 -numberworkers 1 -webappname $par3 -repoURL $repoURL -branch $branch -Verbose
