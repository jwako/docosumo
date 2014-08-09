$(document).ready(function() {
	$('input.slider').slider({
		formater: function(value) {
			return '重視する度合: ' + value;
		}
	});
	$("#ex1").on('slide', function(slideEvt) {
		$("#ex1_hidden").val(slideEvt.value);
	});
	$("#ex2").on('slide', function(slideEvt) {
		$("#ex2_hidden").val(slideEvt.value);
	});
	$("#ex3").on('slide', function(slideEvt) {
		$("#ex3_hidden").val(slideEvt.value);
	});
	$("#ex4").on('slide', function(slideEvt) {
		$("#ex4_hidden").val(slideEvt.value);
	});
	$("#ex5").on('slide', function(slideEvt) {
		$("#ex5_hidden").val(slideEvt.value);
	});
	$("#ex6").on('slide', function(slideEvt) {
		$("#ex6_hidden").val(slideEvt.value);
	});
});
