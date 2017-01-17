
  //
  // $(window).bind('beforeunload', function(){
  //     $('#navbar li').each(function(){
  //         $(this).removeClass("active");
  //     });
  // });


  //adds active state to the current page on load
  $( document ).on('turbolinks:load', function() {
      var currentPage = $(location).attr('pathname').replace('/', '');
      $('#navbar li').each(function () {
          var itemId = $(this).attr('id');

          //we check the currentPage matches the Id
          if (itemId.indexOf(currentPage) >= 0) {
              $(this).addClass("active");
              return false;
          }
      });


    $("#hero-button").on("click", function(e) {
      e.preventDefault();
      console.log("scroll");

          var section = $(this).attr("href");
          $("html, body").animate({
              scrollTop: $(section).offset().top
          });
        });

  });
