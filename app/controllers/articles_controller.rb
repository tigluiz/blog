class ArticlesController < ApplicationController
  def index
    @article = Article.new
    @articles = Article.all
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

    def article_params
      params.require(:article).permit(:description)
    end
end
