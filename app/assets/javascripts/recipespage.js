 $(function(){
  attachListeners();
  });


function attachListeners(){$("#showrecipes").on("click", function(){
  $.get('/recipes.json', function(data){
    var recipes = data


    //recipes.forEach(function(recipe){
      $("#recipename").html(data[4].name)
      $("#recipecooked").html(data[4].status)
      $("#recipeuser").html(data[4].user_id)


    //})
  })
});
}

