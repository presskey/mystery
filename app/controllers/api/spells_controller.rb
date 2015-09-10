class Api::SpellsController < ApplicationController

  before_action :set_spell, only: [:show, :update, :destroy]

  # GET /api/spells
  def index
    @spells = Spell.all

    render json: @spells
  end

  # GET /api/spells/1
  def show
    render json: @spell
  end

  # POST /api/spells
  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      render json: @spell, status: :created, location: [:api, @spell]
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/spells/1
  def update
    if @spell.update(spell_params)
      render json: @spell
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/spells/1
  def destroy
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
