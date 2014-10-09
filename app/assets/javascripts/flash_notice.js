$(document).on("page:change", function() {
	
		var $flash_notice_content = $('p.flash').html().trim().length;
		if ($flash_notice_content == 0) {
			$('p.flash').hide();
		}
	
});