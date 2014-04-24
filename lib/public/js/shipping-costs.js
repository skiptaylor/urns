$(window).load(function() {

	$('.shipping_state, .service').on('change', function() {
		$.post('/purchase/shipping-cost', $('form').serialize(), function(cost) {
			$('label[for="shipping"]').text('Shipping: $' + cost);
			console.log('Hey! This works.');
		});
	});
	
});