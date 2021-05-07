class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end  

  def permitted_attributes
    if user.full_access?
      [:name, :email, :password, :password_confirmation, :role]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      scope.all
      if user.full_access?
        scope.all
      else
        scope.with_restricted_access
      end
    end
  end
end
