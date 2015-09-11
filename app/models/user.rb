class User < ActiveRecord::Base

  has_secure_password
  
  has_many :spells

  validates :username, presence: true, uniqueness: true

  def guest?
    !persisted?
  end

  def admin?
    admin && !guest?
  end

end
