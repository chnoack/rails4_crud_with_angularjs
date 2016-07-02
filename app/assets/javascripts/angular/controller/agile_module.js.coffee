agileApp = angular.module('agile_module', [ 'ngRoute', 'ngResource', 'templates' ])

agileApp.directive 'serverError', ->
  {
    # remove error message from input field, if value changes
    restrict: 'AE'
    require: 'ngModel'
    scope: model: '=ngModel'
    link: (scope, elem, attrs, ngModel) ->
      scope.$watch 'model', (v) ->
        ngModel.$setValidity('server', true)
  }
