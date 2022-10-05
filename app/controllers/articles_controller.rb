class ArticlesController < ApplicationController

  http_basic_authenticate_with name: "irha", password: "123", except: [:index, :show]

  before_action :set_article, only: [:edit,:update,:show,:destroy]
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(articles_params)
    if @article.save
      flash[:notice] = "Article Added Successfully"
      redirect_to article_path(@article)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end
  
  def update
    if @article.update(articles_params)
      flash[:notice] = "Article Updated Successfully"
      redirect_to article_path(@article)
    else

      render 'edit', status: :unprocessable_entity
    end

  end

  def show
  end

  def destroy
    @article.destroy
    flash[:notice] = "Article Deleted Successfully"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    def articles_params
      params.require(:article).permit(:title,:body, :status)
    end
end
