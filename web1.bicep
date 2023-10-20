
param name string
param location string = 'eastus2'
param sku string
param skucode string
// param repositoryUrl string
// param branch string
// @secure()
// param repositoryToken string
param appLocation string
param apiLocation string
param appArtifactLocation string
param resourceTags object
param appSettings object
param azure_static_web_apps_api_token string = 'c938ab775887dc8d9e54ad762369b8111cb4182d02bb273ec15853cd78d42c8e4-83570ffd-7731-4aeb-9180-c72ab17f3953010254505'
resource app 'Microsoft.Web/staticSites@2021-01-15' = {
  name: name
  location: location
  tags: resourceTags
  properties: {
    // repositoryUrl: repositoryUrl
    // branch: branch
    // repositoryToken: repositoryToken
    buildProperties: {
      appLocation: appLocation
      apiLocation: apiLocation
      appArtifactLocation: appArtifactLocation
    }
  }
  sku: {
    tier: sku
    name: skucode
  }
}
resource name_appsettings 'Microsoft.Web/staticSites/config@2021-01-15' = {
  parent: app
  name: 'appsettings'
  properties: appSettings
}


