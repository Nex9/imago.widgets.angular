class imagoShare extends Directive

  constructor: () ->

    return {

      scope:
        asset: "="
      controller: 'imagoShareController as imagoshare'
      bindToController: true
      templateUrl: (element, attrs) ->
        return attrs.templateUrl or '/imago/imago-share.html'

    }

class imagoShareController extends Controller

  constructor: (@$scope, @$attrs, @$location) ->

    @init()

    watcher = @$scope.$watch 'imagoshare.asset', (value) =>
      return unless value
      watcher()
      @init()

  init: ->
    if @asset?.path
      @location = "#{@$location.protocol()}://#{@$location.host()}#{@asset.path}"
    else
      @location = @$location.absUrl()

    @location = encodeURIComponent(@location)

    return console.log 'You need to specify one service at least.' unless @$attrs.imagoShare

    options = @$scope.$eval @$attrs.imagoShare

    if _.isArray options
      for item in options
        @$scope[item] = true
    else if @$attrs.imagoShare is 'all'
      @$scope.all = true
