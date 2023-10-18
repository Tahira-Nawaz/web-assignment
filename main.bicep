targetScope = 'subscription'
param resourcegroup string = 'tahira'
param env string = 'info'
param tag string 
param name string
param location string = 'eastus2'
param sku string
param skucode string
param repositoryUrl string
param branch string
@secure()
param repositoryToken string
param appLocation string
param apiLocation string
param appArtifactLocation string
param resourceTags object
param appSettings object
resource rg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  name: resourcegroup
  location: location
  tags: {
    Environment: env
    Department: tag
  }
}

module webapp 'web.bicep' = {
  name: 'storageaccount_Deployment'
  scope: rg
  params: {
    location: location
    sku: sku
    appSettings : appSettings 
    resourceTags: resourceTags
    name:name
    skucode: skucode
    repositoryUrl: repositoryUrl
    branch: branch
    repositoryToken: repositoryToken
    appLocation: appLocation
    apiLocation: apiLocation
    appArtifactLocation: appArtifactLocation
    
  }
}
