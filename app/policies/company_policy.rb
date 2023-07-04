class CompanyPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def update?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def new?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def create?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def edit?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

  def destroy?
    # NOTE: Be explicit about which records you allow access to!
    true
  end

end
