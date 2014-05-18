(function() {

	$(window).load(function() {
			$('a.delete').click(function() {
			if (!confirm('This cannot be undone! Continue?')) {
			return false;
			}
		});

		$('img.thumbs').click(function() {
			$('img.full-size').attr('src', $(this).attr('src'));
	
			$('img.full-size').elevateZoom({
				zoomType: "inner",
				cursor: "crosshair",
				zoomWindowFadeIn: 600,
				zoomWindowFadeOut: 750,
				easing: true
			});
		});
		
	});
	
	$(document).ready(function(){
		setTimeout(function(){
			$("div#alert").fadeOut("slow", function () {
			$("div#alert").remove();
	      });
		}, 5000);
	});

}).call(this);

