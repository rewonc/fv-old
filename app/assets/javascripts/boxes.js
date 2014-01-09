//checkout page
$('#terms_reveal').hide();
$('#terms_button').show();
$('#agree').click(function(){
  $('#terms_button').hide();
  $('#terms_reveal').fadeIn(50);
  $('#agree').attr("disabled", true);
});


//hide form elements replace w/ js
$(".box-select").hide();
$("#delivery_preferences").hide();
selectForStatic();
tabsSelect();
selectToPrice();

//accordionSelect FFox fix


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
  $('html, body').animate({
        scrollTop: $("#dino-tabs").offset().top
    }, 1000);
  $('#custom-tab').find(".fa").fadeIn(500).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).animate({ paddingTop: '10px' }, 100).animate({ paddingTop: '0px' }, 100).delay(300).fadeOut();
});

//accordion functions. on change it should also make active so it expands the tab.

//checkout-button will hide select and unhide the delivery fieldset
$(".checkout-button").click(function(){
  //$('.select').hide();
  $('#delivery_preferences').fadeIn();
  $('html, body').animate({
        scrollTop: $("#delivery_preferences").offset().top
    }, 1000);
});


function updateModuleDescriptions(){
  var raw = parseInt($('#box_raw_num').val());
  var cook = parseInt($('#box_cook_num').val());
  var fruit = parseInt($('#box_fruit_num').val());

  //change the headers to be appropriate
  switch(raw){
    case 0:
      $('#box_raw_num_text').text('No');
      $('#box_raw_num_qty').text('None of this type included');
      break;
    case 1:
      $('#box_raw_num_text').text('Small');
      $('#box_raw_num_qty').text('Enough for 2+ large salads');
      break;
    case 2:
      $('#box_raw_num_text').text('Medium');
      $('#box_raw_num_qty').text('Enough for 4+ large salads');
      break;
    case 3:
      $('#box_raw_num_text').text('Large');
      $('#box_raw_num_qty').text('Enough for 6+ large salads');
      break;
  }
  switch(cook){
    case 0:
      $('#box_cook_num_text').text('No');
      $('#box_cook_num_qty').text('None of this type included');
      break;
    case 1:
      $('#box_cook_num_text').text('Small');
      $('#box_cook_num_qty').text('Enough for 2+ dishes');
      break;
    case 2:
      $('#box_cook_num_text').text('Medium');
      $('#box_cook_num_qty').text('Enough for 4+ dishes');
      break;
    case 3:
      $('#box_cook_num_text').text('Large');
      $('#box_cook_num_qty').text('Enough for 6+ dishes');
      break;
  }
  switch(fruit){
    case 0:
      $('#box_fruit_num_text').text('No');
      $('#box_fruit_num_qty').text('None of this type included');
      break;
    case 1:
      $('#box_fruit_num_text').text('Small');
      $('#box_fruit_num_qty').text('4-8 pieces');
      break;
    case 2:
      $('#box_fruit_num_text').text('Medium');
      $('#box_fruit_num_qty').text('8-16 pieces');
      break;
    case 3:
      $('#box_fruit_num_text').text('Large');
      $('#box_fruit_num_qty').text('12-24 pieces');
      break;
  }

  //fade in the right item set
  $('.raw_panel_subs').hide();
  $('.cook_panel_subs').hide();
  $('.fruit_panel_subs').hide();
  $('#raw_sub_' + raw).fadeIn();
  $('#cook_sub_' + cook).fadeIn();
  $('#fruit_sub_' + fruit).fadeIn();
}

function staticForSelect(){
  $(".static-select").hide();
  $("#customize-toggle").hide();
  $('#box_raw_num').show();
  $('#box_cook_num').show();
  $('#box_fruit_num').show();
}

function selectForStatic(){
  $('#box_raw_num').hide();
  $('#box_cook_num').hide();
  $('#box_fruit_num').hide();
  $("#customize-toggle").fadeIn();
  $(".static-select").show();
}


function selectToPrice(){
  accordionSelect();

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
        $('#sample-box-title').text("What's inside a Raw Box");
        break;
      case 2:
        setModules(1,1,1);
        $('#sample-box-title').text("What's inside a Variety Box");
        break;
      case 3:
        $('#sample-box-title').text("What's inside a Custom Box");
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
  var raw_int = parseInt($('#box_raw_num').val());
  var cook_int = parseInt($('#box_cook_num').val());
  var fruit_int = parseInt($('#box_fruit_num').val());

  var subtotal = (raw_int + cook_int + fruit_int)*8;
  var shipping;

  if (subtotal<=8) {
    $('#sample-box-title').text("Minimum order of $10 - please increase order");
    shipping = 4;
  } else if (subtotal < 40) {
    $('#sample-box-title').text("What's inside a Custom Box");
    shipping = 4;
  } else {
    shipping = 0;
  }
  $("#price_sum").text(subtotal.toString());
  $('#price_delivery').text((shipping).toString());
  $('#price_total').text((subtotal+shipping).toString());

}

//function to disable accordion clicks and make selects, options focus on themselves
function accordionSelect(){
  $('.accordion').find('select').click(function(event){
    event.stopPropagation(); // this is
    event.preventDefault(); // the magic
    $(this).focus();
  });

  $('.accordion').find('select').children().focusout(function(event){
    event.stopPropagation(); // this is
    event.preventDefault(); // the magic
        $(this).focus();

  });
}

