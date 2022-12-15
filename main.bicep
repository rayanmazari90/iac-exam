@sys.description('The Web App name.')
@minLength(3)
@maxLength(30)
param appServiceAppName string = 'RAYANEBOUMEDIENEMAZARI-finalexam'
@sys.description('The App Service Plan name.')
@minLength(3)
@maxLength(24)
param appServicePlanName string = 'RAYANEBOUMEDIENEMAZARI-finalexam'
@sys.description('The environment type.')
param location string = resourceGroup().location
var storageAccountSkuName = 'Standard_LRS'  
var appServicePlanSkuName = 'B1'

@allowed([
  'StorageV2'
  'BlobStorage'])
param storageAccountKind string
@allowed([
  'Hot'
  'Cool'
])
param storageAccountAccessTier string

resource appServicePlan 'Microsoft.Web/serverFarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}
resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
  serverFarmId: appServicePlan.id
  httpsOnly: true
  }
}

module storageAccounts 'module/app.Stuff.bicep' = {
  name: 'storageAccounts'
  params: { 
    location: location    
    storageAccountSkuName: storageAccountSkuName
    storageAccountAccessTier: storageAccountAccessTier
    storageAccountKind: storageAccountKind
  }
}
