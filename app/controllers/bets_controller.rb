class BetsController < ApplicationController

    def index
        @bets = Bet.all 
    end

    def new 
        @bet = Bet.new
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def delete 
    end

    private
    

   
end
