'use strict';

angular.module('app.controllers', [])

# overall control
.controller('AppCtrl', [
    '$scope', '$location'
    ($scope, $location) ->
        $scope.isSpecificPage = ->
            path = $location.path()
            return _.contains( [
                '/404'
                '/pages/500'
                '/pages/login'
                '/pages/signin'
                '/pages/signin1'
                '/pages/signin2'
                '/pages/signup'
                '/pages/signup1'
                '/pages/signup2'
                '/pages/forgot'
                '/pages/lock-screen'
            ], path )

        $scope.main =
            brand: 'Ballnana'
            name: 'Bin Wu' # those which uses i18n can not be replaced for now.

])

.controller('NavCtrl', [
    '$scope', 'taskStorage', 'filterFilter'
    ($scope, taskStorage, filterFilter) ->
        # init
        tasks = $scope.tasks = taskStorage.get()
        $scope.taskRemainingCount = filterFilter(tasks, {completed: false}).length

        $scope.$on('taskRemaining:changed', (event, count) ->
            $scope.taskRemainingCount = count
        )
])

.controller('DashboardCtrl', [
    '$scope', '$http'
    ($scope, $http) ->
        $http.get('/api/getCourts').success(
            (courts) ->
                $scope.court=courts
            )

        $scope.map = 
            center:
              latitude: 32
              longitude: -96

            options:
              panControl: false
              streetViewControl: false

            markers:[
                id: 1
                icon: '/images/hoop.jpg'
                latitude: 32
                longitude: -96
                showWindow: false
                title: 'haha'
            ,
                id: 2
                icon: '/images/hoop.jpg'
                latitude: 32
                longitude: -96.055
                showWindow: false
                title: 'haha2'
            ]

            zoom: 12

            doClusterMarkers: true

            events:
                tilesloaded: 
                    (map) ->
                        $scope.$apply(() ->
                            $scope.mapInstance = map)

        $scope.markersEvents =
            click: (gMarker, eventName, model) ->
                $scope.court = model
                $scope.mapInstance.panTo(gMarker.getPosition())
        
        return

])
