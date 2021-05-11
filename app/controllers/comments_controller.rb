class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, except: [:create]

  def create
    # @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to @post
  end

  def edit
    # @post = Post.find(params[:post_id])
    # @comment = Comment.find(params[:id])
  end

  def update
    # @comment = Comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @post
  end

  def destroy
    # @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @post
  end

  private
    def comment_params
      params.require(:comment).permit(:name, :content)
    end

    # look up post using the id parameter of Post Object and
    # assign it to post instance variable
    def set_post
      @post = Post.find(params[:post_id])
    end

    # EXTRA CREDIT
    # look up comment using the id parameter of Comment Object and
    # assign it to comment instance variable
    def set_comment
      @comment = Comment.find(params[:id])
    end
end
