
$('#new_order').submit(function(event) {
    var $form = $(this);
    var $ccform = $('#payment-form');
    
    $form.find('#order-submit').prop('disabled', true);
    Stripe.card.createToken($ccform, stripeResponseHandler);
    return false;
});


var stripeResponseHandler = function(status, response) {
  var $form = $('#new_order');
  var $ccform = $('#payment-form');

  if (response.error) {
    // Show the errors on the form
    $ccform.find('.payment-errors').text(response.error.message);
    $('html,body').animate({scrollTop: $('.payment-errors').offset().top});
    $form.find('#order-submit').prop('disabled', false);
  } else {
    // token contains id, last4, and card type
    var token = response.id;
    // Insert the token into the form so it gets submitted to the server
    $('input#order_stripetoken').val(token);
    
    // and submit
    //$form.get(0).submit();
  }
};