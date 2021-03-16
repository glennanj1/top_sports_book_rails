class BetsController < ApplicationController
    

    def index
        @bets = Bet.all
    end

    def show 
        @bet = Bet.find(params[:id])
    end

    def new 
        @odd = Odd.find(params[:odd_id])
        @bet = Bet.new(odd_id: params[:odd_id])
    end

    def create 
       
        @bet = Bet.new(bet_params)
        
        @bet.user_id = current_user.id
        @bet.odd_id = params[:odd_id]
        if @bet.save 
            redirect_to odd_bets_path
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

    def bet_params
        params.require(:bet).permit(:amount)
    end
    
    

   
end
