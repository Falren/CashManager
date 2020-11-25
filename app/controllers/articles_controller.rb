# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :find_article, except: %i[new create index]
  before_action :article, only: %i[new create]
  def index
    @articles = Article.order(created_at: :desc)
  end

  def new; end

  def create
    @article.assign_attributes(article_params)
    if @article.save
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to(root_path)
    else
      render(:edit)
    end
  end

  def destroy
    if @article.destroy
      redirect_to(root_path)
    else
      redirect_to(articles_path)
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end

  def article
    @article ||= Article.new
  end

  def article_params
    params.require(:article).permit(:name)
  end
end
