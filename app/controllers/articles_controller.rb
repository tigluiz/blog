class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @article = Article.new
    @articles = Article.page(params[:page])
  end

  def show
    @comment = Comment.new
  end

  def create
    @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to :back, notice: 'Article was successfully created.' }
        format.json { render :back, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_article
      @article = Article.find(params[:id])
      as = 5 - Comment.where(article_id: 1).size < 1 ? 1 : Comment.where(article_id: 1).size
      @comments = @article.comments.page(params[:page]).per(as)
    end

    def article_params
      params.require(:article).permit(:description)
    end
end
