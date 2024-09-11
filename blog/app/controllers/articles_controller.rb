class ArticlesController < ApplicationController
  
  def index
    @articles = Article.all
    @current_user = User.find_by_id(session[:user_id]) #<%= @current_user.username %>
  end

  def show
    @article = Article.find(params[:id])
    @current_user = User.find_by_id(session[:user_id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      redirect_to request.referrer, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end


  private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
