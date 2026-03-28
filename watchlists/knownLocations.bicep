param watchlistAlias string = 'knownLocations'
param workspaceName string

resource workspace 'Microsoft.OperationalInsights/workspaces@2022-10-01' existing = {
  name: workspaceName
}

resource knownLocations 'Microsoft.SecurityInsights/watchlists@2023-09-01-preview' = {
  name: watchlistAlias
  scope: workspace
  properties: {
    displayName: 'Known Locations'
    itemsSearchKey: 'CountryCode'
    provider: 'Microsoft'
    source: 'known_signin_locations.csv'
    rawContent: loadTextContent('known_signin_locations.csv')
    contentType: 'text/csv'
  }
}
