$(".box-select").fadeOut();
selectForStaticInit();
tabsSelect();
selectToPrice();

//make the sliders change for custom box
$('#custom-tab').click(function(){
  staticForSelect();
});
$('#cook-tab').click(function(){
  selectForStatic();
});
$('#raw-tab').click(function(){
  selectForStatic();
});
$('.customize-button').click(function(){
  $('#custom-tab').delay(100).animate({ paddingLeft: '25px' }, 80).animate({ paddingLeft: '0px' }, 80).animate({ paddingLeft: '25px' }, 80).animate({ paddingLeft: '0px' }, 80).animate({ paddingLeft: '25px' }, 80).animate({ paddingLeft: '0px' }, 80);
});



function staticForSelect(){
  $(".static-select").hide();
  $("#customize-toggle").hide();
  $('#box_raw_num').show();
  $('#box_cook_num').show();
  $('#box_fruit_num').show();
}

function selectForStaticInit(){
  $('#box_raw_num').after('<div class="static-select" id="box_raw_num_text">1</div>').hide();
  $('#box_cook_num').after('<div class="static-select" id="box_cook_num_text">1</div>').hide();
  $('#box_fruit_num').after('<div class="static-select" id="box_fruit_num_text">1</div>').hide();
}

function selectForStatic(){
  $('#box_raw_num').hide();
  $('#box_cook_num').hide();
  $('#box_fruit_num').hide();
  $("#customize-toggle").fadeIn();
  $(".static-select").show();
}


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

function upgrade_price(){
  $('#box_raw_num_text').text(parseInt($('#box_raw_num').val()));
  $('#box_cook_num_text').text(parseInt($('#box_cook_num').val()));
  $('#box_fruit_num_text').text(parseInt($('#box_fruit_num').val()));

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

