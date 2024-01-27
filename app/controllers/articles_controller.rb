class ArticlesController < ApplicationController
  #
  def index
    @articles = Article.all
  end
  
  #
  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to root_path, status: :see_other
  end

  # Strong Parameters to filter params. We specify what values are allowed in that Hash. 
  # Otherwise, a malicious user could potentially submit extra form fields and overwrite private data
  private
  def article_params
    params.require(:article).permit(:title, :body)
  end
end
