 $(function(){
  attachListeners();
  });



function attachListeners(){$("#showrecipes").on("click", function(){

  $.get('/recipes.json', function(data){
    var recipes = data
    data.forEach(function(recipe){
      
      if(recipe.user_id.toString() === user_id){
      //$("tbody").append("<li>" + recipe.name + "</li>")
      var recipelink = "/recipes/" + recipe.id
      $("tbody").append('<li><a href="' + recipelink + '">' + recipe.name+'</a></li>')
      }
    })
  })
})
}
