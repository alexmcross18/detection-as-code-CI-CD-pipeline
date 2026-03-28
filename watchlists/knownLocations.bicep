param watchlistAlias string = 'knownLocations'
param csvContent string = ''

resource knownLocations 'Microsoft.SecurityInsights/watchlists@2023-09-01' = {
  name: watchlistAlias
  properties: {
    displayName: 'Known Locations'
    itemsSearchKey: 'CountryCode'
    provider: 'Microsoft'
    source: 'Local file'
    rawContent: csvContent
    contentType: 'text/csv'
  }
}
