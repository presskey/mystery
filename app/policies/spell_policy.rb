class SpellPolicy < ApplicationPolicy

  def create?
    !user.guest?
  end

end
