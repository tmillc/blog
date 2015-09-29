class CommentsController < ApplicationController
	http_basic_authenticate_with name: "bloop", password: "bleep", only: :destroy
	
	def create
		@article = find_article
		@comment = @article.comments.create(comment_params)
		# redirect_to articles_path would bring us to All Articles after making a comment
		redirect_to article_path(@article)

	end

	def destroy
		@article = find_article
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end

	private
	  def comment_params
	  	params.require(:comment).permit(:commenter, :body)
	  end

	  def find_article
        Article.find(params[:article_id])
      end

end
