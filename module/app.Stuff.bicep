param location string = resourceGroup().location
@allowed([
  'StorageV2'
  'BlobStorage'])
param storageAccountKind string
@allowed([
  'Hot'
  'Cool'
])
param storageAccountAccessTier string
param storageAccountSkuName string = 'Standard_LRS'




param storageAccountNames array = [
  'boumedienerayanemazarifinalexam1'
  'boumedienerayanemazarifinalexam2'
  ]
  resource storageAccountResources 'Microsoft.Storage/storageAccounts@2021-09-01' = [for storageAccountName in storageAccountNames: {
  name: storageAccountName
  location: location
  kind: storageAccountKind
  sku: {name: storageAccountSkuName}
  properties: {
    accessTier: storageAccountAccessTier
  }
  }]





















