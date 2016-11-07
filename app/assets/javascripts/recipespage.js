 $(function(){
  attachListeners();
  });



function attachListeners(){

  $("#showRecipes").on("click", function(event){
    showRecipes()
    event.preventDefault();
  })

  $('form').on("submit", function(event){
    var recipeName = $('#recipe_name').val()
    var recipeStatus = $('#recipe_status').val()
    var recipeInstructions = $('#recipe_instructions').val()
    var recipeUser = $('#recipe_user_id').val()
    createRecipe(event)
    event.preventDefault();
  })


  }


  function showRecipes(){
  $.getJSON('/recipes', function(data){
    $("tbody").text("")
    data.forEach(function(recipe){
      if(recipe.user_id.toString() === user_id){
      var recipelink = "/recipes/" + recipe.id
      $("tbody").append('<li><a href="' + recipelink + '">' + recipe.name+'</a></li>')
      }
    })
  })
  }

  function createRecipe(data){
    $.ajax({
      url: '/recipes',
      method: 'POST',
      dataType: 'json',
      data: {
        recipe: {
          name: name, status: status
        }
      },
      success: function(data){
      }
    })

  }



