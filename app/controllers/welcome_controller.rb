class WelcomeController < ApplicationController
  def home
    @sports = Sport.all
    @article = Article.all
  end

end
