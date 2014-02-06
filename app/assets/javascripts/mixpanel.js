/*
Metrics to track:
 page loads
 of each thing
*/


//Visited Homepage
if ($('body.welcome.index').length != 0) {
   mixpanel.track("Visited landing page", {"Version": "0.8"});
}

//Visited How it Works page
$('#nav-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Navbar","Version": "0.8"});
});

$('#body-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Homepage body","Version": "0.8"});
});

//See about our product
$('#nav-ourboxes').click(function(){
  mixpanel.track("Visited Cooking Box", {"From": "Navbar","Version": "0.8"});
});

$('#nav-ourjuiceboxes').click(function(){
  mixpanel.track("Visited Juice Box", {"From": "Navbar","Version": "0.8"});
});

$('#header-cookingbox').click(function(){
  mixpanel.track("Visited Cooking Box", {"From": "Header","Version": "0.8"});
});

$('#header-juicebox').click(function(){
  mixpanel.track("Visited Juice Box", {"From": "Header","Version": "0.8"});
});

$('#body-juicebox').click(function(){
  mixpanel.track("Visited Juice Box", {"From": "Body","Version": "0.8"});
});

$('#body-cookingbox').click(function(){
  mixpanel.track("Visited Cooking Box", {"From": "Body","Version": "0.8"});
});

$('#howitworks-juicebox').click(function(){
  mixpanel.track("Visited Juice Box", {"From": "How it works","Version": "0.8"});
});

$('#howitworks-cookingbox').click(function(){
  mixpanel.track("Visited Cooking Box", {"From": "How it works","Version": "0.8"});
});



//expand to delivery

$('#cookingbox-subscribe').click(function(){
  mixpanel.track("Expanded delivery preferences", {"From": "Subscription to cooking box","Version": "0.8"});
});

$('#cookingbox-single').click(function(){
  mixpanel.track("Expanded delivery preferences", {"From": "Single cooking box","Version": "0.8"});
});

$('#box_zip').change(function(){
  mixpanel.track("Saw available times / location via zipcode", {"From": "Cooking box","Version": "0.8"});
});

$('#juicingbox-subscribe').click(function(){
  mixpanel.track("Expanded delivery preferences", {"From": "Subscription to juicing box","Version": "0.8"});
});

$('#juicingbox-single').click(function(){
  mixpanel.track("Expanded delivery preferences", {"From": "Single juicing box","Version": "0.8"});
});

$('#juicebox_zip').change(function(){
  mixpanel.track("Saw available times / location via zipcode", {"From": "Cooking box","Version": "0.8"});
});




// last step

$('.order-button').click(function(){
    mixpanel.track("Proceeded to payment", {"Version": "0.8"});
});

$('#agree').click(function(){
    mixpanel.track("Agree to terms", {"Version": "0.8"});
});

$('#terms_reveal').click(function(){
    mixpanel.track("Pay via stripe", {"Version": "0.8"});
});



