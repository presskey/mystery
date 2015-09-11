class User < ActiveRecord::Base

  has_many :spells

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  def guest?
    !persisted?
  end

  def admin?
    admin && !guest?
  end

end
