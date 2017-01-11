$(function() {

  if (window.location.href.indexOf("entries") > -1) {
    $(".navbar-right").addClass("dark-nav");
  }



  // showing image preview
        function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
              $('#img_prev').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          }
        }

        $("#avatar-upload").change(function(){
          $('#img_prev').removeClass('hidden');
          readURL(this);
          $('#camera-upload').css("display", "none");
        });




    // get the url of the entry image
    const URL = $('#entry_image img').attr('src');
    // split the image url
    const FIRST = URL.substring(0, URL.indexOf("upload/"));
    const LAST = URL.split("upload/")[1];

    var newerUrl = ""

    $('.filter-button').on('click', function() {

      // get the name of the filter and add e_art: to it
      var filterName = 'e_art:' + $(this).html() + '/';

      // add the filter to the middle of it
      var filtered = FIRST + "upload/" + filterName + LAST

      // assign it to the image
      $('#entry_image img').attr('src', filtered );

      // assign the newUrl to a variable that updates
      newUrl = $('#entry_image img').attr('src');
      console.log(newUrl);

      newerUrl = newUrl.split("dx3z90dgl/")[1];
      console.log(newerUrl);


      $('#hidden-filter-send').val(newUrl);


    });


});
