$(document).ready(function() {

  $('#new_comment_button').on('click',function(e){
    e.preventDefault();
    console.log(e);
    var href = $('#new_comment_button').attr('href')
    console.log(href)
    $.ajax({
      url: href,
      type: "get",
      success: function(response){
        $('#form_slot').append(response)
      },
      error: function(response){
        console.log(response.status);
      }
    });
});

  $('#delete_form').on('click', function(e){
      e.preventDefault();

      var $target = $(event.target);
      var href = $('#action').attr('action')

      $.ajax({
        type: "DELETE",
        url: href,
      }).done(function(response){
        $target.parents('.comment_table').remove()
      });
  });
});
