class Ingredient < ActiveRecord::Base

  include Ownable

  belongs_to :spell

  delegate :owner, to: :spell

  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }

end
