$(document).ready(function() {
    // Show all items initially
    $(".menu-item").fadeIn();

    $(".filter").click(function() {
        const filterValue = $(this).attr("data-filter");

        // Add active class to the clicked category
        $(".filter").removeClass("active");
        $(this).addClass("active");

        // Filter items based on the category
        if (filterValue === "all") {
            $(".menu-item").fadeIn();
        } else {
            $(".menu-item").hide();
            $(".menu-item[data-category='" + filterValue + "']").fadeIn();
        }
    });
});
