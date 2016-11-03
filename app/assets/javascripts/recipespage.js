 $(function(){
  attachListeners();
  });



function attachListeners(){

  $("#showrecipes").on("click", function(){
    showrecipes()
  })


  function showrecipes(){
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
  } 
