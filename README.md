##Rails4 + AngularJS 1.5

 This is just a fork of [kirandc's very good example](https://github.com/kirandc/rails4_crud_with_angularjs) of putting together Rails 4 an AngularJS. I've forked it to match the example to my needs:

 1. haml templates
 * coffescript
 * mixed client and server side validation
 * use of Rails' I18N inside AngularJS
 * use Rails simple form views and AngularJS views in one app
 * use reusable Angular directives for input fields

Not all of theese targets have been achived yet. By now we're working at item 5.

The app contains an _Account_ model with server-side generated standard Rails Simple Form UI. There is also a _User_ model with a client-side AngularJS UI. Setting up your application this way enables you to use easy to build Simple Form UI for most of your views and AngularJS UI for dynamic views you would otherwise use JQuery for.


##License
This is released under the MIT license.
