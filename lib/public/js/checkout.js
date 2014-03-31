$(window).load(function() {
  var displayErrors, stripeResponseHandler, summarize;
  Stripe.setPublishableKey('pk_test_DPQnk4urIdLDAfKGWOq9Q3nT');
  $.ajaxSetup({
    async: false
  });
  $('form#payment-form').change(function() {
    return summarize();
  });
  summarize = function() {
    var cart_total, grand_total, tax;
    $('span#name-confirmation').html($('input#name').val());
    $('span#card-number-confirmation').html($('input.card-number').val());
    $('span#cvc-confirmation').html($('input.card-cvc').val());
    $('span#expiration-confirmation').html("" + ($('.card-expiry-month').val()) + " / " + ($('.card-expiry-year').val()));
    $('span#email-confirmation').html($('input#email').val());
    $('span#address-confirmation').html($('input#address1').val());
    $('span#address-confirmation').append($('input#address2').val() !== '' ? ", " + ($('input#address2').val()) : void 0);
    $('span#city-confirmation').html($('input#city').val());
    $('span#state-confirmation').html($('input#state').val());
    $('span#zip-confirmation').html($('input#zip').val());
    cart_total = parseFloat($('input#cart_total').val()) || 0;
    tax = (cart_total * 0.06).toFixed(2);
    grand_total = (cart_total * 1.06).toFixed(2);
    $('span#tax-confirmation').html(tax);
    $('span#total-display').html(grand_total);
    return $('input#amount').val(grand_total);
  };
  $('.submit-button').click(function(event) {
    var $form;
    console.log('submit');
    $form = $('#payment-form');
    window.errors = [];
    if ($('input#name').val() === '') {
      errors.push('You must enter a name.');
    }
    if ($('input.card-number').val() === '') {
      errors.push('You must enter a credit card number.');
    }
    if ($('input.card-cvc').val() === '') {
      errors.push('You must enter a credit card validation code (CVC).');
    }
    if ($('input#email').val() === '') {
      errors.push('You must enter a valid email address.');
    }
    if (($('input#address1').val() === '') || ($('input#city').val() === '') || ($('input#state').val() === '') || ($('input#zip').val() === '')) {
      errors.push('You must enter an address, city, state, and zip.');
    }
    if (errors[0]) {
      displayErrors(errors);
    }
    if (!errors[0]) {
      Stripe.card.createToken($form, stripeResponseHandler);
    }
    return false;
  });
  displayErrors = function(errors) {
    var error, _i, _len, _results;
    $('div#errors').html('<ul></ul>');
    _results = [];
    for (_i = 0, _len = errors.length; _i < _len; _i++) {
      error = errors[_i];
      _results.push($('div#errors ul').append("<li>" + error + "</li>"));
    }
    return _results;
  };
  stripeResponseHandler = function(status, response) {
    var $form, token;
    if (response.error) {
      console.log('error');
      errors.push(response.error.message);
      return displayErrors(errors);
    } else {
      console.log('success');
      $form = $('#payment-form');
      token = response.id;
      $form.append($('<input type="hidden" name="stripeToken" />').val(token));
      return $form.get(0).submit();
    }
  };
  summarize();
  return false;
});
