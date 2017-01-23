
  //adds active state to the current page on load
  $( document ).on('turbolinks:load', function() {
      var currentPage = $(location).attr('pathname').split('/').pop();
      var currentPageBase = $(location).attr('pathname').split('/')[1];
      console.log(currentPageBase);
      console.log(currentPage);

      if(currentPage == "edit") {
        return false
      } else if(isNaN(currentPage)){

        $('#navbar li').each(function () {
          var itemId = $(this).attr('id');

          //we check the currentPage matches the Id
          if (itemId.indexOf(currentPage) >= 0) {
              $(this).addClass("active");
              return false;
          }
        });

      } else {

         $('#navbar li').each(function () {
           var itemId = $(this).attr('id');

           //we check the currentPage matches the Id
           if (itemId.indexOf(currentPageBase) >= 0) {
               $(this).addClass("active");
               return false;
           }
         });
       }



    $("#hero-button").on("click", function(e) {
      e.preventDefault();
      console.log("scroll");

          var section = $(this).attr("href");
          $("html, body").animate({
              scrollTop: $(section).offset().top
          });
        });


    $("#enter-nav-scroll").on("click", function(e) {
      e.preventDefault();
      console.log("scroll");

      if (window.location.pathname == "/") {

          var section = $(this).attr("href");
          console.log(section);
          $("html, body").animate({
              scrollTop: $(section).offset().top
          });

      } else {

        window.location.href = "/#enter-now"

      }

    });

  });
