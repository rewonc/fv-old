//filter function

function resetFilters(){
    $(".sortable").find("tr").show();
    $(".filters").find("dd").removeClass("active");
}

$(".filters")
    .find('a').click(function(){
    resetFilters();
    //console.log($(this).data());
    var category = $(this).data("category");
    if (category) {
        $(".sortable").find("tr").not(':first').not("[data-category='" + category +"']").hide();
        $(this).closest("dd").addClass("active")
    } else{
        $(".showall").addClass("active");
    }
});


//sort function

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

//search function

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



