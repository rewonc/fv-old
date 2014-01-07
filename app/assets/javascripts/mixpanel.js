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
