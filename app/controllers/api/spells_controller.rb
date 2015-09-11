class Api::SpellsController < ApplicationController

  before_action :set_spell, only: [:show, :update, :destroy]

  # GET /api/spells
  def index
    @spells = Spell.all

    render json: @spells
  end

  # GET /api/spells/:id
  def show
    authorize @spell

    render json: @spell
  end

  # POST /api/spells
  def create
    @spell = current_user.spells.new(spell_params)
    authorize @spell

    if @spell.save
      render json: @spell, status: :created, location: [:api, @spell]
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/spells/:id
  def update
    authorize @spell

    if @spell.update(spell_params)
      render json: @spell
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/spells/:id
  def destroy
    authorize @spell
    @spell.destroy

    render nothing: true, status: :no_content
  end

  private

    def set_spell
      @spell = Spell.find(params[:id])
    end

    def spell_params
      params.require(:spell).permit(:name, :description)
    end

end
