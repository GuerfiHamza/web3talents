class FeedController < ApplicationController
  def index
    @posts = Post.includes(:comments, :likes, :user).all
    @jobs = Job.all
  end
end
