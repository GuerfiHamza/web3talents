class JobApplicationPolicy < ApplicationPolicy

  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    record.job.user == user
  end

  def new?
    true
  end

  def create?
    true
  end

  def show?
    record.user == user || record.job.user == user
  end

  def edit?
    record.user == user
  end

  def destroy?
    record.job.user == user
  end

  def update?
    record.job.user == user
  end

  private

  
end
