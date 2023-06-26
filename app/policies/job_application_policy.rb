class JobApplicationPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    if record.empty? || record.first.job.user == user
      true
    else
      false
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.job.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.job.user == user || record.user == user
  end

  def update?
    true
  end

end
