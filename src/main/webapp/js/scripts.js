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


        document.addEventListener('DOMContentLoaded', function() {
            const btn = document.querySelector('.cta-btn');

            btn.addEventListener('mouseover', function() {
                btn.style.backgroundColor = '#d35400';
            });

            btn.addEventListener('mouseout', function() {
                btn.style.backgroundColor = '#e67e22';
            });
        });
  