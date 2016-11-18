 $(function(){
  eventListeners();
  });




 function eventListeners(){

  $("#cookedrecipe").on("click", function(event){
    $("#cooked_html_location").append("You have cooked this recipe! Now add a comment!")
    $("#cooked_location_2").html("")
    var idData = document.getElementById("hidden_recipe_id").innerHTML
    var url = '/change_status'
    $.post(url, idData, function(success){
      $("#new_comment_form").html("")
      $("#new_comment_form").append("<%= j render('/comments/form') %>")
    })

  })


  $(".new_comment").on("submit", function(event){
    event.preventDefault()
    $.ajax({
      type: "POST",
      url: this.action, 
      data: $(this).serialize(),
      success: function(response){
      $("#rating_comments_list").append(response)
      $("#comment_rating").val("")
      $("#comment_comments").val("")
      
       } 
    })

  })


  }
