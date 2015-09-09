class Spell < ActiveRecord::Base

  belongs_to :user
  has_many :ingredients

  validates :name, presence: true

end
