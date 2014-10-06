class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  before_action :set_comments, only: [:show]
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
    end

    def set_comments
      @comments = Comment.includes(:article).where(article_id: @article.id).paginate(page: params[:page])
      @co = []
      @ca = []

      @comments.each do |a|
        @co << a if a.master_comment_id.nil?
      end
      childs = Comment.where(article_id: @article.id).where("master_comment_id is not null").uniq
      @co.each_with_index do |co, i|
        @ca << co
        childs.each do |ch|
          if ch.master_comment_id == co.id
            @ca.push(ch)
          end
        end
      end
    end
    def article_params
      params.require(:article).permit(:description)
    end
end
