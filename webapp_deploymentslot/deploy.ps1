#This will deploy a web app with a staging deployment slot
#
#You will need to change the repoURL and branch variables to reflect your own 


#Import AzureRM Resource module
Import-Module AzureRM.Resources

#Login
Login-AzureRmAccount

#Create random strings for deployment
$par1 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par2 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})
$par3 = -join ((65..90) + (97..122) | Get-Random -Count 8 | % {[char]$_})

#GitHub parameters
#$GHTempfile = "https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/trafficmanager_2webapp/azuredeploy.json"
$repoURL = 'https://github.com/fredderf204/mfnode22.git'
$branch = 'master'
$slotname = 'staging'

#Create resource group
New-AzureRmResourceGroup -Name $par1 -Location 'Australia East'

#Deploy azure resources from template
New-AzureRmResourceGroupDeployment -ResourceGroupName 'test03' -TemplateFile $GHTempfile -slotName $slotname -appServicePlanName $par2 -webappname $par3 -repoURL $repoURL -branch $branch -Verbose
