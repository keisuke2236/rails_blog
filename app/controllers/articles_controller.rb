# 記事データの取得・保存を行う
class ArticlesController < ApplicationController
  # curl -X POST http://localhost:8080/articles -H 'Content-Type: application/json' -d '{"article": {"title": "New Article", "date": "2021-01-01", "tags": "test", "author": "John Doe", "contentHtml": "Article content"}}'
  def create
    article = Article.new(article_params)

    if article.save
      render json: article, status: :created
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  def show
    article = Article.find(params[:id])
    render json: article
  end

  # curl -X GET http://localhost:8080/articles -H 'Content-Type: application/json'
  def index
    # 記事ですべてのデータを取得する
    articles = Article.all.order(date: :desc)
    render json: articles
  end

  private

  def article_params
    params.require(:article).permit(:title, :date, :tags, :author, :slide, :contentHtml)
  end
end


