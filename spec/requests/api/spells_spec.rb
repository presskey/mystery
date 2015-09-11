require 'rails_helper'

describe "Api::Spells" do

  let(:admin) { create(:user, :admin) }
  
  before { authenticate(admin) }

  describe "GET /api/spells.json" do
    subject { get api_spells_path(format: 'json') }
    let!(:spells) { create_list(:spell, 5) }

    before { subject }

    it "works" do
      expect(response).to be_success
    end

    it "shows all spells" do
      expect(json.map{|s| s['id']}).to eq spells.map{|s| s['id']}
    end
  end

  describe "GET /api/spells/:id.json" do
    let(:spell) { create(:spell) }
    subject { get api_spell_path(spell, format: 'json') }

    before { subject }

    it "works" do
      expect(response).to be_success
    end

    it "shows requested spell" do
      expect(json['name']).to eq spell.name
      expect(json['description']).to eq spell.description
    end
  end

  describe "POST /api/spells.json" do
    subject { post api_spells_path(format: 'json'), spell: spell_params }

    context "with invalid params" do
      let(:spell_params) { {wrong: 'parameter'} }

      it "responds with unprocessable entity" do
        subject
        expect(response).to be_unprocessable
      end
    end

    context "with valid params" do
      let(:spell_params) { attributes_for(:spell) }

      it "works" do
        subject
        expect(response).to be_created
      end

      it "creates spell" do
        expect{subject}.to change(Spell, :count).by(1)
      end

      it "shows created spell" do
        subject
        created_spell = Spell.last
        expect(json['name']).to eq created_spell.name
        expect(json['description']).to eq created_spell.description
      end
    end
  end

  describe "PATCH/PUT /api/spells/:id.json" do
    let(:spell) { create(:spell) }
    subject { patch api_spell_path(spell, format: 'json'), spell: spell_params }

    context "with invalid params" do
      let(:spell_params) { {name: ''} }

      it "responds with unprocessable entity" do
        subject
        expect(response).to be_unprocessable
      end
    end

    context "with valid params" do
      let(:spell_params) { {name: Faker::Lorem.word} }

      it "works" do
        subject
        expect(response).to be_success
      end

      it "updates specified spell" do
        subject
        expect(spell.reload.name).to eq(spell_params[:name])
      end

      it "shows updated spell" do
        subject
        expect(json['name']).to eq(spell.reload.name)
      end
    end
  end

  describe "DELETE /api/spells/:id.json" do
    let!(:spell) { create(:spell) }
    subject { delete api_spell_path(spell, format: 'json') }

    it "works" do
      subject
      expect(response).to be_success
    end

    it "deletes spell" do
      expect{subject}.to change(Spell, :count).by(-1)
    end
  end

end
