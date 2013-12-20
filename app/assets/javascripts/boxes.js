//hide form elements replace w/ js
$(".box-select").hide();
$("fieldset").hide();
selectForStaticInit();
tabsSelect();
selectToPrice();

//make the select items change for custom box
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
  $('#custom-tab').find(".fa").fadeIn(500).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).delay(300).fadeOut();
});

//accordion functions. on change it should also make active so it expands the tab.

//checkout-button will hide select and unhide the delivery fieldset
$(".checkout-button").click(function(){
  $('.select').hide();
  $('fieldset').fadeIn();
});


function updateModuleDescriptions(){
  var raw = parseInt($('#box_raw_num').val());
  var cook = parseInt($('#box_cook_num').val());
  var fruit = parseInt($('#box_fruit_num').val());
  $('.raw_panel_subs').hide();
  $('.cook_panel_subs').hide();
  $('.fruit_panel_subs').hide();
  $('#raw_sub_' + raw).fadeIn();
  $('#cook_sub_' + cook).fadeIn();
  $('#fruit_sub_' + fruit).fadeIn();
  //call this fxn on change, # make active
  //also on module move
}

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
        $('#sample-box-title').text('A sample Raw Box');
        break;
      case 2:
        setModules(1,1,1);
        $('#sample-box-title').text('A sample Variety Box');
        break;
      case 3:
        $('#sample-box-title').text('A sample Custom Box');
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
  updateModuleDescriptions();
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
    $('#sample-box-title').text("A sample Custom Box");
    shipping = 4
    $('#price_delivery').text("4");
    $('#price_total').text((subtotal+shipping).toString());
  } else {
    $('#price_delivery').text("0");
    shipping = 0
    $('#price_total').text((subtotal+shipping).toString());
  }
}

