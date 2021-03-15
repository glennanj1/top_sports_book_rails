class BetsController < ApplicationController

    def index
        @bets = Bet.all 
    end

    def new 
        @bet = Bet.new
    end
    

   
end
