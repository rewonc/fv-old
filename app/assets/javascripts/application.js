// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require mixitup
//= require sortelements
//= require_tree .

$(document).foundation();


//sorting functions...
$(function() {
	
	$( ".sortable" ).find('th')

	.append("<span class='sortarrows'>&uarr;&darr;</div>")
    .hover(function(){
        $(this).addClass('highlightSearch');
    }, function(){
        $(this).removeClass('highlightSearch');
    })

	.each(function(){
		var th = $(this),
      	thIndex = th.index(),
        inverse = false,
        table = th.closest('table');


		th.click(function(){
            table.find('td').filter(function(){
                return $(this).index() === thIndex;
            }).sortElements(function(a, b){
                
                return $.text([a]) > $.text([b]) ?
                    inverse ? -1 : 1
                    : inverse ? 1 : -1;
                
            }, function(){
               
                // parentNode is the element we want to move
                return this.parentNode; 
                
            });
            
            inverse = !inverse;
                
        });                
	});
});


$("#search-lastweek").keyup(function () {
    var value = this.value.toLowerCase().trim();

    $(".sortable").find("tr").each(function (index) {
        if (!index) return;
        $(this).find("td").each(function () {
            var id = $(this).text().toLowerCase().trim();
            var not_found = (id.indexOf(value) == -1);
            $(this).closest('tr').toggle(!not_found);
            return not_found;
        });
    });
});


