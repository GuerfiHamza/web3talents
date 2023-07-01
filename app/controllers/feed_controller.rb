class FeedController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = Post.includes(:comments, :likes, :user).all
    @jobs = Job.all
  end
end
