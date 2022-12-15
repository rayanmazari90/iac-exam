
param location string = resourceGroup().location


param storageAccountNames array = [
  'boumedienerayanemazarifinalexam1'
  'boumedienerayanemazarifinalexam2'
  ]
  resource storageAccountResources 'Microsoft.Storage/storageAccounts@2021-09-01' = [for storageAccountName in storageAccountNames: {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
  name: 'Standard_LRS'
  }
  }]





















