class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
  end

  def new
  end

  def create
#  	render plain: "Here are the passed parameters: #{params[:article].inspect}"
#  @article = Article.new(params[:article])  # Unauthorized, we must whitelist our params
  # Additionally, we move the whitelisting to a private method
  @article = Article.new(article_params)

  @article.save
  redirect_to @article   # redirects to the show action
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
