class BetsController < ApplicationController
    
    def index
        if params[:odd_id] && @odd = Odd.find(params[:odd_id])
            @bets = @odd.bets 
        else
            @bets = Bet.all
        end
    end

    def risky_bets
        @bets = Bet.risky_bets
    end

    def show 
        @bet = Bet.find(params[:id])
    end

    def new 
        # key = Odd.find_by(params[:odd_id]).sport_key
        # id = Odd.find_by(params[:odd_id]).sport_id
        # helpers.bet_helper(key, id)
        if params[:odd_id] && @odd = Odd.find(params[:odd_id])
            @bet = Bet.new(odd_id: params[:odd_id])
        else
            @bet = Bet.new
        end
    end

    def create 
        @bet = Bet.new(bet_params)
        @bet.user_id = current_user.id
        @bet.odd_id = params[:odd_id]

        if params[:odd_id]
            @odd = Odd.find(params[:odd_id])
        end
    
        if @bet.save 
            redirect_to odd_bets_path
        else
            render :new 
        end
    end

    def edit 
        @bet = Bet.find(params[:id])
    end

    def update 
        @bet = Bet.find(params[:id])
        @bet.update(bet_params)
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
            params.require(:bet).permit(:amount, :team, :odds)
        end
    
end

    
    
