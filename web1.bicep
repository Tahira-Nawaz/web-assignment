
param name string
param location string 
param sku string = 'Free'
param skucode string = 'Free'
// param repositoryUrl string
// param branch string
// @secure()
// param repositoryToken string
param appLocation string = '/'
param apiLocation string = ''
param appArtifactLocation string = 'Src'



resource app 'Microsoft.Web/staticSites@2021-01-15' = {
  name: name
  location: location
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
  properties: {
        MY_APP_SETTING1: 'value 1'
        MY_APP_SETTING2: 'value 2'
    }
}

