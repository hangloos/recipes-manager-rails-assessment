class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:show, :edit, :update, :destroy]

  # GET /ingredients
  # GET /ingredients.json
  def index
    @ingredients = Ingredient.all
    @recipe = set_recipe
  end

  # GET /ingredients/1
  # GET /ingredients/1.json
  def show
    if @ingredient.recipes.each{|recipe| recipe.user != current_user}
      redirect_to root_path
    end
  end

  # GET /ingredients/new
  def new
    
    #@recipe = set_recipe
    #@ingredient = @recipe.ingredients.build
  end

  # GET /ingredients/1/edit
  def edit
    @recipe = set_recipe
    if @recipe.user != current_user
      redirect_to root_path
    end
  end

  # POST /ingredients
  # POST /ingredients.json
  def create
    @recipe = set_recipe
    @ingredient = @recipe.ingredients.build(ingredient_params)


    respond_to do |format|
      if @ingredient.save
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully created.' }
        format.json { render :show, status: :created, location: @ingredient }
      else
        format.html { render :new }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingredients/1
  # PATCH/PUT /ingredients/1.json
  def update
    @recipe = set_recipe
    respond_to do |format|
      if @ingredient.update(ingredient_params)
        format.html { redirect_to @recipe, notice: 'Ingredient was successfully updated.' }
        format.json { render :show, status: :ok, location: @ingredient }
      else
        format.html { render :edit }
        format.json { render json: @ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingredients/1
  # DELETE /ingredients/1.json
  def destroy
    @ingredient.destroy
    @recipe = set_recipe
    respond_to do |format|
      format.html { redirect_to @recipe, notice: 'Ingredient was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity, :recipe_id)
    end

    def set_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end
end
