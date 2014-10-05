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
      @comments = Comment.includes(:article).where(article_id: @article.id).paginate(page: params[:page], per_page: 9)
    end

    def article_params
      params.require(:article).permit(:description)
    end
end
