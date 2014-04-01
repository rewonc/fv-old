$('.checkboxes').find('input').change(function(){
  
  var count = $('.checkboxes').find('input:checked');
  var string = count.map(function(){
    return $(this).next("label").text().split(' ').join('%20');
  }).get();
  
  $('#order_delivery_window').val(string);
  
  switch(count.length){
    case 4:
      $('#order_box_count').val(1);
      $('p#boxcountstring').text($('#order_box_count').find(":selected").text());
      priceRefresh();
      $('p#boxcountstring').addClass('updated');
        setTimeout( function(){
            $('p#boxcountstring').removeClass('updated');
          },1000);
    break;
    case 3:
      $('#order_box_count').val(4);
      $('p#boxcountstring').text($('#order_box_count').find(":selected").text());
      priceRefresh();
      $('p#boxcountstring').addClass('updated');
        setTimeout( function(){
            $('p#boxcountstring').removeClass('updated');
          },1000);
    break;
    case 2:
      $('#order_box_count').val(3);
      $('p#boxcountstring').text($('#order_box_count').find(":selected").text());
      priceRefresh();
      $('p#boxcountstring').addClass('updated');
        setTimeout( function(){
            $('p#boxcountstring').removeClass('updated');
          },1000);
    break;
    case 1:
      $('#order_box_count').val(2);
      $('p#boxcountstring').text($('#order_box_count').find(":selected").text());
      priceRefresh();
      $('p#boxcountstring').addClass('updated');
        setTimeout( function(){
            $('p#boxcountstring').removeClass('updated');
          },1000);
    break;
    case 0:
      alert('Please select at least one week');
  }
  //insert string here into a field to know the specific weeks ppl choose
});
$('#checkbox-click').click(function(){
  $('.checkboxes').find('input').attr('disabled',false);
});

$('#order_box_count').change(function(event){
  $('p#boxcountstring').text($(this).find(":selected").text());
  $('p#boxcountstring').addClass('updated');
  setTimeout( function(){
      $('p#boxcountstring').removeClass('updated');
    },1000);
  priceRefresh();
});

$('#order_first_delivery').change(function(event){
  $('p#firstdeliverystring').text($(this).find(":selected").text());
  $('p#firstdeliverystring').addClass('updated');
  setTimeout( function(){
      $('p#firstdeliverystring').removeClass('updated');
    },1000);
});

function priceRefresh(){
  switch($('#order_box_count').data('id')){
    case 7:
      price = ($('#order_box_count').data('price')/100).toString();
      $('#totalprice').text('$' + price);
      $('#subtotalprice').text('$' + price);
      $('#totalprice').addClass('updated');
      setTimeout( function(){
          $('#totalprice').removeClass('updated');
        },1000);
      break;
    default:
      price = (($('#order_box_count').data('price') * $('#order_box_count').val())/100).toString();
      $('#totalprice').text('$' + price);
      $('#subtotalprice').text('$' + price);
      $('#totalprice').addClass('updated');
      setTimeout( function(){
          $('#totalprice').removeClass('updated');
        },1000);

  }
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
