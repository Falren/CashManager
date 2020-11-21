class ArticlesController < ApplicationController
 
  before_action :set_article, except: %i[new create index]

  def index 
    @articles = Article.all
  end

  def new 
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else 
      render :show
    end
  end

  def edit; end

  def update
    if @article.update
      redirect_to root_path
    else 
      render :edit
    end
  end

  def delete
    if @article.delete
      redirect_to root_path
    else 
      render 'companies/index'
    end
  end

  private
 
  def set_article 
    @article = Article.find(params[:id])
  end

  def article
    @article ||= (params[:action] == 'new' ? Article.new : @article = Article.new(article_params))
  end

  def article_params
    params.require(:article).permit(:name)
  end
end
