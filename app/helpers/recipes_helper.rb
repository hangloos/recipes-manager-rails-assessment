module RecipesHelper

   def ratings_search(rating)
    @rating_comments = Comment.where(rating: rating)
    @all_comments = current_user.comments
    @comments = @rating_comments & @all_comments
    @comments.map do |comment|
      comment.recipe.name
    end
  end

  def status_changed_to_cooked_helper(recipe)
    if recipe.status
      return "- Cooked"
    end
  end


end
