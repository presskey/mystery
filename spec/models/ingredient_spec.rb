require 'rails_helper'

describe Ingredient do

  it { is_expected.to belong_to(:spell) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_numericality_of(:quantity).is_greater_than(0).only_integer }
  it { is_expected.to delegate_method(:owner).to(:spell) }

  it_behaves_like "ownable", :ingredient
end
