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

  $(".ratings_search_form").on("submit", function(event){
    $.ajax({
      type: "GET",
      url: '/comments',
      dataType: 'JSON',
      success: function(response){
        var searchNumber = $("#ratings_search_value").val()
        response.forEach(function(e){
          if (e.rating == searchNumber) {
            $("#ratings_search_location").append('<li>'+ "<a href=" + `/recipes/${e.recipe.id}` +`>${e.recipe.name}</a>` + "-" + Date(e.created_at) + "-" + e.comments + "-" + e.rating + '</li>')
          }
        })
      }
    })

    event.preventDefault()
  })

  $("#showRecipes").on("click", function(event){
    $.ajax({
      type: "GET",
      url: '/recipes',
      dataType: 'JSON',
      success: function(response){
        response.forEach(function(recipe){
          var newRecipe = new Recipe(recipe)
          newRecipe.appendToDom()
        })
      }
    })

  })

   $(".new_recipe").on("submit", function(event){
    alert("You got it!!")
     $.ajax({
      type: "POST",
      url: "/recipes",
      data: $(this).serialize(),
      success: function(response){
        debugger
      }
     })
     event.preventDefault()
  //   // get all of the values from the form 
  //   // make a post request to /recipes
  //   // have the recipes controller render json for @recipe instead of redirecting 
  //   // create new JS Recipe and append to DOM .

   })

  }


  function Recipe(attributes) {
    this.name = attributes.name
  }

  Recipe.prototype.appendToDom = function() {
    $('#recipename').append('<li>' + this.name + '</li>')
  }
