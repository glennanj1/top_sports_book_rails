class WelcomeController < ApplicationController
  def home
    @sports = Sport.all
  end
end
