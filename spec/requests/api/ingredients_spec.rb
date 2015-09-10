require 'rails_helper'

describe "Api::Ingredients" do

  describe "GET /api/spells/:spell_id/ingredients.json" do
    let(:spell) { create(:spell) }
    let!(:spell_ingredients) { create_list(:ingredient, 5, spell: spell) }
    let!(:other_ingredients) { create_list(:ingredient, 2) }

    subject { get api_spell_ingredients_path(spell, format: 'json') }

    before { subject }

    it "works" do
      expect(response).to be_success
    end

    it "shows all spell ingredients" do
      expect(json.map{|s| s['id']}).to eq spell_ingredients.map{|s| s['id']}
    end
  end

  describe "GET /api/ingredients/:id.json" do
    let(:ingredient) { create(:ingredient) }
    subject { get api_ingredient_path(ingredient, format: 'json') }

    before { subject }

    it "works" do
      expect(response).to be_success
    end

    it "shows requested ingredient" do
      expect(json['name']).to eq ingredient.name
      expect(json['quantity']).to eq ingredient.quantity
    end
  end

  describe "POST /api/spells/:spell_id/ingredients.json" do
    let(:spell) { create(:spell) }
    subject { post api_spell_ingredients_path(spell, format: 'json'), ingredient: ingredient_params }

    context "with invalid params" do
      let(:ingredient_params) { {wrong: 'parameter'} }

      it "responds with unprocessable entity" do
        subject
        expect(response).to be_unprocessable
      end
    end

    context "with valid params" do
      let(:ingredient_params) { attributes_for(:ingredient) }

      it "works" do
        subject
        expect(response).to be_created
      end

      it "creates ingredient" do
        expect{subject}.to change(Ingredient, :count).by(1)
      end

      it "shows created ingredient" do
        subject
        created_ingredient = Ingredient.last
        expect(json['name']).to eq created_ingredient.name
        expect(json['quantity']).to eq created_ingredient.quantity
      end

      it "sets ingredient spell_id attribute" do
        subject
        expect(Ingredient.last.spell_id).to eq spell.id
      end
    end
  end

  describe "PATCH/PUT /api/ingredients/:id.json" do
    let(:ingredient) { create(:ingredient) }
    subject { patch api_ingredient_path(ingredient, format: 'json'), ingredient: ingredient_params }

    context "with invalid params" do
      let(:ingredient_params) { {name: ''} }

      it "responds with unprocessable entity" do
        subject
        expect(response).to be_unprocessable
      end
    end

    context "with valid params" do
      let(:ingredient_params) { {name: Faker::Lorem.word} }

      it "works" do
        subject
        expect(response).to be_success
      end

      it "updates specified ingredient" do
        subject
        expect(ingredient.reload.name).to eq(ingredient_params[:name])
      end

      it "shows updated ingredient" do
        subject
        expect(json['name']).to eq(ingredient.reload.name)
      end
    end
  end

  describe "DELETE /api/ingredients/:id.json" do
    let!(:ingredient) { create(:ingredient) }
    subject { delete api_ingredient_path(ingredient, format: 'json') }

    it "works" do
      subject
      expect(response).to be_success
    end

    it "deletes ingredient" do
      expect{subject}.to change(Ingredient, :count).by(-1)
    end
  end

end
