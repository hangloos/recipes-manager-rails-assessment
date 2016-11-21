 $(function(){
  eventListeners();
  });




 function eventListeners(){

  $("#cookedrecipe").on("click", function(event){
    $("#cooked_html_location").append("You have cooked this recipe! Now add a comment!")
    $("#cooked_location_2").html("")
    
    var idData = {id: document.getElementById("hidden_recipe_id").innerHTML}
    var url = '/change_status'

    $.ajax({
      type: "POST",
      url: url,
      data: idData,
      success: function(response){
        $("#new_comment_form").html("")
        html = "<% j render('/recipes/new_comment_form') %>"
        $("#new_comment_form").append(html)
      }
    })

   })


  $(".new_comment").on("submit", function(event){
    
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
    event.preventDefault()

  })



  }
