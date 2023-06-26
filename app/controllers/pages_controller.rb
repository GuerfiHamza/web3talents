class PagesController < ApplicationController
  def home
    authorize :index, policy_class: HomePolicy
  end
end
