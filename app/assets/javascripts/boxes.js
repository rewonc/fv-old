$(".no-js-desc").hide();
sliders("#box_raw_num");
sliders("#box_cook_num");
sliders("#box_fruit_num");
tabsSelect();

function tabsSelect(){
  $('.tabs').find('dd').click(function(){
    var selection = $(this).data('selection');
    $('#box_box_num_' + selection).prop("checked",true);
    switch(selection)
    {
      case 1:
        setModules(2,0,1);
        break;
      case 2:
        setModules(1,1,1);
        break;
      case 3:
        break;
    }
  });
}

function setModules(raw,cook,fruit){
  $('#box_raw_num').val(raw).selectToSlider();
  $('#box_cook_num').val(cook).selectToSlider();
  $('#box_fruit_num').val(fruit).selectToSlider();
  upgrade_price();
}

function sliders(selector) {
    var select = $( selector )//.hide();
    var slider = $( "<div class='slider'></div>" ).insertAfter( select ).slider({
      min: 0,
      max: 3,
      value: select[ 0 ].selectedIndex,
      slide: function( event, ui ) {
        select[ 0 ].selectedIndex = ui.value;
        upgrade_text(select, ui.value);
        upgrade_price();
      }
    });

    $( select ).change(function() {
      $(this).selectToSlider(); 
      upgrade_price();
    });
}

jQuery.fn.selectToSlider = function(){
  $(this).next(".slider").slider("value", this[0].selectedIndex);
  upgrade_text(this, this[0].selectedIndex);
};

function upgrade_price(){
  var subtotal = (parseInt($('#box_raw_num').val()) + parseInt($('#box_cook_num').val()) + parseInt($('#box_fruit_num').val()))*8
  $("#price_sum").text(subtotal.toString());
  if (subtotal<=8) {
    $('#price_delivery').text("Minimum order of $10 - please increase order")
  } else if (subtotal < 40) {
    $('#price_delivery').text("Plus $4 for delivery (over $40 delivery is free)")
  } else {
    $('#price_delivery').text("Free delivery!")
  }
}
function upgrade_text(select, value){
  module = $(select).closest('li').data('module');
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
