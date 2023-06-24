class FeedController < ApplicationController
  before_action :require_login
  def index
    @posts = Post.includes(:comments, :likes, :user).all
    @jobs = Job.all
  end
end
