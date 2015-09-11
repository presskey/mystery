class Api::IngredientsController < ApplicationController

  before_action :set_spell, only: [:index, :create]
  before_action :set_ingredient, only: [:show, :update, :destroy]

  # GET /api/spells/:spell_id/ingredients
  def index
    @ingredients = @spell.ingredients

    render json: @ingredients
  end

  # GET /api/ingredients/:id
  def show
    authorize @ingredient

    render json: @ingredient
  end

  # POST /api/spells/:spell_id/ingredients
  def create
    @ingredient = @spell.ingredients.new(ingredient_params)
    authorize @ingredient

    if @ingredient.save
      render json: @ingredient, status: :created, location: [:api, @ingredient]
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/ingredients/:id
  def update
    authorize @ingredient

    if @ingredient.update(ingredient_params)
      render json: @ingredient
    else
      render json: @ingredient.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/ingredients/:id
  def destroy
    authorize @ingredient
    @ingredient.destroy

    render nothing: true, status: :no_content
  end

  private

    def set_spell
      @spell = Spell.find(params[:spell_id])
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params
      params.require(:ingredient).permit(:name, :quantity)
    end

end
