class ArticlesController < ApplicationController
  # skip_before_action :require_login, except: [:destroy]
  skip_before_action :require_login, only: [:index]

  def index
    @articles = Article.all.order(rating: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(permit_params)
    if @article.save
      redirect_to root_url
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
  end

  private
  def permit_params
    params.require(:article).permit(:title, :description, :content, :reference_url, :github_url)
  end

end
