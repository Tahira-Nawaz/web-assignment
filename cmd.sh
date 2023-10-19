LOCATION='eastus2'
RESOURCEGROUPNAME='tahira-1rg'
az group create --name $RESOURCEGROUPNAME --location $LOCATION
az deployment group create --resource-group $RESOURCEGROUPNAME --template-file main.bicep 
# az deployment sub create --name Microsoft-Partner-Network --location eastus --template-file ./main.bicep --parameters ./main.parameters.json