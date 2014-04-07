$('#order_box_count').change(function(event){
  $('p#boxcountstring').text($(this).find(":selected").text());
  $('p#boxcountstring').addClass('updated');
  setTimeout( function(){
      $('p#boxcountstring').removeClass('updated');
    },1000);
  priceRefresh();
});

$('#order_frequency').change(function(event){
  $('p#frequencystring').text($(this).find(":selected").text());
  $('p#frequencystring').addClass('updated');
  setTimeout( function(){
      $('p#frequencystring').removeClass('updated');
    },1000);
});

$('#order_delivery_window').change(function(event){
  var day = $(this).val();
  $('p.first_delivery_date.active').removeClass('active');
  $('p.first_delivery_date[data-week="' + day.toString() + '"]').addClass('active').addClass('updated');
  setTimeout( function(){
      $('p.first_delivery_date.active.updated').removeClass('updated');
    },1000);
  dateRefresh();
});

$('a.dater').click(function(){
  var selected = $('p.first_delivery_date.active').children("span.selected_date")
  selected.text($(this).text());
  selected.data('date',$(this).data('date'));
  dateRefresh();
});

function priceRefresh(){
      var price = $('#order_box_count').data('price') * $('#order_box_count').val();  //( price /100).toString();
      var shipping = $('#order_box_count').data('shipping') * $('#order_box_count').val();  
      var total = price + shipping;
      $('#subtotalprice').text('$' + (price/100).toString());
      $('#shippingprice').text('$' + (shipping/100).toString());
      $('#totalprice').text('$' + (total/100).toString());
      $('#totalprice').addClass('updated');
      setTimeout( function(){
          $('#totalprice').removeClass('updated');
        },1000);

}

function dateRefresh(){
  $('#order_first_delivery').val( $('p.first_delivery_date.active').children('span.selected_date').data('date') );
  //alert($('#order_first_delivery').val());
}

/*$("form#ajax_signup").submit(function(e){
    alert($('form#ajax_signup').data('registered'));
     var form = $(this);
     e.preventDefault(); //This prevents the form from submitting normally
     var user_info = {};
     user_info['user[email]'] = $('#user_email').val();
     user_info['user[password]'] = $('#user_password').val();
     console.log("About to post to /users: " + JSON.stringify(user_info));
     $.ajax({
       type: "POST",
       url: form.attr('ajax_path'),
       data: user_info,
       success: function(json){
         //var id = json['id'];
         //$('input#order_user_id').val(id);
         console.log("The Devise Response: " + JSON.stringify(json));
         //alert("The Devise Response: " + JSON.stringify(json));
       }, error: function(json) { 
         //if there's an error for same email, try logging in
        $.each(json['responseJSON']['errors'], function(key, value){
          form.find('.registration-errors').append(key + ' ' + value + "<br />");
        });

        $('html,body').animate({scrollTop: $('.registration-errors').offset().top});
        console.log("The Devise Error: " + JSON.stringify(json));
       }, 
       dataType: "json"
     });
  });

$('#new_order').submit(function(event) {
    var $form = $(this);
    event.preventDefault();
    //disable double click submissions
    $form.find('#order-submit').prop('disabled', true);
    //check user registration
    submitUser();
    return false;
});


function submitUser(){
  var $form = $('#new_order');
  var $userform = $('form#ajax_signup');
  if ($userform.data('registered') === true) {
    submitStripe();
    console.log("Already registered - moving on to stripe");
  } else{
    var user_info = {};
     user_info['user[email]'] = $('#user_email').val();
     user_info['user[password]'] = $('#user_password').val();
     console.log("About to post to /users: " + JSON.stringify(user_info));
     $.ajax({
       type: "POST",
       url: $userform.attr('ajax_path'),
       data: user_info,
       success: function(json){
         console.log("The Devise Response: " + JSON.stringify(json));
         //mark true so it doesn't submit for future form requests
         $('form#ajax_signup').data('registered') = true;
         submitStripe();
       }, error: function(json) { 
        //todo -- RC
        //if there's an error for same email, try logging in
        $.each(json['responseJSON']['errors'], function(key, value){
          $userform.find('.registration-errors').append(key + ' ' + value + "<br />");
        });
        $('html,body').animate({scrollTop: $('.registration-errors').offset().top});
        $form.find('#order-submit').prop('disabled', false);
        console.log("The Devise Error: " + JSON.stringify(json));

       }, 
       dataType: "json"
     });
  }
  
}

function submitStripe(){
  var $ccform = $('#payment-form');
  Stripe.card.createToken($ccform, stripeResponseHandler);
}

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
    alert('submit');
    //$form.get(0).submit();
  }
};

*/
