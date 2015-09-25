class ArticlesController < ApplicationController
  def index
  	@articles = Article.all   # @articles gets passed to the associated view
  end

  def show
  	@article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
#  	render plain: "Here are the passed parameters: #{params[:article].inspect}"
#  @article = Article.new(params[:article])  # Unauthorized, we must whitelist our params
  # Additionally, we move the whitelisting to a private method, article_params
    @article = Article.new(article_params)
  
  # For validation, we want the user to see that they've failed the min title length
    if @article.save
      redirect_to @article   # redirects to the show action
    else
      render 'new'  # render instead of redirect_to, because render will pass the @article object back to the 'new' template. redirect_to would tell the browser to issue another request
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
