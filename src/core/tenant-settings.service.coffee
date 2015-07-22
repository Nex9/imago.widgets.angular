class TenantSettings extends Service

  data: {}

  constructor: (@$http, @$rootScope, @imagoSettings) ->
    @get()

  get: ->
    @$http.get("#{@imagoSettings.host}/api/settings").then (response) =>
      @reorder response.data

  reorder: (data) ->
    @data = {}

    for item in data
      @data[item.name] = item.value

    tmp = {}
    for item in @data.settings
      tmp[item.name] = item.value
    @data.settings = tmp

    @$rootScope.tenantSettings = @data
    @$rootScope.$emit 'settings:loaded', @data