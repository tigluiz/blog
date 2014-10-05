class ArticlesController < ApplicationController
  before_action :set_article, only: [:show]
  def index
    @article = Article.new
    @articles = Article.page(params[:page])
  end

  def show
    @comment = Comment.new
    @co = Comment.where(id: @comments.map(&:id)).paginate(page: params[:page] || 1, per_page: 5)
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
      @comments = []#Comment.includes(:article).where(article_id: @article.id).all#.page(params[:page]).per(40)
      Comment.where(article_id: @article.id).each do |a|
        @comments << a if a.master_comment_id.nil?
      end
      child = Comment.where(article_id: @article.id).where("master_comment_id is not null")
      @comments.each_with_index do |co, i|
        child.each do |ch|
          if ch.master_comment_id == co.id
            @comments.insert(i+1, ch)
          end
        end
      end
      @comments
    end

    def article_params
      params.require(:article).permit(:description)
    end
end
