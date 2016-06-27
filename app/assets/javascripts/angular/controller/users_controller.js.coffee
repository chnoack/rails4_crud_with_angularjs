myApp = angular.module('myapplication', [
  'ngRoute'
  'ngResource'
  'templates'
])
#Factory
myApp.factory 'Users', [
  '$resource'
  ($resource) ->
    $resource '/users.json', {},
      query:
        method: 'GET'
        isArray: true
      create: method: 'POST'
]
myApp.factory 'User', [
  '$resource'
  ($resource) ->
    $resource '/users/:id.json', {},
      show: method: 'GET'
      update:
        method: 'PUT'
        params: id: '@id'
      delete:
        method: 'DELETE'
        params: id: '@id'
]

#Controller
myApp.controller 'UserListCtr', [
  '$scope'
  '$http'
  '$resource'
  'Users'
  'User'
  '$location'
  ($scope, $http, $resource, Users, User, $location) ->
    $scope.users = Users.query()

    $scope.deleteUser = (userId) ->
      if confirm('Are you sure you want to delete this user?')
        User.delete { id: userId }, ->
          $scope.users = Users.query()
          $location.path '/'
          return
      return

    return
]
myApp.controller 'UserUpdateCtr', [
  '$scope'
  '$resource'
  'User'
  '$location'
  '$routeParams'
  ($scope, $resource, User, $location, $routeParams) ->
    $scope.user = User.get(id: $routeParams.id)

    $scope.update = ->
      if $scope.userForm.$valid
        User.update { id: $scope.user.id }, { user: $scope.user }, ((r) ->
          console.log r.status
          if (r.status == 'unprocessable_entity')
            $location.path '/users/new'
          else
            $location.path '/'
          return
        ), (error) ->
          console.log error
          return
      return

    $scope.addAddress = ->
      $scope.user.addresses.push
        street1: ''
        street2: ''
        city: ''
        state: ''
        country: ''
        zipcode: ''
      return

    $scope.removeAddress = (index, user) ->
      address = user.addresses[index]
      if address.id
        address._destroy = true
      else
        user.addresses.splice index, 1
      return

    return
]
myApp.controller 'UserAddCtr', [
  '$scope'
  '$resource'
  'Users'
  '$location'
  ($scope, $resource, Users, $location) ->
    $scope.user = addresses: [ {
      street1: ''
      street2: ''
      city: ''
      state: ''
      country: ''
      zipcode: ''
    } ]

    $scope.save = ->
      if $scope.userForm.$valid
        Users.create { user: $scope.user }, ((r) ->
          console.log r.status
          if (r.status == 'unprocessable_entity')
            console.log 'Fehler'
            $location.path '/users/new'
          else
            $location.path '/'
          return
        ), (error) ->
          console.log 'FEHLER'
          console.log error
          return
      return

    $scope.addAddress = ->
      $scope.user.addresses.push
        street1: ''
        street2: ''
        city: ''
        state: ''
        country: ''
        zipcode: ''
      return

    $scope.removeAddress = (index, user) ->
      address = user.addresses[index]
      if address.id
        address._destroy = true
      else
        user.addresses.splice index, 1
      return

    return
]

#Routes
myApp.config [
  '$routeProvider'
  '$locationProvider'
  ($routeProvider, $locationProvider) ->
    $routeProvider.when '/users',
      templateUrl: 'users/index.html'
      controller: 'UserListCtr'
    $routeProvider.when '/users/new',
      templateUrl: 'users/new.html'
      controller: 'UserAddCtr'
    $routeProvider.when '/users/:id/edit',
      templateUrl: 'users/edit.html'
      controller: 'UserUpdateCtr'
    $routeProvider.otherwise redirectTo: '/users'
    return
]
