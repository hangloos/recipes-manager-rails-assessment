class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @recipe = set_recipe
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    if @comment.recipe.user != current_user
      redirect_to root_path
    end
  end

  # GET /comments/new
  def new
    @recipe = set_recipe
    @comment = @recipe.comments.build
  end

  # GET /comments/1/edit
  def edit
    @recipe = set_recipe
    if @comment.recipe.user != current_user
      redirect_to root_path
    end
  end

  # POST /comments
  # POST /comments.json
  def create
    @recipe = set_recipe
    @comment = @recipe.comments.build(comment_params)
    
       if @comment.save
        #create a comments show view that shows one LI. 
        render 'comments/show', :layout => false
      else
        render 'recipes/show'
      end
  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    @recipe = set_recipe
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @recipe, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @recipe = set_recipe
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:rating, :comments, :recipe_id)
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
end
