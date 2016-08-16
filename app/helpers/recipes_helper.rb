module RecipesHelper

   def ratings_search(rating)
    @rating_comments = Comment.where(rating: rating)
    @all_comments = current_user.comments
    @comments = @rating_comments & @all_comments
    @comments.each do |comment|
      return "#{comment.recipe.name}"
    end
  end


end
