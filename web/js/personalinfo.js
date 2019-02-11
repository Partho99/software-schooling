$(function() {
    $('#profilelink').click(function(e) {
		$("#profile").delay(100).fadeIn(100);
 		$("#edit-form").fadeOut(100);
		$('#editlink').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
	$('#editlink').click(function(e) {
		$("#edit-form").delay(100).fadeIn(100);
 		$("#profile").fadeOut(100);
		$('#prfilelink').removeClass('active');
		$(this).addClass('active');
		e.preventDefault();
	});
});



