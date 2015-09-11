class Spell < ActiveRecord::Base

  include Ownable

  belongs_to :user
  has_many :ingredients, dependent: :destroy

  alias_attribute :owner, :user

  validates :name, presence: true

end
