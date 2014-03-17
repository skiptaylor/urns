$(window).load ->
	Stripe.setPublishableKey 'pk_test_DPQnk4urIdLDAfKGWOq9Q3nT'
	$.ajaxSetup { async: false }
	
	$('form#payment-form').change -> summarize()
	
	summarize = () ->
		$('span#name-confirmation').html( $('input#name').val() )
		$('span#card-number-confirmation').html( $('input.card-number').val() )
		$('span#cvc-confirmation').html( $('input.card-cvc').val() )
		$('span#expiration-confirmation').html( "#{$('.card-expiry-month').val()} / #{$('.card-expiry-year').val()}" )
		$('span#email-confirmation').html( $('input#email').val() )
		$('span#address-confirmation').html( $('input#address1').val() )
		$('span#address-confirmation').append( (", #{$('input#address2').val()}") unless $('input#address2').val() == '' )
		$('span#city-confirmation').html( $('input#city').val() )
		$('span#state-confirmation').html( $('input#state').val() )
		$('span#zip-confirmation').html( $('input#zip').val() )
		
		cart_total = parseFloat( $('input#cart_total').val() )  || 0
		tax = (cart_total * 0.06).toFixed(2)
		grand_total = (cart_total * 1.06).toFixed(2)
		
		$('span#tax-confirmation').html( tax )
		$('span#total-display').html( grand_total )
		
		$('input#amount').val(grand_total)
		

	$('.submit-button').click (event) ->
	#$('#payment-form').submit (event) ->
		console.log 'submit'
		$form = $('#payment-form')
		
		window.errors = []

		if ($('input#name').val() == '')
			errors.push 'You must enter a name.'
		if ($('input.card-number').val() == '')
			errors.push 'You must enter a credit card number.'
		if ($('input.card-cvc').val() == '')
			errors.push 'You must enter a credit card validation code (CVC).'
		if ($('input#email').val() == '')
			errors.push 'You must enter a valid email address.'
		if ($('input#address1').val() == '') || ($('input#city').val() == '') || ($('input#state').val() == '') || ($('input#zip').val() == '')
			errors.push 'You must enter an address, city, state, and zip.'
			

		displayErrors(errors) if errors[0]

		unless errors[0]
			Stripe.card.createToken($form, stripeResponseHandler)

		return false

	displayErrors = (errors) ->
		$('div#errors').html('<ul></ul>')
		for error in errors
			$('div#errors ul').append "<li>#{error}</li>"

	stripeResponseHandler = (status, response) ->
		if response.error
			console.log 'error'
			errors.push response.error.message
			displayErrors(errors)
		else
			console.log 'success'
			$form = $('#payment-form')
			token = response.id
			$form.append($('<input type="hidden" name="stripeToken" />').val(token))
			$form.get(0).submit()

	summarize()

	return false