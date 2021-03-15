class LeaguesController < ApplicationController

    def index 
        @leagues = League.all
    end



end
