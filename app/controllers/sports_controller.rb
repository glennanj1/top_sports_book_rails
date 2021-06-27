class SportsController < ApplicationController

    def index  
        Sport.create_sports
        @sports = Sport.all 
    end

end
