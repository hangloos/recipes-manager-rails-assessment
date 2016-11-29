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
        $("#ratings_search_location").html("")
        response.forEach(function(e){
          if (e.rating == parseInt(searchNumber)) {
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
    event.preventDefault();
    
     $.ajax({
      type: "POST",
      dataType: "JSON",
      url: "/recipes",
      data: $(this).serialize(),
      success: function(response){
        var newRecipe = new Recipe(response)
          newRecipe.appendToDom()
          $('#recipe_name')[0].value = ""
          $('#recipe_status')[0].value = "1"
          $('#recipe_instructions')[0].value = ""
          $('#recipe_ingredients_attributes_name')[0].value = ""
          $('#recipe_ingredients_attributes_quantity')[0].value = ""
          
      }
     })
  //   // get all of the values from the form 
  //   // make a post request to /recipes
  //   // have the recipes controller render json for @recipe instead of redirecting 
  //   // create new JS Recipe and append to DOM .

   })

   $('.new_recipe_link').on("click", function(event){
    event.preventDefault()

     $("#newrecipeform").append("<% j render('/recipes/_form') %>")
    // $("#newrecipeform").toggle();
   })

  }


  function Recipe(attributes) {
    this.name = attributes.name
    this.id = attributes.id
    if(attributes.status == true){
      this.status = "Cooked Already"
    } else {
      this.status = "Have Not Cooked"
    }
  }

  Recipe.prototype.appendToDom = function() {
    $('#recipename').before('<li>' + '<a href=' + `/recipes/${this.id}>` + this.name + '</a>' + "-" + this.status + '</li>')
  }
