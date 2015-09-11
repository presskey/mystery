require 'rails_helper'

describe IngredientPolicy do

  let(:spell) { create(:spell) }
  let(:ingredient) { create(:ingredient, spell: spell) }
  subject { described_class }

  context "for guest user" do
    let(:user) { build(:user) }

    permissions :show? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :create? do
      it "denies access" do
        expect(subject).not_to permit(user, ingredient)
      end
    end

    permissions :update? do
      it "denies access" do
        expect(subject).not_to permit(user, ingredient)
      end
    end

    permissions :destroy? do
      it "denies access" do
        expect(subject).not_to permit(user, ingredient)
      end
    end
  end

  context "for admin user" do
    let(:user) { create(:user, :admin) }

    permissions :show? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :create? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :update? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :destroy? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end
  end

  context "for regular user" do
    let(:user) { create(:user) }

    permissions :show? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :create? do
      it "grants access" do
        expect(subject).to permit(user, ingredient)
      end
    end

    permissions :update? do
      context "when user owns record" do
        let(:spell) { create(:spell, owner: user)}

        it "grants access" do
          expect(subject).to permit(user, ingredient)
        end
      end
      context "when user doesnt own record" do
        it "denies access" do
          expect(subject).not_to permit(user, ingredient)
        end
      end
    end

    permissions :destroy? do
      context "when user owns record" do
        let(:spell) { create(:spell, owner: user)}

        it "grants access" do
          expect(subject).to permit(user, ingredient)
        end
      end
      context "when user doesnt own record" do
        it "denies access" do
          expect(subject).not_to permit(user, ingredient)
        end
      end
    end
  end
end

