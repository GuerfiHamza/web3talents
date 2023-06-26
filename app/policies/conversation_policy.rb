class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  
  def show?
    record.sender == user || record.recipient == user
  end

  def create_message?
    record.sender == user || record.recipient == user

  end
end
