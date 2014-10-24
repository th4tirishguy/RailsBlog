class PostController < ApplicationController
	def index
		@posts = Post.all.order(created_at: :desc)
	end

  def new
  	@post = Post.new
  end

  def show
  	@post = Post.find(id=params[:id])
  end

  def new_post
  	@post = Post.new
  	@post.title = params[:post][:title]
  	@post.body = params[:post][:body]
  	if @post.save
  		redirect_to({action: 'index' })
  	else
  		redirect_to({ action: 'new' })
  	end
  end
end
