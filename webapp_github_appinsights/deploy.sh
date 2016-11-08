#!/bin/bash
#login
azure login
#create random strings for deployment
par1=`cat /dev/urandom | tr -dc 'a-zA-Z' | head -c 8`
par2=`cat /dev/urandom | tr -dc 'a-zA-Z' | head -c 8`
par3=`cat /dev/urandom | tr -dc 'a-zA-Z' | head -c 8`
#gitHub parameters
ghTempfile="https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json"
repoURL="https://github.com/fredderf204/mfnode22.git"
branch="master"
#create resource group
azure group create "KswUedIo" "australia east"
#deploy azure resources from template
azure group deployment create --template-uri "https://raw.githubusercontent.com/fredderf204/ARMTemplates/master/webapp_github/azuredeploy.json" -g "KswUedIo" -p "{\"appServicePlanName\":{\"value\":\"JuwxeHGs\"},\"sku\":{\"value\":\"S1\"},\"workerSize\":{\"value\":\"0\"},\"numberworkers\":{\"value\":\"1\"},\"webappname\":{\"value\":\"IjqaSweC\"},\"repoURL\":{\"value\":\"https://github.com/fredderf204/mfnode22.git\"},\"branch\":{\"value\":\"master\"}}" 