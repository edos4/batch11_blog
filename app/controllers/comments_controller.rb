class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_article

  def index
    @comments = @article.comments
  end

  def new
    @comment = @article.comments.build
  end

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_comment_path(@article.id, @comment.id)
    else
      render :new
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def edit
    @comment = Comment.find(params[:id]) 
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to article_comment_path(@article.id, @comment.id)
    end
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to article_path(@article.id)
  end

  private

  def get_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
