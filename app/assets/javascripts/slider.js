$(document).ready(function() {
	$('input.slider').slider({
		formater: function(value) {
			return '重視する度合: ' + value;
		}
	});
});
