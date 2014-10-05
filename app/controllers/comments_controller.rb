class CommentsController < ApplicationController
  def create
    @article = Article.find_by_id(params[:article_id])
    if params[:comment][:master_comment_id]
      @comment = Comment.find_by_id(params[:comment][:master_comment_id])
      @comment.child_comments.create(comments_params.merge(article_id: @article.id))
    else
      @article.comments.create(comments_params)
    end
    redirect_to article_path(@article)
  end

  private
    def comments_params
      params.require(:comment).permit(:description, :master_comment_id)
    end
end
