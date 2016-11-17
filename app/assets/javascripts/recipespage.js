 $(function(){
  eventListeners();
  });




 function eventListeners(){

  $("#cookedrecipe").on("click", function(event){
    $("#cooked_html_location").append("You have cooked this recipe! Now add a comment!")
    $("#cooked_location_2").html("")
    var idData = event.target.href.slice(30)
    var url = '/change_status'
    $.post(url, idData, function(success){
      $("#new_comment_form").html("")
      $("#new_comment_form").append("<%= j render('/comments/form') %>")
    })

      


  })


  $(".new_comment").on("submit", function(event){
    event.preventDefault();
  })


  }
