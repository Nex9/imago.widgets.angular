class ResponsiveEvents extends Directive

  constructor: ($window) ->

    return {
      restrict: 'A'
      link: ($scope) ->

        w = angular.element $window

        onResizeStart = (e) =>
          return if @resizeing
          $scope.$broadcast 'resizestart'
          @resizeing = true
          w.one 'resizestop', => @resizeing = false

        onScrollStart = (e) =>
          # console.log 'start scrolling', @
          return if @scrolling
          $scope.$broadcast 'scrollstart'
          @scrolling = true
          w.one 'scrollstop', => @scrolling = false

        onMouseWheelStart = (e) =>
          return if @isMouseWheeling
          $scope.$broadcast 'mousewheelstart'
          @isMouseWheeling = true
          w.one 'mousewheelstop', => @isMouseWheeling = false

        w.on 'resize', onResizeStart
        w.on 'resize', _.debounce ( -> $scope.$broadcast 'resizestop' ),  200
        w.on 'resize', _.throttle ( -> $scope.$broadcast 'resizelimit' ), 150

        w.on 'scroll', onScrollStart
        w.on 'scroll', _.debounce ( -> $scope.$broadcast 'scrollstop' ),  200
        w.on 'scroll', _.throttle ( -> $scope.$broadcast 'scrolllimit' ), 150

        w.on 'mousewheel', onMouseWheelStart
        w.on 'mousewheel', _.debounce ( -> $scope.$broadcast 'mousewheelstop' ),  200
        w.on 'mousewheel', _.throttle ( -> $scope.$broadcast 'mousewheellimit' ), 150

    }