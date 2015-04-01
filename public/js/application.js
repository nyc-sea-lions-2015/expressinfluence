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

$('#comment_form_submit').on('submit',function(e){
    e.preventDefault();
      $.ajax({
      url: "/comment/new",
      type: "post",
      data: $('#comment_form').serialize(),
      success: function(response){
        console.log(response)
        $('.comment_table').first().append(response)
      },
      error: function(response){
        console.log(response.status)
      }
    })
    });
});
