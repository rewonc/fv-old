
//checkout page
$('#terms_reveal').hide();
$('#terms_button').show();
$('#agree').click(function(){
  $('#terms_button').hide();
  $('#terms_reveal').fadeIn(50);
  $('#agree').attr("disabled", true);
});

//zip code -- check based upon value

//create an associative array, indexed by zip, that has description of location
//and when we will start deliveries
//1 = current service. 2 = 2 weeks. 3 = 4 weeks. 4 = 6 weeks. 5 = springtime.

var zipArray = new Object();
//Le Bronx
zipArray['06520'] = {'zipcode': '06520', 'description': 'New Haven, CT', 'ready': 5}
zipArray['10453'] = {'zipcode': '10453', 'description': 'Central Bronx', 'ready': 4}
zipArray['10457'] = {'zipcode': '10457', 'description': 'Central Bronx', 'ready': 4}
zipArray['10460'] = {'zipcode': '10460', 'description': 'Central Bronx', 'ready': 4}
zipArray['10458'] = {'zipcode': '10458', 'description': 'Bronx Park and Fordham', 'ready': 4}
zipArray['10467'] = {'zipcode': '10467', 'description': 'Bronx Park and Fordham', 'ready': 4}
zipArray['10468'] = {'zipcode': '10468', 'description': 'Bronx Park and Fordham', 'ready': 4}
zipArray['10451'] = {'zipcode': '10451', 'description': 'High Bridge and Morrisania', 'ready': 4}
zipArray['10452'] = {'zipcode': '10452', 'description': 'High Bridge and Morrisania', 'ready': 4}
zipArray['10456'] = {'zipcode': '10456', 'description': 'High Bridge and Morrisania', 'ready': 4}
zipArray['10454'] = {'zipcode': '10454', 'description': 'Hunts Point and Mott Haven', 'ready': 4}
zipArray['10455'] = {'zipcode': '10455', 'description': 'Hunts Point and Mott Haven', 'ready': 4}
zipArray['10459'] = {'zipcode': '10459', 'description': 'Hunts Point and Mott Haven', 'ready': 4}
zipArray['10474'] = {'zipcode': '10474', 'description': 'Hunts Point and Mott Haven', 'ready': 4}
zipArray['10463'] = {'zipcode': '10463', 'description': 'Kingsbridge and Riverdale', 'ready': 4}
zipArray['10471'] = {'zipcode': '10471', 'description': 'Kingsbridge and Riverdale', 'ready': 4}
zipArray['10466'] = {'zipcode': '10466', 'description': 'Northeast Bronx', 'ready': 4}
zipArray['10469'] = {'zipcode': '10469', 'description': 'Northeast Bronx', 'ready': 4}
zipArray['10470'] = {'zipcode': '10470', 'description': 'Northeast Bronx', 'ready': 4}
zipArray['10475'] = {'zipcode': '10475', 'description': 'Northeast Bronx', 'ready': 4}
zipArray['10461'] = {'zipcode': '10461', 'description': 'Southeast Bronx', 'ready': 4}
zipArray['10462'] = {'zipcode': '10462', 'description': 'Southeast Bronx', 'ready': 4}
zipArray['10464'] = {'zipcode': '10464', 'description': 'Southeast Bronx', 'ready': 4}
zipArray['10465'] = {'zipcode': '10465', 'description': 'Southeast Bronx', 'ready': 4}
zipArray['10472'] = {'zipcode': '10472', 'description': 'Southeast Bronx', 'ready': 4}
zipArray['10473'] = {'zipcode': '10473', 'description': 'Southeast Bronx', 'ready': 4}
//Brooklyn
zipArray['11212'] = {'zipcode': '11212', 'description': 'Central Brooklyn', 'ready': 1}
zipArray['11213'] = {'zipcode': '11213', 'description': 'Central Brooklyn', 'ready': 1}
zipArray['11216'] = {'zipcode': '11216', 'description': 'Central Brooklyn', 'ready': 1}
zipArray['11233'] = {'zipcode': '11233', 'description': 'Central Brooklyn', 'ready': 1}
zipArray['11238'] = {'zipcode': '11238', 'description': 'Central Brooklyn', 'ready': 1}
zipArray['11209'] = {'zipcode': '11209', 'description': 'Southwest Brooklyn', 'ready': 3}
zipArray['11214'] = {'zipcode': '11214', 'description': 'Southwest Brooklyn', 'ready': 3}
zipArray['11228'] = {'zipcode': '11228', 'description': 'Southwest Brooklyn', 'ready': 3}
zipArray['11204'] = {'zipcode': '11204', 'description': 'Borough Park', 'ready': 1}
zipArray['11218'] = {'zipcode': '11218', 'description': 'Borough Park', 'ready': 1}
zipArray['11219'] = {'zipcode': '11219', 'description': 'Borough Park', 'ready': 1}
zipArray['11230'] = {'zipcode': '11230', 'description': 'Borough Park', 'ready': 1}
zipArray['11234'] = {'zipcode': '11234', 'description': 'Canarsie and Flatlands', 'ready': 3}
zipArray['11236'] = {'zipcode': '11236', 'description': 'Canarsie and Flatlands', 'ready': 3}
zipArray['11239'] = {'zipcode': '11239', 'description': 'Canarsie and Flatlands', 'ready': 3}
zipArray['11223'] = {'zipcode': '11223', 'description': 'Southern Brooklyn', 'ready': 3}
zipArray['11224'] = {'zipcode': '11224', 'description': 'Southern Brooklyn', 'ready': 3}
zipArray['11229'] = {'zipcode': '11229', 'description': 'Southern Brooklyn', 'ready': 3}
zipArray['11235'] = {'zipcode': '11235', 'description': 'Southern Brooklyn', 'ready': 3}
zipArray['11201'] = {'zipcode': '11201', 'description': 'Northwest Brooklyn', 'ready': 3}
zipArray['11205'] = {'zipcode': '11205', 'description': 'Northwest Brooklyn', 'ready': 3}
zipArray['11215'] = {'zipcode': '11215', 'description': 'Northwest Brooklyn', 'ready': 3}
zipArray['11217'] = {'zipcode': '11217', 'description': 'Northwest Brooklyn', 'ready': 3}
zipArray['11231'] = {'zipcode': '11231', 'description': 'Northwest Brooklyn', 'ready': 3}
zipArray['11203'] = {'zipcode': '11203', 'description': 'Flatbush', 'ready': 1}
zipArray['11210'] = {'zipcode': '11210', 'description': 'Flatbush', 'ready': 1}
zipArray['11225'] = {'zipcode': '11225', 'description': 'Flatbush', 'ready': 1}
zipArray['11226'] = {'zipcode': '11226', 'description': 'Flatbush', 'ready': 1}
zipArray['11207'] = {'zipcode': '11207', 'description': 'East New York and New Lots', 'ready': 3}
zipArray['11208'] = {'zipcode': '11208', 'description': 'East New York and New Lots', 'ready': 3}
zipArray['11211'] = {'zipcode': '11211', 'description': 'Greenpoint', 'ready': 1}
zipArray['11222'] = {'zipcode': '11222', 'description': 'Greenpoint', 'ready': 1}
zipArray['11220'] = {'zipcode': '11220', 'description': 'Sunset Park', 'ready': 1}
zipArray['11232'] = {'zipcode': '11232', 'description': 'Sunset Park', 'ready': 1}
zipArray['11206'] = {'zipcode': '11206', 'description': 'Bushwick and Williamsburg', 'ready': 1}
zipArray['11221'] = {'zipcode': '11221', 'description': 'Bushwick and Williamsburg', 'ready': 1}
zipArray['11237'] = {'zipcode': '11237', 'description': 'Bushwick and Williamsburg', 'ready': 1}
//Manghattan
zipArray['10026'] = {'zipcode': '10026', 'description': 'Central Harlem', 'ready': 4}
zipArray['10027'] = {'zipcode': '10027', 'description': 'Central Harlem', 'ready': 4}
zipArray['10030'] = {'zipcode': '10030', 'description': 'Central Harlem', 'ready': 4}
zipArray['10037'] = {'zipcode': '10037', 'description': 'Central Harlem', 'ready': 4}
zipArray['10039'] = {'zipcode': '10039', 'description': 'Central Harlem', 'ready': 4}
zipArray['10001'] = {'zipcode': '10001', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10011'] = {'zipcode': '10011', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10018'] = {'zipcode': '10018', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10019'] = {'zipcode': '10019', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10020'] = {'zipcode': '10020', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10036'] = {'zipcode': '10036', 'description': 'Chelsea and Clinton', 'ready': 1}
zipArray['10029'] = {'zipcode': '10029', 'description': 'East Harlem', 'ready': 4}
zipArray['10035'] = {'zipcode': '10035', 'description': 'East Harlem', 'ready': 4}
zipArray['10010'] = {'zipcode': '10010', 'description': 'Gramercy Park and Murray Hill', 'ready': 1}
zipArray['10016'] = {'zipcode': '10016', 'description': 'Gramercy Park and Murray Hill', 'ready': 1}
zipArray['10017'] = {'zipcode': '10017', 'description': 'Gramercy Park and Murray Hill', 'ready': 1}
zipArray['10022'] = {'zipcode': '10022', 'description': 'Gramercy Park and Murray Hill', 'ready': 1}
zipArray['10012'] = {'zipcode': '10012', 'description': 'Greenwich Village and Soho', 'ready': 1}
zipArray['10013'] = {'zipcode': '10013', 'description': 'Greenwich Village and Soho', 'ready': 1}
zipArray['10014'] = {'zipcode': '10014', 'description': 'Greenwich Village and Soho', 'ready': 1}
zipArray['10004'] = {'zipcode': '10004', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10005'] = {'zipcode': '10005', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10006'] = {'zipcode': '10006', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10007'] = {'zipcode': '10007', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10038'] = {'zipcode': '10038', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10280'] = {'zipcode': '10280', 'description': 'Lower Manhattan', 'ready': 1}
zipArray['10002'] = {'zipcode': '10002', 'description': 'Lower East Side', 'ready': 1}
zipArray['10003'] = {'zipcode': '10003', 'description': 'Lower East Side', 'ready': 1}
zipArray['10009'] = {'zipcode': '10009', 'description': 'Lower East Side', 'ready': 1}
zipArray['10021'] = {'zipcode': '10021', 'description': 'Upper East Side', 'ready': 1}
zipArray['10028'] = {'zipcode': '10028', 'description': 'Upper East Side', 'ready': 1}
zipArray['10044'] = {'zipcode': '10044', 'description': 'Upper East Side', 'ready': 1}
zipArray['10128'] = {'zipcode': '10128', 'description': 'Upper East Side', 'ready': 1}
zipArray['10023'] = {'zipcode': '10023', 'description': 'Upper West Side', 'ready': 1}
zipArray['10024'] = {'zipcode': '10024', 'description': 'Upper West Side', 'ready': 1}
zipArray['10025'] = {'zipcode': '10025', 'description': 'Upper West Side', 'ready': 1}
zipArray['10031'] = {'zipcode': '10031', 'description': 'Inwood and Washington Heights', 'ready': 4}
zipArray['10032'] = {'zipcode': '10032', 'description': 'Inwood and Washington Heights', 'ready': 4}
zipArray['10033'] = {'zipcode': '10033', 'description': 'Inwood and Washington Heights', 'ready': 4}
zipArray['10034'] = {'zipcode': '10034', 'description': 'Inwood and Washington Heights', 'ready': 4}
zipArray['10040'] = {'zipcode': '10040', 'description': 'Inwood and Washington Heights', 'ready': 4}
//QUEENS
zipArray['11361'] = {'zipcode': '11361', 'description': ' Northeast Queens', 'ready': 4}
zipArray['11362'] = {'zipcode': '11362', 'description': ' Northeast Queens', 'ready': 4}
zipArray['11363'] = {'zipcode': '11363', 'description': ' Northeast Queens', 'ready': 4}
zipArray['11364'] = {'zipcode': '11364', 'description': ' Northeast Queens', 'ready': 4}
zipArray['11354'] = {'zipcode': '11354', 'description': ' North Queens', 'ready': 4}
zipArray['11355'] = {'zipcode': '11355', 'description': ' North Queens', 'ready': 4}
zipArray['11356'] = {'zipcode': '11356', 'description': ' North Queens', 'ready': 4}
zipArray['11357'] = {'zipcode': '11357', 'description': ' North Queens', 'ready': 4}
zipArray['11358'] = {'zipcode': '11358', 'description': ' North Queens', 'ready': 4}
zipArray['11359'] = {'zipcode': '11359', 'description': ' North Queens', 'ready': 4}
zipArray['11360'] = {'zipcode': '11360', 'description': ' North Queens', 'ready': 4}
zipArray['11365'] = {'zipcode': '11365', 'description': ' Central Queens', 'ready': 4}
zipArray['11366'] = {'zipcode': '11366', 'description': ' Central Queens', 'ready': 4}
zipArray['11367'] = {'zipcode': '11367', 'description': ' Central Queens', 'ready': 4}
zipArray['11412'] = {'zipcode': '11412', 'description': ' Jamaica', 'ready': 4}
zipArray['11423'] = {'zipcode': '11423', 'description': ' Jamaica', 'ready': 4}
zipArray['11432'] = {'zipcode': '11432', 'description': ' Jamaica', 'ready': 4}
zipArray['11433'] = {'zipcode': '11433', 'description': ' Jamaica', 'ready': 4}
zipArray['11434'] = {'zipcode': '11434', 'description': ' Jamaica', 'ready': 4}
zipArray['11435'] = {'zipcode': '11435', 'description': ' Jamaica', 'ready': 4}
zipArray['11436'] = {'zipcode': '11436', 'description': ' Jamaica', 'ready': 4}
zipArray['11101'] = {'zipcode': '11101', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11102'] = {'zipcode': '11102', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11103'] = {'zipcode': '11103', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11104'] = {'zipcode': '11104', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11105'] = {'zipcode': '11105', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11106'] = {'zipcode': '11106', 'description': ' Northwest Queens', 'ready': 4}
zipArray['11374'] = {'zipcode': '11374', 'description': ' West Central Queens', 'ready': 4}
zipArray['11375'] = {'zipcode': '11375', 'description': ' West Central Queens', 'ready': 4}
zipArray['11379'] = {'zipcode': '11379', 'description': ' West Central Queens', 'ready': 4}
zipArray['11385'] = {'zipcode': '11385', 'description': ' West Central Queens', 'ready': 4}
zipArray['11691'] = {'zipcode': '11691', 'description': ' Rockaways', 'ready': 4}
zipArray['11692'] = {'zipcode': '11692', 'description': ' Rockaways', 'ready': 4}
zipArray['11693'] = {'zipcode': '11693', 'description': ' Rockaways', 'ready': 4}
zipArray['11694'] = {'zipcode': '11694', 'description': ' Rockaways', 'ready': 4}
zipArray['11695'] = {'zipcode': '11695', 'description': ' Rockaways', 'ready': 4}
zipArray['11697'] = {'zipcode': '11697', 'description': ' Rockaways', 'ready': 4}
zipArray['11004'] = {'zipcode': '11004', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11005'] = {'zipcode': '11005', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11411'] = {'zipcode': '11411', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11413'] = {'zipcode': '11413', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11422'] = {'zipcode': '11422', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11426'] = {'zipcode': '11426', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11427'] = {'zipcode': '11427', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11428'] = {'zipcode': '11428', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11429'] = {'zipcode': '11429', 'description': ' Southeast Queens', 'ready': 4}
zipArray['11414'] = {'zipcode': '11414', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11415'] = {'zipcode': '11415', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11416'] = {'zipcode': '11416', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11417'] = {'zipcode': '11417', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11418'] = {'zipcode': '11418', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11419'] = {'zipcode': '11419', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11420'] = {'zipcode': '11420', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11421'] = {'zipcode': '11421', 'description': ' Southwest Queens', 'ready': 4}
zipArray['11368'] = {'zipcode': '11368', 'description': ' West Queens', 'ready': 4}
zipArray['11369'] = {'zipcode': '11369', 'description': ' West Queens', 'ready': 4}
zipArray['11370'] = {'zipcode': '11370', 'description': ' West Queens', 'ready': 4}
zipArray['11372'] = {'zipcode': '11372', 'description': ' West Queens', 'ready': 4}
zipArray['11373'] = {'zipcode': '11373', 'description': ' West Queens', 'ready': 4}
zipArray['11377'] = {'zipcode': '11377', 'description': ' West Queens', 'ready': 4}
zipArray['11378'] = {'zipcode': '11378', 'description': ' West Queens', 'ready': 4}
//done








//Now lets check if what they input is what we have
$("#box_zip").change(function(){
  var zipcode = parseZipcode($("#box_zip").val());
  if (zipcode in zipArray) {
    alert(zipArray[zipcode]['ready'] + ' <-- time, in: ' + zipArray[zipcode]['description'])
  } else {
    alert('nonexistent');
  }
})

//hide form elements replace w/ js
$(".box-select").hide();
$("#delivery_preferences").hide();
selectForStatic();
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

//frequency select changes the text
$('#box_frequency').change(function(){
  switch($(this).val()){
    case '1':
      $('#total_period').text('week');
      break;
    case '2':
      $('#total_period').text('2 weeks');
      break;
    case '4':
      $('#total_period').text('month');
      break;
    default:
      $('#total_period').text('week');
  }

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


function parseZipcode(zipcode){
  return zipcode;
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
        $('#sample-box-title').text("A sample winter Raw Box");
        break;
      case 2:
        setModules(1,1,1);
        $('#sample-box-title').text("A sample winter Variety Box");
        break;
      case 3:
        $('#sample-box-title').text("A sample winter Custom Box");
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
    $('#sample-box-title').text("A sample winter Custom Box");
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


