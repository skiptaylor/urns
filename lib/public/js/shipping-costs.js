$(window).load(function() {

	$('.shipping_state, .service').on('change', function() {
		$.post('/purchase/shipping-cost', $('form').serialize(), function(cost) {
			$('label[id="shipping"]').text('Shipping: $' + cost);
		});
	});

});



