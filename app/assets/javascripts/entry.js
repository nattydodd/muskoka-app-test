$(function() {


    $('.filter-button').on('click', function() {

      var filterName = $(this).html();
      console.log(filterName);

      var url = window.location.pathname
      console.log(url);
      var user = url.substr(url.lastIndexOf('/') + 1);
      console.log(user);

      $.ajax({
        url: '/entries/',
        method: 'GET',
        data: {},
        dataType: 'JSON'
      }).done(function(response) {
        console.log(response);
        console.log(user);

        var entry

        for (var i = 0; i < response.length; i++) {
          if ( response[i].user_id === parseInt(user) ) {
            entry = response[i].id
          }
        }

        console.log(entry);

        $.ajax({
          // beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
          url: '/entries/' + entry + '/update/',
          type: 'PUT',
          data: { avatar: {url: 'test'} },
          dataType: 'JSON'
        }).fail(function() {
            console.log("failed");
        }).done(function(response) {
            console.log(response);
        });




      });

    });


});
