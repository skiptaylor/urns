$(window).load(function() {
	$('#billing_state, #shipping_state, #service').on('change', function() {
		$.post('/purchase/shipping-cost', $('form').serialize(), function(cost) {
			$('label#shipping-cost').text('Shipping: $' + cost);
		});
  });
});