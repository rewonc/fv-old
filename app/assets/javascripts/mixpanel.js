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
$('body.welcome.index').ready(function(){
  mixpanel.track("Visited landing page");
});

//Visited How it Works page
$('#nav-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Navbar"});
});

$('#header-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Header"});
});

$('#tribar-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "Tribar"});
});

$('#about-howitworks').click(function(){
  mixpanel.track("Viewed How it Works", {"From": "About Us page"});
});

//See about our product
$('#nav-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Navbar"});
});

$('#header-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Header"});
});

$('#tribar-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Tribar"});
});

$('#about-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "About Us Page"});
});

$('#farms-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Farms Page"});
});

$('#features-ourboxes').click(function(){
  mixpanel.track("Viewed Box Selection", {"From": "Features Page"});
});