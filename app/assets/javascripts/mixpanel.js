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
   mixpanel.track("Visited landing page");
}

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

//Customize box
$('#raw-tab').click(function(){
  mixpanel.track("Customized box", {"Type": "Switched Tab to Raw"});
});

$('#cook-tab').find('img').click(function(){
  mixpanel.track("Customized box", {"Type": "Switched tab to Variety"});
});

$('#custom-tab').click(function(){
  mixpanel.track("Customized box", {"Type": "Switched tab to Custom"});
});

$('#raw_panel_accordion').click(function(){
  mixpanel.track("Customized box", {"Type": "Accordion raw"});
});

$('#cook_panel_accordion').click(function(){
  mixpanel.track("Customized box", {"Type": "Accordion cooking"});
});

$('#fruit_panel_accordion').click(function(){
  mixpanel.track("Customized box", {"Type": "Accordion fruit"});
});

$('#box_raw_num').change(function(){
  mixpanel.track("Customized box", {"Type": "Raw select change"});
});
$('#box_cook_num').change(function(){
  mixpanel.track("Customized box", {"Type": "Cooking select change"});
});
$('#box_fruit_num').change(function(){
  mixpanel.track("Customized box", {"Type": "Fruit select change"});
});

//expand to delivery

$('.checkout-button').click(function(){
  mixpanel.track("Chose a box / expanded delivery preferences");
});







