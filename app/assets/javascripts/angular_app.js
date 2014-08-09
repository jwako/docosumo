var docosumoApp = angular.module('docosumoApp', [
	'docosumoControllers'
]);

// For X-CSRF-TOKEN
docosumoApp.config(
	["$httpProvider", function($httpProvider) {
      $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
	  }
	]
);
