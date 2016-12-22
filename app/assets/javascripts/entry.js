$(function() {

    // get the url of the entry image
    const URL = $('#entry_image img').attr('src');
    // split the image url
    const FIRST = URL.substring(0, URL.indexOf("upload/"));
    const LAST = URL.split("upload/")[1];

    $('.filter-button').on('click', function() {

      // get the name of the filter and add e_art: to it
      var filterName = 'e_art:' + $(this).html() + '/';

      // add the filter to the middle of it
      var filtered = FIRST + "upload/" + filterName + LAST

      // assign it to the image
      $('#entry_image img').attr('src', filtered );

      // check the url
      var url = $('#entry_image img').attr('src');
      console.log(url);

      //
      // var url = window.location.pathname
      // console.log(url);
      // var user = url.substr(url.lastIndexOf('/') + 1);
      // console.log(user);
      //
      // $.ajax({
      //   url: '/entries/',
      //   method: 'GET',
      //   data: {},
      //   dataType: 'JSON'
      // }).done(function(response) {
      //   console.log(response);
      //   console.log(user);
      //
      //   var entry
      //
      //   for (var i = 0; i < response.length; i++) {
      //     if ( response[i].user_id === parseInt(user) ) {
      //       entry = response[i].id
      //     }
      //   }
      //
      //   console.log(entry);
      //
      //   $.ajax({
      //     // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
      //     url: '/entries/' + entry + '/edit/',
      //     type: 'PUT',
      //     data: { avatar: {url: 'test'} },
      //     dataType: 'JSON'
      //   }).fail(function() {
      //       console.log("failed");
      //   }).done(function(response) {
      //       console.log(response);
      //   });
      //
      //
      //
      //
      // });

    });


});
