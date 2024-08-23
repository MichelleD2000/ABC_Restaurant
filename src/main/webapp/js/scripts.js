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
		
		// Show the scroll-to-top button when scrolling down
		window.onscroll = function() {
		    scrollFunction();
		};

		function scrollFunction() {
		    const scrollTopBtn = document.getElementById("scrollTopBtn");
		    if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		        scrollTopBtn.style.display = "block";
		    } else {
		        scrollTopBtn.style.display = "none";
		    }
		}

		

	
		
		
  