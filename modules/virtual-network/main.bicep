@description('The location for all resources.')
param location string = resourceGroup().location

var virtualNetworkName = 'vnet${uniqueString(resourceGroup().id)}'
var virtualNetworkAddressPrefix = '10.0.0.0/16'
var virtualNetworkSubnetAddressPrefix = '10.0.0.0/24'

resource virtualNetwork 'Microsoft.Network/virtualNetworks@2021-02-01' = {
  name: virtualNetworkName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        virtualNetworkAddressPrefix
      ]
    }
    subnets: [
      {
        name: 'default'
        properties: {
          addressPrefix: virtualNetworkSubnetAddressPrefix
        }
      }
    ]
  }
}
