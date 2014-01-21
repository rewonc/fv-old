/*
Metrics to track:

Learn more (position: navbar, header, three, body, )

See our product
  See box (position: aboutus?, )
  From our Farms?, etc 

Research / Customize
Switch items
Switch tabs?
Accordion it

Choose delivery preferences and areas

Pay -- checkout


Do we have viewcount for tumblr, etc?

*/


//Visited Homepage
if ($('body.welcome.index').length != 0) {
   mixpanel.track("Visited landing page", {"Version": "0.7"});
}

//Visited How it Works page
$('#nav-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Navbar","Version": "0.7"});
});

$('#header-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Header","Version": "0.7"});
});

$('#tribar-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Tribar","Version": "0.7"});
});

$('#about-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "About Us page","Version": "0.7"});
});

//See about our product
$('#nav-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Navbar","Version": "0.7"});
});

$('#header-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Header","Version": "0.7"});
});

$('#tribar-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Tribar","Version": "0.7"});
});

$('#about-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "About Us Page","Version": "0.7"});
});

$('#farms-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Farms Page","Version": "0.7"});
});

$('#features-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Features Page","Version": "0.7"});
});

//Customize box
$(".customize-button").click(function(){
  mixpanel.track("Chose customization", {"Version": "0.7"});
});

//expand to delivery

$('.checkout-button').click(function(){
  mixpanel.track("Chose a box / expanded delivery preferences", {"Version": "0.7"});
});







