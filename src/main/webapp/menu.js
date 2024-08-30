$(document).ready(function() {
    // When a category is clicked
    $(".filter").click(function() {
        // Get the category to filter
        var category = $(this).attr("data-filter");
        
        // Hide all items
        $(".menu-item").hide();
        
        // Show only items that match the selected category
        $(".menu-item[data-category='" + category + "']").show();
        
        // Remove active class from all filters and add to the clicked one
        $(".filter").removeClass("active");
        $(this).addClass("active");
    });
});


$(document).ready(function(){
    // Example of a simple scroll to section (if you have more sections)
    $('nav a').on('click', function(e){
        if(this.hash !== "") {
            e.preventDefault();
            var hash = this.hash;
            $('html, body').animate({
                scrollTop: $(hash).offset().top
            }, 800, function(){
                window.location.hash = hash;
            });
        }
    });
});
