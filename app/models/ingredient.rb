class Ingredient < ActiveRecord::Base

  belongs_to :spell

  validates :name, presence: true
  validates :quantity, numericality: { greater_than: 0, only_integer: true }

end
