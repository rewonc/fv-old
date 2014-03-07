//= require dependencies
//= require foundation
//= require_self
//= require boxes
//= require orders
//= require charges
//= require juiceboxes
//= require mixpanel
//= require number-polyfill
//= require modernizr

$(function(){ 
  Foundation.libs.abide.settings.patterns.password = /^[a-zA-Z0-9\s\D]{8,}$/;
  $(document).foundation(); 
});
