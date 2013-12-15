$( "#confirm_button" ).click(function() {
  $( "#confirm_box" ).hide();
  $("#payment_box").fadeIn();
});

$(".no-js-desc").hide();
sliders("#box_raw_num",1);
sliders("#box_cook_num",2);
sliders("#box_fruit_num",3);

function sliders(selector, module) {
    var select = $( selector ).hide();
    var slider = $( "<div class='slider'></div>" ).insertAfter( select ).slider({
      min: 0,
      max: 3,
      value: select[ 0 ].selectedIndex,
      slide: function( event, ui ) {
        select[ 0 ].selectedIndex = ui.value;
        upgrade_text(module,ui.value);
      }
    });

    $( "#box_raw_num" ).change(function() {
      slider.slider( "value", this.selectedIndex);
      upgrade_text(module,this.selectedIndex);
    });
}

function upgrade_text(module, value){
  switch(module)
    {
    case 1:
      $('#raw_ind').html('change block 1 to ' + value);
      break;
    case 2:
      $('#cook_ind').html('change block 2 to ' + value);
      break;
    case 3:
      $('#fruit_ind').html('change block 3 to ' + value);
      break;
    }
}
