class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!


  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = current_user.recipes
    @recipe = Recipe.new
    respond_to do |format|
      format.html
      format.json {render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @comment = Comment.new
    @comments = @recipe.comments.order(created_at: :desc).page(params[:page])
    if @recipe.user != current_user
      redirect_to root_path
    end
  end

  # GET /recipes/new
  def new
    #@recipe = current_user.recipes.build
    #@ingredients = 2.times {@recipe.ingredients.build}
    #@recipe.recipe_categories.build.build_category
  end

  # GET /recipes/1/edit
  def edit
    if @recipe.user != current_user
      redirect_to root_path
    end
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def change_status
    @recipe = set_recipe
    @recipe.status = true
    @recipe.save
    redirect_to recipe_path(@recipe)
  end


  def get_current_user
    render json: {id: current_user.id}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :status, :user_id, :instructions, :ingredients_attributes => [:id,:name,:quantity])
    end

   
end
