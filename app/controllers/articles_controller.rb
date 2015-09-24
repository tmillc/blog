class ArticlesController < ApplicationController
  def new
  end

  def create
  	render plain: "Here are the passed parameters: #{params[:article].inspect}"
  end
end
