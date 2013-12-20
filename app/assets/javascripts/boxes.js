$(".box-select").fadeOut();
//sliders("#box_raw_num");
//sliders("#box_cook_num");
//sliders("#box_fruit_num");
tabsSelect();
selectToPrice();

function selectToPrice(){
  $('#box_raw_num').change(function(){
    upgrade_price();
  });
  $('#box_cook_num').change(function(){
    upgrade_price();
  });
  $('#box_fruit_num').change(function(){
    upgrade_price();
  });
}
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
  $('#box_raw_num').val(raw)
  $('#box_cook_num').val(cook)
  $('#box_fruit_num').val(fruit)
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
  var subtotal = (parseInt($('#box_raw_num').val()) + parseInt($('#box_cook_num').val()) + parseInt($('#box_fruit_num').val()))*8;
  var shipping;
  $("#price_sum").text(subtotal.toString());
  if (subtotal<=8) {
    $('#sample-box-title').text("Minimum order of $10 - please increase order");
    $('#price_total').text((subtotal+shipping).toString());
  } else if (subtotal < 40) {
    $('#sample-box-title').text("A sample box");
    shipping = 4
    $('#price_delivery').text("4");
    $('#price_total').text((subtotal+shipping).toString());
  } else {
    $('#sample-box-title').text("A sample box");
    $('#price_delivery').text("0");
    shipping = 0
    $('#price_total').text((subtotal+shipping).toString());
  }
}

