#This PowerShell script deploys;
#      2 x App Service Plans
#      2 x Web Apps
#      1 x Traffic Manager Profile
#
#You will need to change the repoURL and branch variables to reflect your own 


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
$GHTempfile = ""
$repoURL = "https://github.com/fredderf204/mfnode22.git"
$branch = "master"

#Create resource group
New-AzureRmResourceGroup -Name $par1 -Location "Australia East"

#Deploy azure resources from template
New-AzureRmResourceGroupDeployment -ResourceGroupName $par1 -TemplateFile .\azuredeploy.json -uniqueDnsName $par2 -appServicePlanName $par3 -uniqueDnsNameForWebApp $par4 -repoURL $repoURL -branch $branch -Verbose