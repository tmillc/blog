class WelcomeController < ApplicationController
  def index
  	@rand = { num: calcRandom }
  end

  private
    def calcRandom
    	rand(50)
    end
end
