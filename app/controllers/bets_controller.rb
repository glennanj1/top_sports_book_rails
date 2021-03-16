class BetsController < ApplicationController

    def index
        @bet = Bet.all
    end

    def show 
        @bet = Bet.find(params[:id])
    end

    def new 
        @bet = Bet.new
    end

    def create 
        @bet = Bet.new(bet_params)
        if @bet.save 
            redirect_to bets_path
        else
            raise.params.inspect
            render :new 
        end
    end

    def edit 
        @bet = Bet.find(params[:id])
    end

    def update 
        @bet = Bet.find(params[:id])
        @bet.update(bet_params(:odd))
        if @bet.valid? 
            redirect_to odd_bet_path 
        else
            render :edit 
        end
    end

    def destroy
        @bet = Bet.find(params[:id])
        @bet.destroy 
        redirect_to odd_bets_path 
    end

    private

    def bet_params(*args)
        params.require(:bet).permit(*args)
    end
    

   
end
